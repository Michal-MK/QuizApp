import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/ui/server/home/home_pane_vm.dart';
import 'package:quiz/ui/server/home/widgets/home_content/home_vm.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    var vm = context.watch<HomeVM>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Quiz App", style: TextStyle(fontSize: 32)),
              SizedBox(height: 32),
              Text("Available quizes", style: TextStyle(fontSize: 24)),
              SizedBox(height: 16),
            ],
          ),
        ),
        SizedBox(
          height: 260,
          child: ListView.separated(
            itemCount: vm.quizes?.length ?? 0,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final item = vm.quizes![index];
              return QuizItem(item: item);
            },
            separatorBuilder: (context, index) => const SizedBox(width: 8),
          ),
        ),
      ],
    );
  }
}

class QuizItem extends StatelessWidget {
  const QuizItem({
    super.key,
    required this.item,
  });

  final Quiz item;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: () {
        context.read<HomePaneVM>().viewQuiz(item.id!);
      },
      child: SizedBox(
        width: 260,
        height: 260,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item.quizName,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            if (item.description != null) ...[
              const SizedBox(height: 8),
              Text(
                "${item.description}",
                textAlign: TextAlign.center,
              ),
            ],
            const SizedBox(height: 8),
            Text(
              "By: ${item.author}",
            ),
          ],
        ),
      ),
    );
  }
}
