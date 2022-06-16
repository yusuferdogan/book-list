import 'package:book_list/models/books.dart';
import 'package:book_list/services/app_service.dart';
import 'package:flutter/foundation.dart';

///View model class for the books

class BookViewModel extends ChangeNotifier {
  bool _loading = false;
  List<Book> _bookList = [];

  bool get loading => _loading;

  ///Book list
  List<Book> get bookList => _bookList;

  setLoading(bool loading, {bool notify = true}) async {
    _loading = loading;
    if (notify) {
      notifyListeners();
    }
  }

  setBookList(List<Book> bookList, {bool notify = true}) {
    _bookList = bookList;
    if (notify) {
      notifyListeners();
    }
  }

  setFavorite(Book book, bool favorite) {
    book.isFavorite = favorite;
    notifyListeners();
  }

  getBooks() async {
    setLoading(true);
    var response = await AppService().get(200);

    setBookList(response);
    setLoading(false);
  }

  BookViewModel() {
    getBooks();
  }
}
