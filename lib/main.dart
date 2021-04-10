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
  String _deaths;
  String _recovered;

  void getStatus() async {
    final network = Networking();
    final data = await network.getData();
    final status = data['status'].toString();
    final phCases =
        data['data']['regions']['philippines']['total_cases'].toString();
    final phActiveCases =
        data['data']['regions']['philippines']['active_cases'].toString();
    final phDeathCases =
        data['data']['regions']['philippines']['deaths'].toString();
    final phRecoveredCases =
        data['data']['regions']['philippines']['recovered'].toString();

    setState(() {
      _status = status;
      _totalCases = phCases;
      _activeCases = phActiveCases;
      _deaths = phDeathCases;
      _recovered = phRecoveredCases;
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
            if (_totalCases != null) Text('Total Cases: $_totalCases'),
            if (_activeCases != null) Text('Active Cases: $_activeCases'),
            if (_deaths != null) Text('Deaths: $_deaths'),
            if (_recovered != null) Text('Recovered: $_recovered'),
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
