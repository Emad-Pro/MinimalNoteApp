import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minmal_note_app/feture/noteScreen/data/model/noteModel.dart';
import 'package:minmal_note_app/feture/noteScreen/pre/viewModel/cubit/note_cubit.dart';

void deleteNote(NoteModel note, context) {
  BlocProvider.of<NoteCubit>(context).deleteNoteFromDatabase(note.id);
}
