import 'package:flutter/material.dart';
import './widgets/new_transations.dart';
import './widgets/transactions_List.dart';
import './models/transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //  Here i add some dummy data to Tramsations class...

  final List<Transaction> _userTransations = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 12.2, date: DateTime.now()),
    Transaction(
        id: 't1', title: 'Weekly Shoping', amount: 16.2, date: DateTime.now()),
    Transaction(
        id: 't1',
        title: 'Weekly Shoping for cloth',
        amount: 13.2,
        date: DateTime.now()),
  ];

//  This fn take data from child and post in Transations class....
  void _addNewTransations(String txTitle, double txamount) {
    print('Button have preesed');
    final addUser = Transaction(
      amount: txamount,
      title: txTitle,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    //  Here add data which user enter through form and reset the state of widget .....
    setState(() {
      _userTransations.add(addUser);
    });
  }

// This fuction who is responsible to show form
  void _startAddNewTransactions(ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          // As we Know NewTransations Widget need A function as Argument......
          return GestureDetector(
            child: NewTransations(_addNewTransations),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expense Calculator',
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () => _startAddNewTransactions(context),
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Container(
                  child: Text('Chart'),
                ),
                elevation: 5,
              ),
            ),

            // This widget is statefull widget containing the two more widgets.....
            // UserTransations()

            TransationList(_userTransations),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransactions(context),
      ),
    );
  }
}
