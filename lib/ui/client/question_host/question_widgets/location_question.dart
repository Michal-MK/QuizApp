import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quiz/comms/comms_client.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/proto_gen/questions.pb.dart';
import 'package:quiz/ui/client/question_host/question_widgets/question_base.dart';

class LocationQuestion extends StatefulWidget {
  final Question question;
  final CommunicationClient client;

  const LocationQuestion({
    required this.question,
    required this.client,
    super.key,
  });

  @override
  State<LocationQuestion> createState() => _LocationQuestionState();
}

class _LocationQuestionState extends State<LocationQuestion> {
  late GoogleMapController controller;

  final markers = <Marker>{};

  @override
  void didUpdateWidget(covariant LocationQuestion oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.question != oldWidget.question) {
      markers.clear();
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          const CameraPosition(
            target: LatLng(50.642230, 15.253824),
            zoom: 16,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return QuestionBase(
      question: widget.question,
      client: widget.client,
      onSend: () {
        if (markers.isEmpty) {
          return Future.error('No location selected');
        }
        return Future.value(
          AnswerRequest()
            ..answer = markers.first.position.toString()
            ..questionId = widget.question.id!
            ..clientUuid = widget.client.uuid
            ..clientName = widget.client.clientName,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Positioned.fill(
                child: GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(50.642230, 15.253824),
                    zoom: 16,
                  ),
                  onMapCreated: (controller) {
                    this.controller = controller;
                  },
                  zoomControlsEnabled: false,
                  markers: markers,
                  onTap: (argument) {
                    markers.clear();
                    setState(() {
                      markers.add(
                        Marker(
                          markerId: const MarkerId('x'),
                          position: argument,
                        ),
                      );
                    });
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Text(
                  markers.isEmpty ? 'Tap to set location' : '${markers.first.position.latitude.toStringAsFixed(6)}, ${markers.first.position.longitude.toStringAsFixed(6)}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
