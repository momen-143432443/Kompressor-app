import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HomeBlocEvent extends Equatable {}

class HBlocLoad extends HomeBlocEvent {
  @override
  List<Object?> get props => [];
}

class HBlocResfresh extends HomeBlocEvent {
  @override
  List<Object?> get props => [];
}

class HBlocDeleteE extends HomeBlocEvent {
  String docId;
  HBlocDeleteE(this.docId);
  List<Object?> get props => [docId];
}

///////////////////////////////////////////////
////////////////////////////////////////////////
////////////////////////////////////////////////
@immutable
abstract class PicUsernameBlocEvent extends Equatable {}

class HblocImageUsernameLoadedEvent extends PicUsernameBlocEvent {
  List<Object?> get props => [];
}

@immutable
abstract class HblocCarImageNameEvent extends Equatable {}

class HblocCarImageNameEventLoading extends HblocCarImageNameEvent {
  @override
  List<Object?> get props => [];
}
