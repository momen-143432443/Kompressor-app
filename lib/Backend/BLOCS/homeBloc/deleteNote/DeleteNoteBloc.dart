import 'package:bloc/bloc.dart';
import 'package:ecar/Backend/BLOCS/homeBloc/deleteNote/DeleteNoteEvent.dart';
import 'package:ecar/Backend/BLOCS/homeBloc/deleteNote/DeleteNoteState.dart';
import 'package:ecar/Backend/carNotes.dart/notesController.dart';

class DeleteBloc extends Bloc<DeleteNoteEvent, DeleteNoteState> {
  final Notescontroller firestore;

  DeleteBloc(this.firestore) : super(DeleteInitial()) {
    on<DeleteDocument>(
      (event, emit) async {
        emit(DeleteInProgress());
        try {
          final note = await firestore.getAllNotes();
          await firestore.deleteSomeNotes(event.docId);
          emit(ShowNotes(note));
        } catch (e) {
          emit(DeleteFailure('Fail'));
        }
      },
    );
  }
}
