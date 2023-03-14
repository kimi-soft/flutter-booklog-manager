import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:booklog_manager/isar/book.dart';

class DatabaseManager {
  late List<Book> books;
  late Isar _isar;

  static final DatabaseManager _instance = DatabaseManager._internal();

  factory DatabaseManager() {
    return _instance;
  }

  DatabaseManager._internal() {
  }

  Future<void> initAsync() async {
    var path = '';
    if (!kIsWeb) {
      final dir = await getApplicationSupportDirectory();
      path = dir.path;
    }

    _isar = await Isar.open(
      schemas: [BookSchema],
      directory: path,
      inspector: false);

    await findAllAsync();
  }

  Future<void> findAllAsync() async {
    books = await _isar.books.where().findAll();
  }

  Future<void> addFromJsonAsync(Map<String, dynamic> responseJson) async {
    await _isar.writeTxn((_isar) => _isar.books.clear());

    var books = <Book>[];
    var id = 1;

    List<dynamic> jsonBooks = List.from(responseJson['books']);
    jsonBooks.forEach((jsonBook) {
      final book = Book()
        ..id = id
        ..url = jsonBook['url']
        ..title = jsonBook['title']
        ..image = jsonBook['image']
        ..catalog = jsonBook['catalog'];

        books.add(book);
        id++;
    });

    await _isar.writeTxn((_isar) => _isar.books.putAll(books));
    await findAllAsync();
  }
}
