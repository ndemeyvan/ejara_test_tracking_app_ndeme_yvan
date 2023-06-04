import 'dart:async';

import 'package:amplitude_flutter/amplitude.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'amplitude_event.dart';

part 'amplitude_state.dart';

class AmplitudeBloc extends Bloc<AmplitudeEvent, AmplitudeState> {
  late Amplitude amplitude;

  AmplitudeBloc({required this.amplitude}) : super(AmplitudeInitial()) {
    on<AmplitudeEmitterEvent>((event, emit) {
      // This is the default user Id get from an api as 001
      amplitude.setUserId("001");
      if (event.eventProperties == null) {
        amplitude.logEvent(event.eventName);
      } else {
        amplitude.logEvent(event.eventName, eventProperties: event.eventProperties);
      }
    });
  }
}
