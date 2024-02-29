import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minmal_note_app/feture/noteScreen/pre/viewModel/cubit/note_cubit.dart';

Future<dynamic> createNoteMethod(
    BuildContext context, TextEditingController textEditingController) {
  textEditingController.clear();
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: AutoDirection(
              text: textEditingController.text,
              child: TextField(
                controller: textEditingController,
              ),
            ),
            title: const Text("New Note"),
            actions: [
              MaterialButton(
                onPressed: () {
                  BlocProvider.of<NoteCubit>(context)
                      .addDataToDatabase(textEditingController.text);
                  textEditingController.clear();
                  Navigator.pop(context);
                },
                child: const Text("Create Note"),
              )
            ],
          ));
}
