import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transactions.dart';
import 'package:intl/intl.dart';

class TransationList extends StatelessWidget {
//  This is simply a variable cantaining the array value..
  final List<Transaction> alltransations;

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
                    alltransations[index].title,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat.yMMMd().format(alltransations[index].date),
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  )
                ],
              )
            ],
          ));
        }),
        itemCount: alltransations.length,

        // children: alltransations.map((tx) {
        //   return
        // }).toList(),
      ),
    );
  }
}
