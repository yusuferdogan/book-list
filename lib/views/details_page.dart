import 'package:auto_route/auto_route.dart';
import 'package:book_list/models/books.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final Book book;
  const DetailsPage({required this.book, Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    _animation = Tween<double>(
            begin: MediaQuery.of(context).size.height,
            end: MediaQuery.of(context).size.height / 2 - 20)
        .animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.book.image!),
                          fit: BoxFit.fill))),
            ),
            Positioned(
              left: 20,
              top: 50,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        AutoRouter.of(context).pop(true);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            Positioned(
              top: _animation.value,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2 + 20,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.book.title!,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          widget.book.genre!,
                          style: const TextStyle(
                            color: Color(0xFF5d69b3),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.person_pin_circle,
                          size: 36,
                          color: Color(0xFF5d69b3),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          widget.book.author!,
                          style: const TextStyle(
                            color: Color(0xFF5d69b3),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.date_range,
                              color: Colors.black.withOpacity(0.6),
                            ),
                            Text(
                              widget.book.published!,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.book.publisher!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Description",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18),
                        ),
                        Text(
                          widget.book.description!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
