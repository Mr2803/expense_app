import 'package:flutter/material.dart';
import './transaction.dart';

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
class HomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    //Cominciamo con il creare una transazione fittizia che poi avrà valori dinamici
    //Istanzio il nuovo oggetto
    Transaction(
      id: 't1',
      title: 'Pc',
      amount: 1300.99,
      dateTransaction: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Shoes',
      amount: 59.99,
      dateTransaction: DateTime.now(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //Card è un widget integrato di flutter
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.orange[300],
              child: Text('Chart'),
              elevation: 5,
            ),
          ),
          Column(
            //utilizzo il metodo map per trasformare questo elenco di oggetti in un elenco di widget(in modo che vengano generati in maniera dinamica). NB MAP prende sempre una funzione interna con un argomento
            children: transactions.map((transaction) {
              return Card(child: Text(transaction.title));
            }).toList(),
          )
        ],
      ),
    );
  }
}
