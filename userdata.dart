import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserData with ChangeNotifier {
  var lastname = '';
  var firstname ='';

  void getlastname(text){
    lastname = text;
    notifyListeners();
  }
  void getfirstname(text){
    firstname =text;
    notifyListeners();
  }
}