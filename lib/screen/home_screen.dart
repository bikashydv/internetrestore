import 'package:blodemo/blocs/internet_bloc/internet_bloc.dart';
import 'package:blodemo/blocs/internet_bloc/internet_state.dart';
import 'package:blodemo/cubit/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          ///Use of Cubit ///
          child: BlocConsumer<InternetCubit, InternetState>(
            listener: (context, state) {
              if (state == InternetState.Gained) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Internet Connected"),
                    backgroundColor: Colors.green,
                  ),
                );
              } else if (state == InternetState.Lost) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Internet not Connected"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state == InternetState.Gained) {
                return const Text("Connected!");
              } else if (state == InternetState.Lost) {
                return const Text("Not Connected");
              } else {
                return const Text("Loading...");
              }
            },
          ),

          ///Use Of bloc//
          ///   
          // child: BlocConsumer<InternetBloc, InternetState>(
          //   listener: (context, state) {
          //     if (state is InternetGainedState) {
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         const SnackBar(
          //           content: Text("Internet Connected"),
          //           backgroundColor: Colors.green,
          //         ),
          //       );
          //     } else if (state is InternetLostState) {
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         const SnackBar(
          //           content: Text("Internet not Connected"),
          //           backgroundColor: Colors.red,
          //         ),
          //       );
          //     }
          //   },
          //   builder: (context, state) {
          //     if (state is InternetGainedState) {
          //       return const Text("Connected!");
          //     } else if (state is InternetLostState) {
          //       return const Text("Not Connected");
          //     } else {
          //       return const Text("Loading...");
          //     }
          //   },
          // ),

          ///blocBuilder use ///

          // child: BlocBuilder<InternetBloc, InternetState>(
          //   builder: (context, state) {
          //     if (state is InternetGainedState) {
          //       return Text("Connected!");
          //     } else if (state is InternetLostState) {
          //       return Text("Not Connected");
          //     } else {
          //       return Text("Loading...");
          //     }
          //   },
          // ),
        ),
      ),
    );
  }
}
