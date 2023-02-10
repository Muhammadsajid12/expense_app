import 'package:flutter/material.dart';
import './widgets/new_transations.dart';
import './widgets/transactions_List.dart';
import './models/transactions.dart';
import './widgets/chart.dart';
import 'widgets/dialogBox.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.orange,
        errorColor: Colors.red,
        fontFamily: 'Quicksand',
        //  Add custom style to all appbars.......
        appBarTheme: AppBarTheme(
          titleTextStyle:
              TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Veron'),
        ),
      ),
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
      id: 't1',
      title: 'New Shoes',
      amount: 12.2,
      date: DateTime.utc(2023, 2, 6),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Shoping',
      amount: 16.2,
      date: DateTime.utc(2023, 2, 6),
    ),
    Transaction(
      id: 't3',
      title: 'Weekly Shoping for cloth',
      amount: 13.2,
      date: DateTime.utc(2023, 2, 6),
    ),
  ];

// This is getter fn which is return the list of recent expensess before 7 days..........
  List<Transaction> get _recentTransactions {
    return _userTransations.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

//  This fn take data from child and post in Transations class....
  void _addNewTransations(
      String txTitle, double txamount, DateTime choosenDate) {
    print('Button have preesed');
    final addUser = Transaction(
      amount: txamount,
      title: txTitle,
      date: choosenDate,
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
          // As we Know NewTransations Widget need A function as Argument that fn brought the value from newTransation widget..
          return GestureDetector(
            child: NewTransations(_addNewTransations),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _deleteTransations(String id) {
    setState(() {
      _userTransations.removeWhere((tx) => tx.id == id);
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
            Chart(_recentTransactions),

            // This widget is statefull widget containing the two more widgets.....
            // UserTransations()

            TransationList(_userTransations, _deleteTransations),
            // DialogFb3(),
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
