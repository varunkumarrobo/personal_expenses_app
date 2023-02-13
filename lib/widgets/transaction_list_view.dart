import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionListView extends StatelessWidget {
  const TransactionListView({
    super.key,
    required this.transactions,
    required this.deleteTx,
  });

  final  Transaction transactions;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 8,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text(
                  '\$${transactions.amount.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(
          transactions.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transactions.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460 
        ? TextButton.icon(
          onPressed: (){deleteTx(transactions.id);}, 
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.error,
          ),
          icon: const Icon(Icons.delete), 
          label: const Text('Delete') ,
          )
          : IconButton(
          onPressed: () {deleteTx(transactions.id);},
          icon: const Icon(Icons.delete),
          color: Theme.of(context).colorScheme.error,
        ),
      ),
    );
  }
}