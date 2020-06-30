import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  //aggiungo un nuovo final per richiamare il metodo privato all interno di user_transaction
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final inputTitleUser = titleController.text;
    final inputAmountUser = double.parse(amountController.text);
    if (inputTitleUser.isEmpty || inputAmountUser <= 0) {
      return;
    }
    widget.addTransaction(inputTitleUser, inputAmountUser);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Titolo'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Spesa'),
              controller: amountController,
              keyboardType: TextInputType.number,
              //questa è una convenzione , utilizzare una funzione anonima che accetta un argomento ma inserendo _ dico che non mi serve in questo specifico punto
              onSubmitted: (_) => submitData(),
              // onChanged: (value) => amountInput = value,
            ),
            FlatButton(
              child: Text('Aggiungi transazione'),
              textColor: Colors.orange,
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
