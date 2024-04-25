import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Cmd Cars',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imgList = [
    'https://raw.githubusercontent.com/CorreaMontesDiego/img_IOS/main/flutterFlowA13/240sx2.jpg',
    'https://raw.githubusercontent.com/CorreaMontesDiego/img_IOS/main/flutterFlowA13/300zx1.jpg',
    'https://raw.githubusercontent.com/CorreaMontesDiego/img_IOS/main/flutterFlowA13/350z1.jpg',
    'https://raw.githubusercontent.com/CorreaMontesDiego/img_IOS/main/flutterFlowA13/370z1.jpg',
    'https://raw.githubusercontent.com/CorreaMontesDiego/img_IOS/main/flutterFlowA13/rx7_2.jpg',
    'https://raw.githubusercontent.com/CorreaMontesDiego/img_IOS/main/flutterFlowA13/silvia15_1.jpg'
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(children: [
        CarouselSlider(
          items: imgList
              .map((e) => Center(
                    child: Image.network(e),
                  ))
              .toList(),
          options: CarouselOptions(
              initialPage: 0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              onPageChanged: (value, _) {
                setState(() {
                  _currentPage = value;
                });
              }),
        ),
        buildCarouselIndicator()
      ])),
    );
  }

  buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < imgList.length; i++)
          Container(
              margin: const EdgeInsets.all(5),
              height: i == _currentPage ? 7 : 5,
              width: i == _currentPage ? 7 : 5,
              decoration: BoxDecoration(
                  color: i == _currentPage ? Colors.black : Colors.grey,
                  shape: BoxShape.circle))
      ],
    );
  }
}
