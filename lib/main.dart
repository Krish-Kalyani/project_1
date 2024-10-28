import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserDataProvider(),
      child: const BankApp(),
    ),
  );
}
//USER DATA
class UserData {
  double income;
  double houseExpense;
  double groceriesExpense;
  double entertainmentExpense;
  double transportationExpense;
  double miscExpense;
  double emergencySavings;
  double vacationSavings;
  double medicalSavings;
  double shoppingSavings;
  double investments;
  UserData({
    this.income = 0.0,
    this.houseExpense = 0.0,
    this.groceriesExpense = 0.0,
    this.entertainmentExpense = 0.0,
    this.transportationExpense = 0.0,
    this.miscExpense = 0.0,
    this.emergencySavings = 0.0,
    this.vacationSavings = 0.0,
    this.medicalSavings = 0.0,
    this.shoppingSavings = 0.0,
    this.investments = 0.0,
  });
