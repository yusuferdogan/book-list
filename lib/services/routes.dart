import 'package:auto_route/auto_route.dart';
import 'package:book_list/views/details_page.dart';
import 'package:book_list/views/home_page.dart';
import 'package:book_list/views/read_list_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: HomeScreen, initial: true),
    AutoRoute(
      page: DetailsPage,
    ),
    AutoRoute(
      page: ReadListPage,
    ),
  ],
)
class $AppRouter {}
