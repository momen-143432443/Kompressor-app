import 'package:equatable/equatable.dart';

abstract class DeleteNoteEvent extends Equatable {}

class DeleteDocument extends DeleteNoteEvent {
  final String docId;

  DeleteDocument(this.docId);

  @override
  // TODO: implement props
  List<Object?> get props => [docId];
}
