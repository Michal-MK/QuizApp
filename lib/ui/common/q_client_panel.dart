
import 'dart:math';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz/model/client_status.dart';
import 'package:quiz/ui/common/q_panel.dart';

class QClientPanel extends StatelessWidget {
  const QClientPanel({
    super.key,
    required this.clients,
  });

  final List<ClientStatus> clients;

  @override
  Widget build(BuildContext context) {
    return QPanel(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var client in clients)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Mica(
                    backgroundColor: client.color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                    child: Column(
                      children: [
                        Text(client.name, textAlign: TextAlign.center, style: const TextStyle(fontSize: 24)),
                        Lottie.asset(
                          "lib/assets/lottie/${client.answered ? 'ready' : 'thinking'}.json",
                          height: 100,
                          width: 100,
                          reverse: client.answered ? false : Random().nextBool(),
                          animate: true,
                          repeat: !client.answered,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}