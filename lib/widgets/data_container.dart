import 'package:flutter/material.dart';

class DataContainer extends StatelessWidget {
  DataContainer({
    @required this.data,
    @required this.color,
    @required this.dataValue,
  });

  final String dataValue;
  final String data;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      width: 190,
      height: 140,
      child: Column(
        children: [

          Align(
            child: Text('$data'),
            alignment: Alignment.topLeft,
          ),
          SizedBox(
            height: 60,
          ),
          Align(
            child: Text('$dataValue'),
            alignment: Alignment.bottomRight,
          ),
        ],
      ),
      padding: const EdgeInsets.all(15),
    );
  }
}
