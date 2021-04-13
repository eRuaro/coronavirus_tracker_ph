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
  String _totalCases = '';
  String _activeCases = '';
  String _deaths = '';
  String _recovered = '';

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
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFC1441).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ), 
                  width: 179,
                  height: 131,
                  child: Column(
                    children: [
                      Text('Confirmed'),
                      Text(_totalCases),
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffFC1441).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 179,
                  height: 131,
                  child: Column(
                    children: [
                      Text('Active'),
                      Text(_totalCases),
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.network_check),
        onPressed: () => getStatus(),
      ),
    );
  }
}
