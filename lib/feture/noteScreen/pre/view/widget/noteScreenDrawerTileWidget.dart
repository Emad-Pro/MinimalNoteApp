import 'package:flutter/material.dart';

class NoteScreenDrawerTileWidget extends StatelessWidget {
  const NoteScreenDrawerTileWidget(
      {Key? key,
      required this.title,
      required this.leading,
      required this.onTap})
      : super(key: key);
  final String title;
  final Widget leading;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        leading: leading,
        onTap: onTap,
      ),
    );
  }
}
