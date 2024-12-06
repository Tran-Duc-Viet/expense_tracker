import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses-list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget{

  const ExpensesList(this.expenses,this.removeExpense,{super.key});

  final void Function(Expense expense) removeExpense;

  final List<Expense> expenses;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: expenses.length,itemBuilder: (ctx,index){
      return Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal),
          ),
        onDismissed: (direction){
          removeExpense(expenses[index]);
        },
        child: ExpenseItem(expenses[index]));
    });
  }

}