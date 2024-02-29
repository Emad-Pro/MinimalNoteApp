import 'package:flutter/material.dart';
import 'package:minmal_note_app/feture/noteScreen/pre/view/method/addNoteMethod.dart';

class NoteScreenFloatingActionButtonWidget extends StatelessWidget {
  const NoteScreenFloatingActionButtonWidget({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        createNoteMethod(context, textEditingController);
      },
      child: Icon(
        Icons.add_outlined,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}
