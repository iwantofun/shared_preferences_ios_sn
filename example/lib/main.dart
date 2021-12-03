import 'package:flutter/material.dart';
import 'package:shared_preferences_ios_sn/SPUtil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SharedPreferences Demo',
      home: SharedPreferencesDemo(),
    );
  }
}

class SharedPreferencesDemo extends StatefulWidget {
  const SharedPreferencesDemo({Key? key}) : super(key: key);

  @override
  SharedPreferencesDemoState createState() => SharedPreferencesDemoState();
}

class SharedPreferencesDemoState extends State<SharedPreferencesDemo> {

  int _counter = 0;

  Future<void> _incrementCounter() async {

    /**
     * just instead of "SharedPreferences.getInstance()" with SPUtil.withSuitName()
     * 
     * and then all these datas can be shared to iOS Widget 
     */
    //final prefs = SharedPreferences.getInstance()
    final prefs = await SPUtil.withSuitName("group.my_test");


    final int counter = (prefs.getInt("test_key") ?? 0) + 1;
    prefs.setInt("test_key",counter);
    
    setState(() {
      _counter = counter;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedPreferences Demo'),
      ),
      body: Center(
          child: Text(_counter.toString())),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
