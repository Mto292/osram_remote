import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';
import 'package:ir_sensor_plugin/ir_sensor_plugin.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HomeWidget.registerBackgroundCallback(backgroundCallback);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Osram Remote',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const MyHomePage(title: 'Osram Remote'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            ElevatedButton(
              onPressed: openLight,
              child: Text('Open'),
            ),
            ElevatedButton(
              onPressed: closeLight,
              child: Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}

@pragma("vm:entry-point")
Future<void> backgroundCallback(Uri? uri) async {
  if (uri?.host == 'open') {
    openLight.call();
  } else if (uri?.host == 'close') {
    closeLight.call();
  }
}

openLight() async {
  try {
    final bool hasIrEmitter = await IrSensorPlugin.hasIrEmitter;
    const hex = [
      9050,
      4450,
      550,
      600,
      550,
      550,
      550,
      600,
      550,
      550,
      600,
      550,
      550,
      550,
      600,
      550,
      550,
      550,
      600,
      1650,
      550,
      1650,
      600,
      1650,
      550,
      1650,
      600,
      1650,
      550,
      1650,
      600,
      1650,
      550,
      1650,
      550,
      1700,
      550,
      1650,
      550,
      1650,
      600,
      550,
      550,
      600,
      550,
      550,
      550,
      600,
      550,
      550,
      600,
      550,
      550,
      600,
      550,
      550,
      550,
      1650,
      600,
      1650,
      550,
      1650,
      600,
      1650,
      550,
      1650,
      550
    ];
    await IrSensorPlugin.transmitListInt(list: hex);
  } catch (e) {
    debugPrint(e.toString());
  }
}

closeLight() async {
  try {
    const hex = [
      9100,
      4450,
      550,
      550,
      600,
      550,
      600,
      500,
      600,
      550,
      600,
      500,
      600,
      550,
      600,
      500,
      600,
      550,
      600,
      1650,
      550,
      1650,
      600,
      1600,
      600,
      1650,
      600,
      1600,
      600,
      1650,
      600,
      1600,
      600,
      1650,
      600,
      500,
      600,
      1650,
      600,
      1600,
      600,
      550,
      600,
      500,
      600,
      550,
      600,
      550,
      550,
      550,
      600,
      1650,
      550,
      550,
      600,
      550,
      600,
      1600,
      600,
      1650,
      600,
      1600,
      600,
      1650,
      550,
      1650,
      600
    ];
    await IrSensorPlugin.transmitListInt(list: hex);
  } catch (e) {
    debugPrint(e.toString());
  }
}
