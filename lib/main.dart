import 'package:coronavirus_tracker_ph/networking/networking.dart';
import 'package:coronavirus_tracker_ph/widgets/data_container.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: CovidTracker(),
        debugShowCheckedModeBanner: false,
      ),
    );

class CovidTracker extends StatefulWidget {
  CovidTracker({Key key}) : super(key: key);

  @override
  _CovidTrackerState createState() => _CovidTrackerState();
}

class _CovidTrackerState extends State<CovidTracker> {
  String _totalCases = '';
  String _activeCases = '';
  String _deaths = '';
  String _recovered = '';

  void getStatus() async {
    final network = Networking();
    final data = await network.getData();
    final phCases =
        data['data']['regions']['philippines']['total_cases'].toString();
    final phActiveCases =
        data['data']['regions']['philippines']['active_cases'].toString();
    final phDeathCases =
        data['data']['regions']['philippines']['deaths'].toString();
    final phRecoveredCases =
        data['data']['regions']['philippines']['recovered'].toString();

    setState(() {
      _totalCases = phCases;
      _activeCases = phActiveCases;
      _deaths = phDeathCases;
      _recovered = phRecoveredCases;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DataContainer(
                data: 'Confirmed',
                color: Color(0xFFFC1441),
                dataValue: _totalCases,
              ),
              SizedBox(
                width: 20,
              ),
              DataContainer(
                color: Color(0xFF157FFB),
                data: 'Active',
                dataValue: _activeCases,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DataContainer(
                data: 'Recovered',
                color: Color(0xFF30A64A),
                dataValue: _recovered,
              ),
              SizedBox(
                width: 20,
              ),
              DataContainer(
                color: Color(0xFF6D757D),
                data: 'Deceased',
                dataValue: _deaths,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.network_check),
        onPressed: () => getStatus(),
      ),
    );
  }
}
