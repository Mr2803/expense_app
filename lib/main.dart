import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';
import './model/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mr Exspense App",
      theme: ThemeData(
          primarySwatch: Colors.orange,
          //questo definisce in autmatico il colore del widget fornito da flutter del bottone floating , se non trova un accent si basa sul colore primario
          accentColor: Colors.greenAccent,
          fontFamily: 'OpenSans',
          textTheme: ThemeData.light().textTheme.copyWith(
                  // ignore: deprecated_member_use
                  headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
          appBarTheme: AppBarTheme(
            // ignore: deprecated_member_use
            textTheme: ThemeData.light().textTheme.copyWith(
                    // ignore: deprecated_member_use
                    headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          )),
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
    // Transaction(
    //   id: 't1',
    //   title: 'Pc',
    //   amount: 130.99,
    //   dateTransaction: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Shoes',
    //   amount: 159.99,
    //   dateTransaction: DateTime.now(),
    // )
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.dateTransaction.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

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
        title: Text(
          "Exspense App",
          //questo è sconveniente perchè se avessi un app con più pagine dovrei impostare lo stesso style text per ogni pagina , per cui posso impostare direttamente il tema della navbar e modificarne il carattere
          // style: TextStyle(
          //   fontFamily: 'Quicksans',
          // ),
        ),
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
            //Card è un widget integrato di flutter

            Chart(_recentTransactions),
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
