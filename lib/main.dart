import 'package:book_list/viewmodels/book_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:book_list/services/routes.gr.dart' as r;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = r.AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => BookViewModel())],
      child: MaterialApp.router(
          theme: ThemeData.dark(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: _appRouter.delegate()),
    );
  }
}
