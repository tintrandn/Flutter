import 'package:equatable/equatable.dart';
import 'package:flutter_cubit/model/data_model.dart';

abstract class CubitState extends Equatable {}

class InitialState extends CubitState {
  @override
  List<Object> get props => [];
}

class WelcomeState extends CubitState {
  @override
  List<Object> get props => [];
}

class LoadingState extends CubitState {
  @override
  List<Object> get props => [];
}

class LoadedState extends CubitState {

  final List<DataModel> places;

  LoadedState({required this.places});

  @override
  List<Object> get props => [];
}

class DetailState extends CubitState {

  final DataModel data;

  DetailState({required this.data});

  @override
  List<Object> get props => [];
}
