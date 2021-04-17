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
    final totalCases =
        data['data']['regions']['philippines']['total_cases'].toString();
    final activeCases =
        data['data']['regions']['philippines']['active_cases'].toString();
    final deceasedCases =
        data['data']['regions']['philippines']['deaths'].toString();
    final recoveredCases =
        data['data']['regions']['philippines']['recovered'].toString();

    setState(() {
      _totalCases = totalCases;
      _activeCases = activeCases;
      _deaths = deceasedCases;
      _recovered = recoveredCases;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              bottom: 15,
            ),
            child: Align(
              child: Text(
                'Philippines',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff142237),
                ),
              ),
              alignment: Alignment.topLeft,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          AspectRatio(
            aspectRatio: 1.8,
            child: Image(
              image: AssetImage(
                'assets/images/coronavirus.png',
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
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
