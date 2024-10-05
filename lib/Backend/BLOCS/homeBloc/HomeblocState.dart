import 'package:ecar/Backend/CarStructure/CarModel.dart';
import 'package:ecar/Backend/carNotes.dart/notesModel.dart';
import 'package:ecar/Backend/for_User/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class Homeblocstate extends Equatable {
  List<Object?> get props => [];
}

class HBlocLoading extends Homeblocstate {
  @override
  List<Object?> get props => [];
}

class HBlocLoaded extends Homeblocstate {
  final List<NotesModel> notesModel;
  HBlocLoaded(this.notesModel);
  List<Object?> get props => [notesModel];
}

class HBlocNoData extends Homeblocstate {}

class HBlocError extends Homeblocstate {
  final String? error;
  HBlocError(this.error);
  List<Object?> get props => [error];
}

////////////////////////////////////////////////////////
///////////////////////////////////////////////////////
//////////////////////////////////////////////////////
@immutable
abstract class PicUsernameBlocState extends Equatable {}

class HblocImageUsernameLoading extends PicUsernameBlocState {
  List<Object?> get props => [];
}

class HblocImageUsernameLoaded extends PicUsernameBlocState {
  final UserModel userModel;
  HblocImageUsernameLoaded(this.userModel);
  List<Object?> get props => [userModel];
}

class HblocImageUsernameError extends PicUsernameBlocState {
  final String? err;
  HblocImageUsernameError(this.err);
  List<Object?> get props => [err];
}

@immutable
abstract class HblocCarImageNameState extends Equatable {}

class HblocCarImageNameLoading extends HblocCarImageNameState {
  @override
  List<Object?> get props => [];
}

class HblocCarImageNameLoaded extends HblocCarImageNameState {
  final CarsModel carsModel;
  HblocCarImageNameLoaded(this.carsModel);
  List<Object?> get props => [carsModel];
}

class HblocCarImageNameError extends HblocCarImageNameState {
  final String e;
  HblocCarImageNameError(this.e);
  List<Object?> get props => [e];
}
