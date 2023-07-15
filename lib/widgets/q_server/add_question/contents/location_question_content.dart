import 'package:fluent_ui/fluent_ui.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:quiz/widgets/q_server/add_question/contents/base_content.dart';

class LocationQuestionContent extends BaseQuestionContent {
  const LocationQuestionContent({
    required super.vm,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextBox(
          controller: vm.geolocationAnswerController,
          placeholder: 'Enter your LatLon coordinates here',
          maxLines: 1
        ),
        const SizedBox(height: 8),
        Button(
          child: const Text('Validate Location'),
          onPressed: () async {
            String text = vm.geolocationAnswerController.text;
            List<String> latlon = text.split(',');
            double latitude = double.parse(latlon[0]);
            double longitude = double.parse(latlon[1]);
            await MapsLauncher.launchCoordinates(latitude, longitude);
          },
        ),
      ],
    );
  }
}
