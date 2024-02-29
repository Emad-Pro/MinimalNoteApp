import 'package:isar/isar.dart';
part "noteModel.g.dart";

@collection
class NoteModel {
  Id id = Isar.autoIncrement;
  late String text;
}
