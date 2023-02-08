import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transactions.dart';
import 'package:intl/intl.dart';

class TransationList extends StatelessWidget {
//  This is simply a variable cantaining the array value..
  final List<Transaction> alltransations;

//  Here Constructor Call to accept value......
  TransationList(this.alltransations);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 470,
      //  Here List builder is important to create scrollabel list......
      child: ListView.builder(
        itemBuilder: ((context, index) {
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.lightBlue),
                  ),
                  padding: EdgeInsets.all(12),
                  child: Text(
                    //  In a dart $ have a special meaning so if we need use $ as a string so we can use like this \$....
                    '\$${alltransations[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      //  Index here act like as loop variavbel [i] so we can print all intance value.....
                      alltransations[index].title,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat.yMMMd().format(alltransations[index].date),
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          );
        }),
        itemCount: alltransations.length,

        // children: alltransations.map((tx) {
        //   return
        // }).toList(),
      ),
    );
  }
}
