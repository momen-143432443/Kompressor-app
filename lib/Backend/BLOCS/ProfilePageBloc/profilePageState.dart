import 'package:ecar/Backend/for_User/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ProfilePageState extends Equatable {}

class UsernamePicProfileStateLoading extends ProfilePageState {
  List<Object?> get props => [];
}

class UsernamePicProfileStateLoaded extends ProfilePageState {
  final UserModel userModel;
  UsernamePicProfileStateLoaded(this.userModel);
  List<Object?> get props => [userModel];
}

class UsernamePicProfileStateError extends ProfilePageState {
  final String err;
  UsernamePicProfileStateError(this.err);
  List<Object?> get props => [err];
}
