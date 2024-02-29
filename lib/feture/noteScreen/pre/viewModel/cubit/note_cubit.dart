import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minmal_note_app/core/enum.dart';

import 'package:minmal_note_app/feture/noteScreen/data/repository/noteDataBaseIsarRepoistory.dart';

import 'package:minmal_note_app/feture/noteScreen/pre/viewModel/cubit/note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit(this.noteDataBaseIsarRepoistory) : super(const NoteState());
  final NoteDataBaseIsarRepoistory noteDataBaseIsarRepoistory;
  void addDataToDatabase(String text) async {
    await noteDataBaseIsarRepoistory.addNote(text);
    getDataFromDatabase();
    emit(state.copyWith(addNoteToDatabaseState: RequestState.success));
  }

  void deleteNoteFromDatabase(int id) async {
    await noteDataBaseIsarRepoistory.deleteNote(id);
    getDataFromDatabase();
    emit(state.copyWith(deleteNoteFromDatabaseState: RequestState.success));
  }

  void updateNoteFromDatabase({required int id, required String text}) async {
    await noteDataBaseIsarRepoistory.updateNote(id: id, newText: text);
    getDataFromDatabase();
    emit(state.copyWith(updateNoteFromDatabaseState: RequestState.success));
  }

  Future getDataFromDatabase() async {
    final response = await noteDataBaseIsarRepoistory.fetchNote();
    emit(state.copyWith(
        getDataNoteFromDatabaseModel: response,
        getDataNoteFromDatabaseState: RequestState.success));
  }
}
