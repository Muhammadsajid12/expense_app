import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransations extends StatefulWidget {
  //  In Dart to accept value you have specify datatype to every property....
  final Function txFunction;
  // ConstructorCall....
  NewTransations(this.txFunction);

  @override
  State<NewTransations> createState() => _NewTransationsState();
}

class _NewTransationsState extends State<NewTransations> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _selectedDate;

// Create generic to make resuable......
  void submitData() {
    //  This if check use for aviod null double value submitions......
    if (amountController.text == null) {
      return;
    }
    // Here the value is taking from controllers...
    final enteredTitle = titleController.text;
    final enteredamount = double.parse(amountController.text);
//  Validtion fortitle and amount..
    if (enteredTitle.isEmpty || enteredamount <= 0 || _selectedDate == null) {
      return;
    }

//Here we passing the form inputs value to the txfunction and onething is more important  we can access other class properties by using the widget property..............😎😎
    widget.txFunction(
      enteredTitle,
      enteredamount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _datePicker() {
    //  Show date is a build in class widget as showbottom model to show date...
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime.now())
        .then((date) {
      if (date == null) {
        return;
      }
      setState(() {
        _selectedDate = date;
      });
    });

    print('${_selectedDate}>>>>>>>>>>>>>>');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: EdgeInsets.all(4),
        child: Column(
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
            Row(
              children: [
                Expanded(
                  child: Text(_selectedDate == null
                      ? 'No Date selected'
                      : DateFormat.yMMMd().format(_selectedDate)),
                ),
                TextButton(
                  onPressed: _datePicker,
                  child: Text('Pick the Date'),
                )
              ],
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
