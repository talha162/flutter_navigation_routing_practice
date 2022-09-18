import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/': (context) => HomePage(), '/sp': (context) => SecondPage()},
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Home")),
        body: Center(
          child: Column(children: [
            Text("Welcome to Home Page"),
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/sp'),
                child: Text("Goto Second Screen")),
            ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ThirdPage("Talha"),
                    )),
                child: Text("Goto Third Page"))
          ]),
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String name = "Talha";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Second Page"), centerTitle: true),
        body: Center(
          child: Column(children: [
            Text("Welcome to Second Page"),
            ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Goto Home Page")),
            ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ThirdPage(name),
                    )),
                child: Text("Goto Third Page"))
          ]),
        ),
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  String name;

  ThirdPage(this.name, {Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState(name);
}

class _ThirdPageState extends State<ThirdPage> {
  String name;

  _ThirdPageState(this.name);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Third Page"),
          ),
          body: Center(
            child: Column(children: [
              Text("Welcome to Third Page $name"),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage(),
                      )),
                  child: Text("Goto Second Page")),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      )),
                  child: Text("Goto Home Page"))
            ]),
          )),
    );
  }
}
