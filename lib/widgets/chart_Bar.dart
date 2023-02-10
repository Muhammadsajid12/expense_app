import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendigAmount;
  final double percentageAmount;
//  constractor Call..😎😎
  ChartBar(
    this.label,
    this.spendigAmount,
    this.percentageAmount,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(
            child: Text('\$${spendigAmount}'),
          ),
        ),
        SizedBox(height: 4),
        Container(
          height: 60,
          width: 10,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10)),
            ),
            FractionallySizedBox(
              heightFactor: percentageAmount,
              child: Container(
                height: 12,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ]),
        ),
        SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
