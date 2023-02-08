// import 'package:flutter/cupertino.dart';
// import '../models/transactions.dart';
// import './new_transations.dart';
// import './transactions_List.dart';

// class UserTransations extends StatefulWidget {
//   @override
//   State<UserTransations> createState() => _UserTransationsState();
// }

// class _UserTransationsState extends State<UserTransations> {
//   //  Here i add some dummy data to Tramsations class...

//   final List<Transaction> userTransations = [
//     Transaction(
//         id: 't1', title: 'New Shoes', amount: 12.2, date: DateTime.now()),
//     Transaction(
//         id: 't1', title: 'Weekly Shoping', amount: 16.2, date: DateTime.now())
//   ];

// //  This fn take data from child and post in Transations class....
//   void _addNewTransations(String txTitle, double txamount) {
//     print('Button have preesed');
//     final addUser = Transaction(
//       amount: txamount,
//       title: txTitle,
//       date: DateTime.now(),
//       id: DateTime.now().toString(),
//     );
//     //  Here add data which user enter through form and reset the state of widget .....
//     setState(() {
//       userTransations.add(addUser);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         NewTransations(_addNewTransations),
//         TransationList(userTransations),
//       ],
//     );
//   }
// }

//  This widget have no effect on app but i keep this ass learning purpose..............😎😎😎😎