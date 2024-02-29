import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minmal_note_app/feture/pre/viewModel/cubit/note_cubit.dart';

Future<dynamic> createNoteMethod(
    BuildContext context, TextEditingController textEditingController) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: TextField(
              controller: textEditingController,
            ),
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
