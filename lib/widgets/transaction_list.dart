import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      //ListView è un costruttore scorrevole fornito da flutter(come una colonna)
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'Non hai aggiunto ancora nessuna transazione',
                  style: Theme.of(context).textTheme.headline6,
                ),
                //Serve per dare spazio tra il testo e l'immagine
                SizedBox(
                  height: 50,
                ),
                //ho dovuto wrappare l immagine in un container altrimenti non riusciva a capire l altezza che doveva prendere poichè alla colonna non possiamo assegnare altezze e non possiamo raggiungere l altezza del container esterno
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 8,
                  ),
                  child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text('€${transactions[index].amount}'),
                          ),
                        ),
                      ),
                      title: Text(
                        '${transactions[index].title}',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMMd()
                            .format(transactions[index].dateTransaction),
                      )),
                );
                // return Card(
                //     child: Row(
                //   children: <Widget>[
                //     Container(
                //       margin:
                //           EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                //       decoration: BoxDecoration(
                //         border: Border.all(
                //           color: Theme.of(context).primaryColor,
                //           width: 2,
                //         ),
                //       ),
                //       padding: EdgeInsets.all(10),
                //       child: FittedBox(
                //         child: Text(
                //           '€ ${transactions[index].amount.toStringAsFixed(2)}',
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               fontSize: 19,
                //               color: Theme.of(context).primaryColor),
                //         ),
                //       ),
                //     ),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: <Widget>[
                //         Text(
                //           transactions[index].title,
                //           style: Theme.of(context).textTheme.headline6,
                //         ),
                //         Text(
                //           DateFormat('dd/MM/yyyy')
                //               .format(transactions[index].dateTransaction),
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             color: Colors.grey,
                //           ),
                //         )
                //       ],
                //     )
                //   ],
                // ));
              },
              itemCount: transactions.length,
              //utilizzo il metodo map per trasformare questo elenco di oggetti in un elenco di widget(in modo che vengano generati in maniera dinamica). NB MAP prende sempre una funzione interna con un argomento
            ),
    );
  }
}
