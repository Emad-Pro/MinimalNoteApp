import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class NoteScreenNoteTileWidget extends StatelessWidget {
  const NoteScreenNoteTileWidget(
      {Key? key,
      required this.text,
      required this.onPressedEdit,
      required this.onPressedDelete})
      : super(key: key);
  final String text;
  final void Function()? onPressedEdit;
  final void Function()? onPressedDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 25, right: 25),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12)),
      child: ListTile(
          title: AutoDirection(child: Text(text), text: text),
          trailing: Builder(builder: (context) {
            return GestureDetector(
              child: Icon(Icons.more_vert),
              onTap: () {
                showPopover(
                    context: context,
                    backgroundColor: Theme.of(context).colorScheme.background,
                    bodyBuilder: (context) => NoteScreenMenuWidget(
                          onTapDelete: onPressedDelete,
                          onTapEdit: onPressedEdit,
                        ));
              },
            );
          })),
    );
  }
}

class NoteScreenMenuWidget extends StatelessWidget {
  const NoteScreenMenuWidget(
      {Key? key, required this.onTapEdit, required this.onTapDelete})
      : super(key: key);
  final void Function()? onTapEdit;
  final void Function()? onTapDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      color: Colors.red,
      child: MenuWidgetButton(
        onTapDelete: onTapDelete,
        onTapEdit: onTapEdit,
      ),
    );
  }
}

class MenuWidgetButton extends StatelessWidget {
  const MenuWidgetButton(
      {super.key, required this.onTapEdit, required this.onTapDelete});

  final void Function()? onTapEdit;
  final void Function()? onTapDelete;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTapEdit,
          child: Container(
            child: Center(
                child: Text(
              "Edit",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            color: Theme.of(context).colorScheme.background,
            height: 50,
          ),
        ),
        InkWell(
          onTap: onTapDelete,
          child: Container(
            child: Center(
                child: Text(
              "Delete",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            color: Theme.of(context).colorScheme.background,
            height: 50,
          ),
        ),
      ],
    );
  }
}
