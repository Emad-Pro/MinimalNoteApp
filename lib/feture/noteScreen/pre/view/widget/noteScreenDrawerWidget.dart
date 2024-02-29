import 'package:flutter/material.dart';
import 'package:minmal_note_app/feture/noteScreen/pre/view/widget/noteScreenDrawerTileWidget.dart';
import 'package:minmal_note_app/feture/settingScreen/pre/view/settingScreen.dart';

class NoteScreenDrawerWidget extends StatelessWidget {
  const NoteScreenDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          const DrawerHeader(
              child: Icon(
            Icons.edit_document,
            size: 45,
          )),
          NoteScreenDrawerTileWidget(
            title: "Notes",
            leading: const Icon(Icons.home),
            onTap: () => Navigator.pop(context),
          ),
          NoteScreenDrawerTileWidget(
            title: "Settings",
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SettingScreen()));
            },
          ),
          const Spacer(),
          const Column(
            children: [
              Text("© Creative CV. All rights reserved."),
              Text("Design - Emad Younis"),
              SizedBox(
                height: 10,
              )
            ],
          )
        ],
      ),
    );
  }
}
