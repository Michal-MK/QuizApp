import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nsd/nsd.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  List<Service> services = [];

  HomeCubit() : super(HomeInitial());

  Future<void> discoverServers() async {
    final discovery = await startDiscovery("_rpc._tcp");
    discovery.addListener(() {
      services = discovery.services;
      emit(HomeServersDiscovered(services));
    });
  }
}
