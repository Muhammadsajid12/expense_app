import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transactions.dart';
import 'package:intl/intl.dart';

class TransationList extends StatelessWidget {
//  This is simply a variable cantaining the array value..
  final List<Transaction> alltransations;
  final Function deleteFX;

//  Here Constructor Call to accept value......
  TransationList(this.alltransations, this.deleteFX);

  @override
  // What is context thing is here context hold metadata about widget tree positions size and so on...😎😋
  Widget build(BuildContext context) {
    return Container(
      height: 570,
      //  Here List builder is important to create scrollabel list......
      child: alltransations.isEmpty
          ? Container(
              height: 20,
              child: Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Image.asset(
                    'assets/images/data.png',
                    height: 160,
                  )
                ],
              ),
            )
          : ListView.builder(
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 1, horizontal: 2),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Text('\$${alltransations[index].amount}'),
                      ),
                      title: Text('${alltransations[index].title}'),
                      subtitle: Text(DateFormat.yMMMd()
                          .format(alltransations[index].date)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete_forever),
                        color: Colors.orange,
                        onPressed: () => deleteFX(alltransations[index].id),
                      ),
                    ),
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
