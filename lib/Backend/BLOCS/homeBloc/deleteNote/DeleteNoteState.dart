// delete_state.dart
import 'package:ecar/Backend/carNotes.dart/notesModel.dart';
import 'package:equatable/equatable.dart';

abstract class DeleteNoteState extends Equatable {}

class DeleteInitial extends DeleteNoteState {
  @override
  List<Object?> get props => [];
}

class DeleteInProgress extends DeleteNoteState {
  @override
  List<Object?> get props => [];
}

class DeleteSuccess extends DeleteNoteState {
  @override
  List<Object?> get props => [];
}

class ShowNotes extends DeleteNoteState {
  final List<NotesModel> notesModel;
  ShowNotes(this.notesModel);
  List<Object?> get props => [notesModel];
}

class DeleteFailure extends DeleteNoteState {
  final String error;

  DeleteFailure(this.error);

  @override
  List<Object?> get props => [error];
}
