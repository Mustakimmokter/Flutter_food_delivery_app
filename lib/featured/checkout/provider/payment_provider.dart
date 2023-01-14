import 'package:flutter/material.dart';

enum PaymentValue{
  google,
  masterCard,
  paypal
}

class PaymentProvider extends ChangeNotifier {

  dynamic _payment = PaymentValue.google;

  final List<String> _groupValue = ['google','mastercard','paypal'];

  List<String> get groupValue => _groupValue;
  dynamic get payment => _payment;

  void getSelectedMethod(dynamic value){
    _payment = value;
    notifyListeners();
  }

}