part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeServersDiscovered extends HomeState {
  final List<Service> services;

  HomeServersDiscovered(this.services);
}
