import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minmal_note_app/feture/noteScreen/data/model/noteModel.dart';
import 'package:minmal_note_app/feture/noteScreen/pre/viewModel/cubit/note_cubit.dart';

void updateNote(
    NoteModel note, context, TextEditingController textEditingController) {
  final _formKey = GlobalKey<FormState>();
  textEditingController.text = note.text;
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Update Note"),
      content: Form(
        key: _formKey,
        child: AutoDirection(
          text: textEditingController.text,
          child: TextFormField(
            controller: textEditingController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Write anything';
              }
              return null;
            },
          ),
        ),
      ),
      actions: [
        MaterialButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              BlocProvider.of<NoteCubit>(context).updateNoteFromDatabase(
                  id: note.id, text: textEditingController.text);
            }
            textEditingController.clear();
            Navigator.pop(context);
            Navigator.pop(context);
          },
          child: const Text("Update"),
        )
      ],
    ),
  );
}
