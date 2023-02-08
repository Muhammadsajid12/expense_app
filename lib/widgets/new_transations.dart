import 'package:flutter/material.dart';

class NewTransations extends StatelessWidget {
  //  In Dart to accept value you have specify datatype to every property....
  final Function txFunction;
  // ConstructorCall....
  NewTransations(this.txFunction);
  final titleController = TextEditingController();
  final amountController = TextEditingController();

// Create generic to make resuable......

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredamount = double.parse(amountController.text);

//  Validtion fortitle and amount..
    if (enteredTitle.isEmpty || enteredamount <= 0) {
      return;
    }

    txFunction(
      enteredTitle,
      enteredamount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: EdgeInsets.all(4),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              // onChanged: (val) => titleInput = val,
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (val) => amountInput = val,
              controller: amountController,
              keyboardType: TextInputType.number,
              //  when we click on keybord Done button this fn will call..
              onSubmitted: (_) => submitData(),
            ),
            ElevatedButton(
              child: Text('AddExpenses', style: TextStyle(color: Colors.white)),
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}