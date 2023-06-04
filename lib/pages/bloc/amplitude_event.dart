part of 'amplitude_bloc.dart';

@immutable
abstract class AmplitudeEvent {}

class AmplitudeEmitterEvent extends AmplitudeEvent {
  final String eventName;
  final Map<String, dynamic>? eventProperties;

  AmplitudeEmitterEvent({required this.eventName, this.eventProperties});
}
