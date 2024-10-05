import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ProfiePageEvent extends Equatable {}

class UsernamePicProfileEventLoading extends ProfiePageEvent {
  List<Object?> get props => [];
}
