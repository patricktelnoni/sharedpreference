import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => SecondPageState();
}

class SecondPageState extends State<SecondPage>{

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _counter;

  @override
  void initState() {
      super.initState();
      _counter = _prefs.then((SharedPreferences prefs) {
        return prefs.getInt('counter') ?? 0;
      });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Halaman kedua"),
      ),
      body: Center(
        child: FutureBuilder<int>(
          future: _counter,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot){
            return Text(
              'Button tapped ${snapshot.data} time${snapshot.data == 1 ? '' : 's'}.\n\n'
                  'This should persist across restarts.',
            );
          },
        ),
      ),
    );
  }
}