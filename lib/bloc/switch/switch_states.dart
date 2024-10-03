import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  final bool isEnabled;
  final double slider;
  const SwitchState({this.isEnabled = true, this.slider = 1.0});

  SwitchState copyWith({bool? isEnabled, double? slider}) {
    return SwitchState(
        isEnabled: isEnabled ?? this.isEnabled, slider: slider ?? this.slider);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isEnabled, slider];
}
