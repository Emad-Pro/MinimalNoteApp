import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minmal_note_app/feture/noteScreen/pre/view/method/updateNoteMethod.dart';
import 'package:minmal_note_app/feture/noteScreen/pre/view/widget/noteScreenNoteTileWidget.dart';
import 'package:minmal_note_app/feture/noteScreen/pre/viewModel/cubit/note_cubit.dart';
import 'package:minmal_note_app/feture/noteScreen/pre/viewModel/cubit/note_state.dart';

class NoteBodyScreenWidget extends StatelessWidget {
  const NoteBodyScreenWidget(
      {super.key, required this.state, required this.textEditingController});
  final NoteState state;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            "Notes",
            style: GoogleFonts.dmSerifText(
                fontSize: 48,
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: state.getDataNoteFromDatabaseModel!.length,
              itemBuilder: (context, index) {
                return NoteScreenNoteTileWidget(
                  text: state.getDataNoteFromDatabaseModel![index].text,
                  onPressedEdit: () {
                    updateNote(state.getDataNoteFromDatabaseModel![index],
                        context, textEditingController);
                  },
                  onPressedDelete: () {
                    BlocProvider.of<NoteCubit>(context).deleteNoteFromDatabase(
                        state.getDataNoteFromDatabaseModel![index].id);
                    Navigator.pop(context);
                  },
                );
              }),
        ),
      ],
    );
  }
}
