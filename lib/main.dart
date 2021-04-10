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
  String _status;
  String _totalCases;
  String _activeCases;

  void getStatus() async {
    final network = Networking();
    final data = await network.getData();
    final status = data['status'].toString();
    final phCases =
        data['data']['regions']['philippines']['total_cases'].toString();
    final phActiveCases =
        data['data']['regions']['philippines']['active_cases'].toString();

    setState(() {
      _status = status;
      _totalCases = phCases;
      _activeCases = phActiveCases;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_status != null) Text(_status),
            if (_totalCases != null) Text(_totalCases),
            if (_activeCases != null) Text('Cases: $_activeCases'),
            ElevatedButton(
              onPressed: () => getStatus(),
              child: Text('Get Data'),
            ),
          ],
        ),
      ),
    );
  }
}
