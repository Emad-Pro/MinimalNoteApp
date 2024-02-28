import 'package:isar/isar.dart';
import 'package:minmal_note_app/feture/data/model/noteModel.dart';
import 'package:path_provider/path_provider.dart';

class NoteDataBase {
  static late Isar isar;
  // Initialize Isar DataBase
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NoteModelSchema], directory: dir.path);
  }

  // Create A Note and save to db
  static Future<void> addNote(String textFromUser) async {
    // create A new note object

    final newNote = NoteModel()..text = textFromUser;

    // Save to db
    await isar.writeTxn(() => isar.noteModels.put(newNote));

    await fetchNote();
  }

  static Future<List<NoteModel>> fetchNote() async {
    return isar.noteModels.where().findAll();
  }

  static Future<void> updateNote({int? id, String? newText}) async {
    final existingNote = await isar.noteModels.get(id!);
    if (existingNote != null) {
      existingNote.text = newText!;
      await isar.writeTxn(() => isar.noteModels.put(existingNote));
      await fetchNote();
    }
  }

  static Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.noteModels.delete(id));
    await fetchNote();
  }
}
