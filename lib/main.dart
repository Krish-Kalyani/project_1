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
// TOTAL OF ALL EXPENSES
  double get totalExpenses =>
      houseExpense + groceriesExpense + entertainmentExpense +
      transportationExpense + miscExpense;

  // TOTAL OF SAVING GOALS
  double get totalSavingsGoal =>
      emergencySavings + vacationSavings + medicalSavings + shoppingSavings;
}

// DATA ACROSS APP
class UserDataProvider with ChangeNotifier {
  final UserData _userData = UserData();

  double get income => _userData.income;
  double get totalExpenses => _userData.totalExpenses;
  double get totalSavingsGoal => _userData.totalSavingsGoal;
  double get investments => _userData.investments;

  // BALANCE CALCULATION
  double get availableBalance => _userData.income - _userData.totalExpenses;

  void updateIncome(double newIncome) {
    _userData.income = newIncome;
    notifyListeners();
  }

  void addExpense(String category, double amount) {
    switch (category) {
      case 'House':
        _userData.houseExpense = amount;
        break;
      case 'Groceries':
        _userData.groceriesExpense = amount;
        break;
      case 'Entertainment':
        _userData.entertainmentExpense = amount;
        break;
      case 'Transportation':
        _userData.transportationExpense = amount;
        break;
      case 'Miscellaneous':
        _userData.miscExpense = amount;
        break;
    }
    notifyListeners();
  }