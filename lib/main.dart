import 'package:coronavirus_tracker_ph/networking/networking.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: CovidTracker(),
      ),
    );

class CovidTracker extends StatefulWidget {
  CovidTracker({Key key}) : super(key: key);

  @override
  _CovidTrackerState createState() => _CovidTrackerState();
}

class _CovidTrackerState extends State<CovidTracker> {
  String _status = '';
  String _activeCases;

  void getStatus() async {
    final network = Networking();
    final data = await network.getData();
    final status = data['status'].toString();
    final phCases = data['data']['regions']['philippines']['total_cases'].toString();

    setState(() {
      _status = status;
      _activeCases = phCases;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Crashcourse"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_status),
            if (_activeCases != null) Text(_activeCases),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => getStatus(),
      ),
    );
  }
}
