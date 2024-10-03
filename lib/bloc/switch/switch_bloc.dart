import 'package:bloc_state_management/bloc/switch/switch_event.dart';
import 'package:bloc_state_management/bloc/switch/switch_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
    on<UpdateNotificationAction>(_updateNotification);
    on<SliderAction>(_updateSlider);
  }

  void _updateNotification(
      UpdateNotificationAction event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isEnabled: !state.isEnabled));
  }

  void _updateSlider(SliderAction event, Emitter<SwitchState> emit) {
    emit(state.copyWith(slider: event.value));
  }
}
