import 'package:flutter/material.dart';
import 'package:prueba_flutter/GuessState.dart';
import 'package:provider/provider.dart';
import 'pantall1.dart';
import  'pantalla2.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => GuessState(),
    child: const MyApp(),
  ),)
  ;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {'/pantalla1': (context) => pantalla1(),
        '/pantalla2': (context) => Pantalla2(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController _textFieldController = TextEditingController();

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  void cambiarpantalla2(){

    if (_textFieldController.text.isNotEmpty) {
      // Access the GuessState provider
      GuessState guessState = Provider.of<GuessState>(context, listen: false);

      // Save the name in the provider
      guessState.message = _textFieldController.text;

      // Navigate to pantalla1
      Navigator.of(context).pushNamed('/pantalla2');
    }


  }

  void cambiarpantalla1(){

    if (_textFieldController.text.isNotEmpty) {
      // Access the GuessState provider
      GuessState guessState = Provider.of<GuessState>(context, listen: false);

      // Save the name in the provider
      guessState.message = _textFieldController.text;

      // Navigate to pantalla1
      Navigator.of(context).pushNamed('/pantalla1');
    }


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 50,
              height: 50,
              child: Image.asset("assets/picture.png"),
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "nombre"
              ),
            ),
            ElevatedButton(onPressed: cambiarpantalla1, child: const Text("Pantalla 1")),
            ElevatedButton(onPressed: cambiarpantalla2, child: const Text("Pantalla 2"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
