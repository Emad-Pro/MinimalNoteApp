import 'package:isar/isar.dart';
import 'package:minmal_note_app/feture/data/model/noteModel.dart';
import 'package:path_provider/path_provider.dart';

abstract class NoteDataBaseIsarRepoistory {
  Future<void> initialize();
  Future<void> addNote(String textFromUser);
  Future<List<NoteModel>> fetchNote();
  Future<void> updateNote({int? id, String? newText});
  Future<void> deleteNote(int id);
}

class NoteDataBaseIsarRepoistoryImp extends NoteDataBaseIsarRepoistory {
  static late Isar isar;
  // Initialize Isar DataBase
  @override
  Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NoteModelSchema], directory: dir.path);
  }

  // Create A Note and save to db
  @override
  Future<void> addNote(String textFromUser) async {
    final newNote = NoteModel()..text = textFromUser;
    await isar.writeTxn(() => isar.noteModels.put(newNote));
  }

  // get Data from db
  @override
  Future<List<NoteModel>> fetchNote() async {
    return await isar.noteModels.where().findAll();
  }

// Update Data from db
  @override
  Future<void> updateNote({int? id, String? newText}) async {
    final existingNote = await isar.noteModels.get(id!);
    if (existingNote != null) {
      existingNote.text = newText!;
      await isar.writeTxn(() => isar.noteModels.put(existingNote));
    }
  }

// Delete Data from db
  @override
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.noteModels.delete(id));
  }
}
