import 'package:equatable/equatable.dart';
import 'package:minmal_note_app/core/enum.dart';
import 'package:minmal_note_app/feture/data/model/noteModel.dart';

class NoteState {
  final RequestState addNoteToDatabaseState;
  final RequestState deleteNoteFromDatabaseState;
  final RequestState updateNoteFromDatabaseState;
  final RequestState getDataNoteFromDatabaseState;
  final List<NoteModel>? getDataNoteFromDatabaseModel;
  const NoteState(
      {this.addNoteToDatabaseState = RequestState.loading,
      this.deleteNoteFromDatabaseState = RequestState.loading,
      this.updateNoteFromDatabaseState = RequestState.loading,
      this.getDataNoteFromDatabaseState = RequestState.loading,
      this.getDataNoteFromDatabaseModel});

  NoteState copyWith(
      {RequestState? addNoteToDatabaseState,
      RequestState? deleteNoteFromDatabaseState,
      RequestState? updateNoteFromDatabaseState,
      RequestState? getDataNoteFromDatabaseState,
      List<NoteModel>? getDataNoteFromDatabaseModel}) {
    return NoteState(
        addNoteToDatabaseState:
            addNoteToDatabaseState ?? this.addNoteToDatabaseState,
        deleteNoteFromDatabaseState:
            deleteNoteFromDatabaseState ?? this.deleteNoteFromDatabaseState,
        updateNoteFromDatabaseState:
            updateNoteFromDatabaseState ?? this.updateNoteFromDatabaseState,
        getDataNoteFromDatabaseModel:
            getDataNoteFromDatabaseModel ?? this.getDataNoteFromDatabaseModel,
        getDataNoteFromDatabaseState:
            getDataNoteFromDatabaseState ?? this.getDataNoteFromDatabaseState);
  }
}
