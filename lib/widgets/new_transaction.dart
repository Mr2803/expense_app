import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  //aggiungo un nuovo final per richiamare il metodo privato all interno di user_transaction
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final inputTitleUser = _titleController.text;
    final inputAmountUser = double.parse(_amountController.text);
    if (inputTitleUser.isEmpty ||
        inputAmountUser <= 0 ||
        _selectedDate == null) {
      if (_selectedDate == null) {
        _selectedDate = DateTime.now();
      }
      return;
    }
    widget.addTransaction(
      inputTitleUser,
      inputAmountUser,
      _selectedDate,
    );

    //Navigator mi permette di chiudere il widget modale appena completato l'aggiunta della nuova transazione
    Navigator.of(context).pop();
  }

  void _datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      //devo avvolgerla nello stato impostato altrimenti non può essere eseguito il render dell' app
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Spesa'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              //questa è una convenzione , utilizzare una funzione anonima che accetta un argomento ma inserendo _ dico che non mi serve in questo specifico punto
              onSubmitted: (_) => _submitData(),
              // onChanged: (value) => amountInput = value,
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'Nessuna data selezionata'
                          : 'Data selezionata : ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Seleziona una data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      return _datePicker();
                    },
                  )
                ],
              ),
            ),
            RaisedButton(
              child: Text('Aggiungi transazione'),
              color: Theme.of(context).primaryColor,
              onPressed: _submitData,
            )
          ],
        ),
      ),
    );
  }
}
