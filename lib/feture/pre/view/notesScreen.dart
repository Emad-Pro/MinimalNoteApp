import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minmal_note_app/core/enum.dart';
import 'package:minmal_note_app/feture/pre/view/method/addNoteMethod.dart';

import 'package:minmal_note_app/feture/pre/viewModel/cubit/note_cubit.dart';
import 'package:minmal_note_app/feture/pre/viewModel/cubit/note_state.dart';

class NotesScreen extends StatelessWidget {
  NotesScreen({Key? key}) : super(key: key);
  final textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        centerTitle: true,
      ),
      body: BlocBuilder<NoteCubit, NoteState>(builder: (context, state) {
        switch (state.getDataNoteFromDatabaseState) {
          case RequestState.loading:
            return const Center(child: CircularProgressIndicator());
          case RequestState.success:
            return ListView.builder(
                itemCount: state.getDataNoteFromDatabaseModel!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title:
                        Text(state.getDataNoteFromDatabaseModel![index].text),
                  );
                });
          case RequestState.erorr:
            return const Text("some Erorr");
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          createNoteMethod(context, textEditingController);
        },
        child: const Icon(Icons.add_outlined),
      ),
    );
  }
}
