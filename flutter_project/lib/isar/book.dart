import 'package:isar/isar.dart';

part 'book.g.dart';

@Collection()
class Book {
  @Id()
  int? id;

  late String url;
  late String title;
  late String image;
  late String catalog;
}
