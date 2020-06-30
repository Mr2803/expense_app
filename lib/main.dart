import 'package:exspense_app/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './model/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mr Exspense App",
      home: HomePage(),
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Flutter App"),
//       ),
//       body: Column(
//         children: <Widget>[
//           //Card è un widget integrato di flutter
//           Card(
//             color: Colors.orange[300],
//             child: Container(
//               child: Text('Chart'),
//               width: double.infinity,
//             ),
//             elevation: 5,
//           ),
//           Card(
//             child: Text('List of transaction'),
//           )
//         ],
//       ),
//     );
//   }
// }
class HomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransactions = [
    //Cominciamo con il creare una transazione fittizia che poi avrà valori dinamici
    //Istanzio il nuovo oggetto
    Transaction(
      id: 't1',
      title: 'Pc',
      amount: 130.99,
      dateTransaction: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Shoes',
      amount: 159.99,
      dateTransaction: DateTime.now(),
    )
  ];

  void _addNewTransaction(String transactionTitle, double transactionAmount) {
    final newTransaction = Transaction(
        title: transactionTitle,
        amount: transactionAmount,
        dateTransaction: DateTime.now(),
        //per il momento assegno questo valore in modo che venga assegnato in automatico e sia unico
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            // onTap: () {},
            child: NewTransaction(_addNewTransaction),
            // behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exspense App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
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
              //Card è un widget integrato di flutter
              child: Card(
                color: Colors.orange[300],
                child: Text('Chart'),
                elevation: 5,
              ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
