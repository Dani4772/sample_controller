import 'package:flutter/material.dart';
import 'package:reusables/widgets/controlled_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  final _homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /// 10 more widgets
            const Text('You have pushed the button this many times:'),
            TextWidget(homeController: _homeController),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _homeController.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class HomeController extends ChangeNotifier {
  var counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }
}

class TextWidget extends ControlledWidget<HomeController> {
  const TextWidget({
    Key? key,
    required this.homeController,
  }) : super(key: key, controller: homeController);

  final HomeController homeController;

  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> with ControlledStateMixin {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.controller.counter.toString(),
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
