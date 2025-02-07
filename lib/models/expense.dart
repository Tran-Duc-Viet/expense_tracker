import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work
};

class Expense {
  Expense(this.title, this.amount, this.date, this.category) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get FormattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket(this.category, this.expenses);

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
   : expenses=allExpenses.where((element)=>element.category==category).toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
