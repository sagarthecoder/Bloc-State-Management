import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object?> get props => [];
}

class UpdateNotificationAction extends SwitchEvent {}

class SliderAction extends SwitchEvent {
  final double value;
  const SliderAction({required this.value});
}
