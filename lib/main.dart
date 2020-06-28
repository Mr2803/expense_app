import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  // String titleInput;
  // String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exspense App"),
      ),
      body: Column(
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
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Titolo'),
                    controller: titleController,
                    // onChanged: (value) {
                    //   titleInput = value;
                    // },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Spesa'),
                    controller: amountController,
                    // onChanged: (value) => amountInput = value,
                  ),
                  FlatButton(
                    child: Text('Aggiungi transazione'),
                    textColor: Colors.orange,
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
          Column(
            //utilizzo il metodo map per trasformare questo elenco di oggetti in un elenco di widget(in modo che vengano generati in maniera dinamica). NB MAP prende sempre una funzione interna con un argomento
            children: transactions.map((transaction) {
              return Card(
                  child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.orange,
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '€ ${transaction.amount}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: Colors.orange),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        transaction.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat('dd/MM/yyyy')
                            .format(transaction.dateTransaction),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  )
                ],
              ));
            }).toList(),
          )
        ],
      ),
    );
  }
}
