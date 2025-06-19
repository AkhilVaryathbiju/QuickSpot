import 'package:flutter/material.dart';
import 'package:quickspot/models/accountModel.dart';

class Accountprovider extends ChangeNotifier {
Account ? _account;
Account? get account=>_account;


void seaccount(Account account){
  _account=account;
  notifyListeners();
}


void updateEmail(String newmail){
  if(_account!=null){
    _account=Account(name: account!.name,
     Adress: account!.Adress,
      Email: newmail, ph: account!.ph, 
      vehicles: account!.vehicles ) ;
      notifyListeners();
  }
  
}

}