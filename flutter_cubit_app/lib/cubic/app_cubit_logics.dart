import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubic/app_cubit.dart';
import 'package:flutter_cubit/pages/detail_page.dart';
import 'package:flutter_cubit/pages/home_page.dart';
import 'package:flutter_cubit/pages/navpages/main_page.dart';
import 'package:flutter_cubit/pages/welcome_page.dart';

import 'app_cubit_state.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  _AppCubitLogicsState createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitState>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return const WelcomePage();
          } else if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedState) {
            return const MainPage();
          } else if (state is DetailState) {
            return const DetailPage();
          }else {
            return Container();
          }
        },
      ),
    );
  }
}
