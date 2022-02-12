import 'package:bloc/bloc.dart';
import 'package:flutter_cubit/cubic/app_cubit_state.dart';
import 'package:flutter_cubit/model/data_model.dart';
import 'package:flutter_cubit/services/data_services.dart';

class AppCubits extends Cubit<CubitState> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  late final places;

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places: places));
    } catch (e) {
      print(e);
    }
  }

  void detailPage(DataModel data) async {
      emit(DetailState(data: data));
  }

  void goHome() {
    emit(LoadedState(places: places));
  }
}
