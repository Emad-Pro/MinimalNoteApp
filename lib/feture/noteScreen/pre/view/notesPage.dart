import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minmal_note_app/core/enum.dart';
import 'package:minmal_note_app/feture/noteScreen/pre/view/widget/noteScreenBodyWidget.dart';
import 'package:minmal_note_app/feture/noteScreen/pre/view/widget/noteScreenDrawerWidget.dart';
import 'package:minmal_note_app/feture/noteScreen/pre/view/widget/noteScreenFloatingActionButtonWidget.dart';
import 'package:minmal_note_app/feture/noteScreen/pre/viewModel/cubit/note_cubit.dart';
import 'package:minmal_note_app/feture/noteScreen/pre/viewModel/cubit/note_state.dart';

class NotesPage extends StatelessWidget {
  NotesPage({Key? key}) : super(key: key);
  final textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: notesScreenAppBarWidget(context),
      drawer: const NoteScreenDrawerWidget(),
      body: BlocBuilder<NoteCubit, NoteState>(builder: (context, state) {
        switch (state.getDataNoteFromDatabaseState) {
          case RequestState.loading:
            return const Center(child: CircularProgressIndicator());
          case RequestState.success:
            return NoteBodyScreenWidget(
              textEditingController: textEditingController,
              state: state,
            );
          case RequestState.erorr:
            return const Text("some Erorr");
        }
      }),
      floatingActionButton: NoteScreenFloatingActionButtonWidget(
          textEditingController: textEditingController),
    );
  }
}

PreferredSizeWidget notesScreenAppBarWidget(context) => AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
    );
