import 'package:auto_route/auto_route.dart';
import 'package:book_list/models/books.dart';
import 'package:book_list/services/routes.gr.dart';
import 'package:book_list/viewmodels/book_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Book> favBooks = [];

  @override
  Widget build(BuildContext context) {
    BookViewModel bookViewModel = context.watch<BookViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Fav')
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: Column(
        children: [
          _selectedIndex == 0 ? _home(bookViewModel) : _favorite(bookViewModel),
        ],
      ),
    );
  }

  Widget _favorite(BookViewModel bookViewModel) {
    if (bookViewModel.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Expanded(
        child: SafeArea(
      child: ReorderableListView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: [
          for (int index = 0; index < favBooks.length; index += 1)
            ListTile(
              key: Key('$index'),
              title: Text(favBooks[index].title!,
                  style: const TextStyle(color: Colors.black)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    favBooks[index].author!,
                    style: const TextStyle(color: Colors.black),
                  ),
                  Text(favBooks[index].genre!,
                      style: const TextStyle(color: Colors.black)),
                  Text(favBooks[index].published!,
                      style: const TextStyle(color: Colors.black))
                ],
              ),
              leading: Image(image: NetworkImage(favBooks[index].image!)),
              isThreeLine: true,
              trailing: IconButton(
                icon: Icon(
                  favBooks[index].isFavorite!
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.orangeAccent,
                ),
                onPressed: () {
                  bookViewModel.setFavorite(
                      favBooks[index], !favBooks[index].isFavorite!);
                  favBooks.remove(favBooks[index]);
                },
              ),
              onTap: () {
                AutoRouter.of(context)
                    .push(DetailsPageRoute(book: favBooks[index]));
              },
            )
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final Book item = favBooks.removeAt(oldIndex);
            favBooks.insert(newIndex, item);
          });
        },
      ),
    ));
  }

  Widget _home(BookViewModel bookViewModel) {
    if (bookViewModel.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Expanded(
      child: ListView.builder(
        itemCount: bookViewModel.bookList.length,
        itemBuilder: (context, index) {
          Book book = bookViewModel.bookList[index];
          return ListTile(
            title:
                Text(book.title!, style: const TextStyle(color: Colors.black)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.author!,
                  style: const TextStyle(color: Colors.black),
                ),
                Text(book.genre!, style: const TextStyle(color: Colors.black)),
                Text(book.published!,
                    style: const TextStyle(color: Colors.black))
              ],
            ),
            leading: Image(image: NetworkImage(book.image!)),
            isThreeLine: true,
            trailing: IconButton(
              icon: Icon(
                book.isFavorite! ? Icons.favorite : Icons.favorite_border,
                color: Colors.orangeAccent,
              ),
              onPressed: () {
                bookViewModel.setFavorite(book, !book.isFavorite!);
                if (book.isFavorite!) {
                  favBooks.add(book);
                } else {
                  favBooks.remove(book);
                }
              },
            ),
            onTap: () {
              AutoRouter.of(context).push(DetailsPageRoute(book: book));
            },
          );
        },
      ),
    );
  }
}
