import 'package:flutter/material.dart';
import './transaction_list.dart';
import './new_transaction.dart';
import '../model/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
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

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //passo al costruttore newTransaction come argomento la funzione addNewTransaction che è privata per poterla sfruttare all'interno di newTransaction
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions)
      ],
    );
  }
}
