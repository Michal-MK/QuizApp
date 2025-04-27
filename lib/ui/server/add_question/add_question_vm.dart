import 'dart:io';

import 'package:drift/drift.dart';
import 'package:exif/exif.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/model/db/question_type.dart';

class AddQuestionVM extends ChangeNotifier {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController hintController = TextEditingController();
  final TextEditingController authorController = TextEditingController();

  final TextEditingController jeopardyWeightController = TextEditingController();

  final TextEditingController categoryController = TextEditingController();

  int selectedQuestionType = 0;

  final TextEditingController textAnswerController = TextEditingController();
  final TextEditingController numberAnswerController = TextEditingController();
  bool boolQuestionAnswer = false;
  final TextEditingController geolocationAnswerController = TextEditingController();
  final TextEditingController imageFilePathController = TextEditingController();

  final QuizDatabase db;

  AddQuestionVM(this.db);

  void boolQuestionAnswerChanged(bool value) {
    boolQuestionAnswer = value;
    notifyListeners();
  }

  Future selectImageFile() async {
    final FilePickerResult? filePath = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
      initialDirectory: Directory(Platform.resolvedExecutable).parent.path,
    );

    if (filePath != null) {
      imageFilePathController.text = filePath.files.single.path ?? '';
      final exif = await readExifFromBytes(await File(imageFilePathController.text).readAsBytes());
      String lat = "GPS GPSLatitude";
      String lon = "GPS GPSLongitude";
      String alt = "GPS GPSAltitude";
      String dt = "EXIF DateTimeOriginal";

      String latValue = exif[lat]!.printable;
      String lonValue = exif[lon]!.printable;
      String altValue = exif[alt]!.printable;
      String dtValue = exif[dt]!.printable;

      // [49, 18, 6777/625] [17, 14, 43449/2500]

      RegExp dmzRegex = RegExp(r'(?<d>\d+), (?<m>\d+), (?<s1>\d+)/(?<s2>\d+)');
      RegExp altRegex = RegExp(r'(?<d>\d+)/(?<m>\d+)');
      var match = dmzRegex.firstMatch(latValue);
      if(match != null) {
        double d = double.parse(match.namedGroup('d')!);
        double m = double.parse(match.namedGroup('m')!);
        double s1 = double.parse(match.namedGroup('s1')!);
        double s2 = double.parse(match.namedGroup('s2')!);
        double latDecimal = d + m/60 + s1/s2/3600;
        latValue = latDecimal.toString();
      }
      match = dmzRegex.firstMatch(lonValue);
      if(match != null) {
        double d = double.parse(match.namedGroup('d')!);
        double m = double.parse(match.namedGroup('m')!);
        double s1 = double.parse(match.namedGroup('s1')!);
        double s2 = double.parse(match.namedGroup('s2')!);
        double lonDecimal = d + m/60 + s1/s2/3600;
        lonValue = lonDecimal.toString();
      }
      match = altRegex.firstMatch(altValue);
      if(match != null) {
        double d = double.parse(match.namedGroup('d')!);
        double m = double.parse(match.namedGroup('m')!);
        double altDecimal = d /m;
        altValue = altDecimal.toString();
      }

      geolocationAnswerController.text = "$latValue $lonValue | ☁ $altValue 🕒 $dtValue";
    }
  }

  get questionTypesList => questionTypes
      .map(
        (e) => ComboBoxItem(value: e.id.value, child: Text(e.name)),
      )
      .toList();

  Future saveQuestion() async {
    final String question = questionController.text;
    String? hint = hintController.text;
    final String category = categoryController.text;
    final String author = authorController.text;
    final String jeopardyWeight = jeopardyWeightController.text;

    if (hint.isEmpty) {
      hint = null;
    }

    if (question.isEmpty || author.isEmpty || jeopardyWeight.isEmpty || category.isEmpty) {
      return;
    } else {
      var answer = saveAnswer(selectedQuestionType, textAnswerController.text, boolQuestionAnswer, numberAnswerController.text, geolocationAnswerController.text);
      if (answer.value == null || answer.value!.isEmpty) {
        return;
      }

      await db.into(db.questions).insert(
            QuestionsCompanion.insert(
              question: question,
              hint: hint == null ? const Value.absent() : Value.ofNullable(hint),
              answer: answer,
              type: selectedQuestionType,
              author: author,
              category: category,
              jeopardyWeight: int.parse(jeopardyWeight),
              image: Value.ofNullable(imageFilePathController.text),
            ),
          );
    }
  }

  void questionTypeChanged(int? value) {
    if (value == null) return;
    selectedQuestionType = value;
    notifyListeners();
  }

  Value<String?> saveAnswer(int selectedQuestionType, String textAns, bool boolAns, String numberAns, String locationAns) {
    switch (selectedQuestionType) {
      case 0:
        return Value(textAns);
      case 1:
        return Value(numberAns);
      case 3:
        return Value(boolAns ? 'true' : 'false');
      case 4:
        return Value(locationAns);
      default:
        return Value(textAns);
    }
  }
}
