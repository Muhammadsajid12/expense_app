import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/chart_Bar.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  const Chart(this.recentTransaction);

//  This fn return List of expensess......
  List<Map<String, Object>> get groupedtransationValues {
    return List.generate(7, (index) {
      final weekDay = new DateTime.now().subtract(
        Duration(days: index),
      );

      var totalSum = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalSum += recentTransaction[i].amount;
        }
      }

      print(DateFormat.E().format(weekDay));
      print(totalSum);

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

//  This property return all totalSpending in one day...................
  double get totalSpending {
    return groupedtransationValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(groupedtransationValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedtransationValues.map((data) {
              // Here is ChartBar Widget that expecting three arguments....
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    data['day'],
                    data['amount'],
                    totalSpending == 0
                        ? 0.0
                        : (data['amount'] as double) / totalSpending),
              );
            }).toList()),
      ),
    );
  }
}
