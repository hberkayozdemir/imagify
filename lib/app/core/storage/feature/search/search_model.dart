import 'package:isar/isar.dart';

part 'search_model.g.dart';

@Collection()
class SearchModel {
   Id id = Isar.autoIncrement;
   String ? title;
   DateTime ? time;
   String ?type;
}
