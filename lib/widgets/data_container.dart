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

  final dataNameTextStyle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins'
  );

  final dataAttributeTextStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins'
  );

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
            child: Text(
              '$data',
              style: dataNameTextStyle,
            ),
            alignment: Alignment.topLeft,
          ),
          SizedBox(
            height: 60,
          ),
          Align(
            child: Text(
              '$dataValue',
              style: dataAttributeTextStyle,
            ),
            alignment: Alignment.bottomRight,
          ),
        ],
      ),
      padding: const EdgeInsets.all(15),
    );
  }
}
