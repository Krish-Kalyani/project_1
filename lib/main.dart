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
      houseExpense +
      groceriesExpense +
      entertainmentExpense +
      transportationExpense +
      miscExpense;

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

  void updateSavingsGoal(String goalCategory, double amount) {
    switch (goalCategory) {
      case 'Emergency':
        _userData.emergencySavings = amount;
        break;
      case 'Vacation':
        _userData.vacationSavings = amount;
        break;
      case 'Medical':
        _userData.medicalSavings = amount;
        break;
      case 'Shopping':
        _userData.shoppingSavings = amount;
        break;
    }
    notifyListeners();
  }

  void resetExpenses() {
    _userData.houseExpense = 0.0;
    _userData.groceriesExpense = 0.0;
    _userData.entertainmentExpense = 0.0;
    _userData.transportationExpense = 0.0;
    _userData.miscExpense = 0.0;
    notifyListeners();
  }

  void updateInvestments(double newInvestments) {
    _userData.investments = newInvestments;
    notifyListeners();
  }
}

class BankApp extends StatelessWidget {
  const BankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginScreen(),
      routes: {
        '/incomeExpenses': (context) => const IncomeExpensesScreen(),
        '/savingGoals': (context) => const SavingGoalsScreen(),
        '/investments': (context) => const InvestmentsScreen(),
        '/insights': (context) => const InsightsScreen(),
      },
    );
  }
}

// Login Screen code
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/logo.png', width: 120, height: 120),
          const Text(
            'Login/Create An Account To Organize Your Money The Right Way!',
          ),
          const SizedBox(height: 20),
          _buildTextField('Enter Username'),
          TextButton(onPressed: () {}, child: const Text('Forgot Username?')),
          _buildTextField('Enter Password', obscureText: true),
          TextButton(onPressed: () {}, child: const Text('Forgot Password?')),
          _buildButton('Login', context, onPressed: () {
            Navigator.pushNamed(context, '/incomeExpenses');
          }),
          const Text("I'm a new user. Sign Up"),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint, {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.green[100],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  Widget _buildButton(String text, BuildContext context,
      {VoidCallback? onPressed}) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        minimumSize: const Size(200, 40),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}
