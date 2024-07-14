import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/extensions/context_extensions.dart';
import 'package:quiz/pages/client/home/cubit/home_cubit.dart';
import 'package:quiz/pages/client/question_host/questions_host.dart';
import 'package:quiz/widgets/common/gap.dart';

class ClientHomePageContent extends StatefulWidget {
  const ClientHomePageContent({super.key});

  @override
  State<ClientHomePageContent> createState() => _ClientHomePageContentState();
}

class _ClientHomePageContentState extends State<ClientHomePageContent> {
  final TextEditingController clientNameController = TextEditingController();
  String? clientNameError;

  @override
  void initState() {
    super.initState();
    clientNameController.addListener(() {
      setState(() {
        clientNameError = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l.app_name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: clientNameController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: context.l.home_client_name,
                errorText: clientNameError,
              ),
            ),
            Gap.v16,
            Text(context.l.home_available_servers),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeServersDiscovered) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.services.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.services[index].name ?? "", style: const TextStyle(fontWeight: FontWeight.bold)),
                        onTap: () {
                          if (clientNameController.text.isEmpty || clientNameController.text.length < 3) {
                            setState(() {
                              clientNameError = context.l.home_client_name_validation_error;
                            });
                            return;
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuestionsHost(discovery: state.services[index], name: clientNameController.text),
                            ),
                          );
                        },
                      );
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}
