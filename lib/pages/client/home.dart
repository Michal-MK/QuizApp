import 'package:flutter/material.dart';
import 'package:nsd/nsd.dart';
import 'package:quiz/pages/client/questions_host.dart';
import 'package:quiz/pages/client/webview_page.dart';

class ClientHome extends StatefulWidget {
  const ClientHome({super.key});

  @override
  State<ClientHome> createState() => _ClientHomeState();
}

class _ClientHomeState extends State<ClientHome> {
  List<Service> services = [];
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    discoverServer();
  }

  Future discoverServer() async {
    final discovery = await startDiscovery("_rpc._tcp");
    discovery.addListener(() {
      setState(() {
        services = discovery.services;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebViewPage(),
                ),
              );
            },
            child: Text("Map"),
          ),
          const Text("Available servers"),
          ListView(
            shrinkWrap: true,
            children: [
              for (var service in services)
                ListTile(
                  title: Text(service.name ?? ""),
                  subtitle: Text(service.type ?? ""),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionsHost(discovery: service, name: nameController.text),
                      ),
                    );
                  },
                ),
            ],
          ),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Client name',
            ),
          ),
        ],
      ),
    );
  }
}
