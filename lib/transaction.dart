import 'package:flutter/foundation.dart';

//qui creeremo una classe normale che sarà solo un normale oggetto dart , quindi non avrà bisogno di estendere le classi di stato

class Transaction {
  //definisco ora come dovrebbe apparire il mio oggetto

  //Comincio dall id , univoco , che identifica ogni transazione
  String id;
  //potrebbe essere il nome dell'oggetto o del bene con cui abbiamo effettuato la transazione
  String title;

  double amount;

  DateTime dateTransaction;

  Transaction({
    //il required non viene immediatamente riconosciuto ,dobbiamo quindi importare il pacchetto foundation
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.dateTransaction,
  });
}
