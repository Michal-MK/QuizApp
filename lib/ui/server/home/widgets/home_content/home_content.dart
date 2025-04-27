import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        const Text("Home Content"),
        SizedBox(
          height: 200,
          child: ListView.separated(
            itemCount: vm.quizes?.length ?? 0,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                child: Button(
                  onPressed: () {
                    context.read<HomePaneVM>().viewQuiz(vm.quizes![index].id!);
                  },
                  child: Center(child: Text(vm.quizes![index].quizName)),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 8),
          ),
        ),
      ],
    );
  }
}
