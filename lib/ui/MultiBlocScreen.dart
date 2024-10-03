import 'package:bloc_state_management/bloc/switch/switch_bloc.dart';
import 'package:bloc_state_management/bloc/switch/switch_event.dart';
import 'package:bloc_state_management/bloc/switch/switch_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiBlocScreen extends StatefulWidget {
  const MultiBlocScreen({super.key});

  @override
  State<MultiBlocScreen> createState() => _MultiBlocScreenState();
}

class _MultiBlocScreenState extends State<MultiBlocScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            makeNotificationSection(),
            const SizedBox(
              height: 20,
            ),
            makeContainer(),
            const SizedBox(
              height: 20,
            ),
            makeSlider(),
          ],
        ),
      ),
    );
  }

  Widget makeNotificationSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Notifications'),
        BlocBuilder<SwitchBloc, SwitchState>(
          buildWhen: (previous, current) =>
              previous.isEnabled != current.isEnabled,
          builder: (context, state) {
            return Switch(
                value: state.isEnabled,
                onChanged: (newValue) {
                  context.read<SwitchBloc>().add(UpdateNotificationAction());
                });
          },
        ),
      ],
    );
  }

  Widget makeContainer() {
    return BlocBuilder<SwitchBloc, SwitchState>(builder: (context, state) {
      return Container(
        width: double.infinity,
        height: 300,
        color: Colors.green.withOpacity(state.slider),
      );
    });
  }

  Widget makeSlider() {
    return BlocBuilder<SwitchBloc, SwitchState>(
        buildWhen: (previous, current) => previous.slider != current.slider,
        builder: (context, state) {
          return Slider(
              value: state.slider,
              onChanged: (newValue) {
                context.read<SwitchBloc>().add(SliderAction(value: newValue));
              });
        });
  }
}
