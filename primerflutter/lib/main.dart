import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pantalla2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
        '/pantalla2': (context) {
          final args =
              ModalRoute.of(context)?.settings.arguments as Map<String, String>;
          return Mypantalla2(mensaje: args['mensaje'] ?? '',edad: args['edad'] ?? '');
        },
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _textSaludo = "hs oprimido el boton:";
  int _downCounter = 0;
  int _upCounter = 0;
  double x = 0.0;
  double y = 0.0;
  String image = "assets/images/buscar.png";
  bool enable = true;
  TextEditingController _textFieldController = TextEditingController();
  TextEditingController _textFieldControlleredad = TextEditingController();
  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter % 2 == 0) {
        image = "assets/images/buscar.png";
        enable = true;
      } else {
        image = "assets/images/logout.png";
        enable = false;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      if (_counter % 2 == 0) {
        image = "assets/images/buscar.png";
      } else {
        image = "assets/images/logout.png";
      }
    });
  }

  void _incrementDown(PointerEvent details) {
    _updateLocation(details);
    setState(() {
      _downCounter++;
    });
  }

  void _incrementUp(PointerEvent details) {
    _updateLocation(details);
    setState(() {
      _upCounter++;
    });
  }

  void _updateLocation(PointerEvent details) {
    setState(() {
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  void cambiarpantalla() {
    // Get text from TextField
    String enteredText = _textFieldController.text;
    String enterededad = _textFieldControlleredad.text;
    // Check if the text is not null or empty before sending
    if (enteredText.isNotEmpty && enterededad.isNotEmpty ) {
      Navigator.pushNamed(context, '/pantalla2',
          arguments: {'mensaje': enteredText,'edad': enterededad});
    } else {
      print('Text is null or empty. Not sending.');
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(image),
            ),
            Text(
              _textSaludo,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextField(
              controller: _textFieldController,
              enabled: enable,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'nombre',
              ),
            ),
            TextField(
              controller: _textFieldControlleredad,
              enabled: enable,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'edad',
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), // Add some spacing between the buttons
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: cambiarpantalla,
            child: const Icon(Icons.coffee_rounded),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
