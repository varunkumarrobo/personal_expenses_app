import 'package:flutter/material.dart';


import '../models/transaction.dart';
import '../widgets/transaction_list_view.dart'; 

class TransactionList extends StatelessWidget {
  const TransactionList(
    this.transactions,
    this.deleteTx, {
    super.key,
  });

  final List<Transaction> transactions;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
          builder: (ctx,constraints) {
            return Column(
                children: [
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      "assets/images/waiting.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
          }
        )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              return TransactionListView(
                transactions: transactions[index],
                 deleteTx: deleteTx);
            });
  }
}



  // Card(
  //             child: Row(
  //               children: [
  //                 Container(
  //                   margin: const EdgeInsets.symmetric(
  //                     vertical: 10,
  //                     horizontal: 15,
  //                   ),
  //                   decoration: BoxDecoration(
  //                       border: Border.all(
  //                     color: Theme.of(context).primaryColor,
  //                     width: 2,
  //                   ),),
  //                   padding: const EdgeInsets.all(10),
  //                   child: Text(
  //                     '\$${transactions[index].amount.toStringAsFixed(2)}',
  //                     style: TextStyle(
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 20,
  //                       color: Theme.of(context).primaryColor,
  //                     ),
  //                   ),
  //                 ),
  //                 Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       transactions[index].title,
  //                       style: Theme.of(context).textTheme.titleMedium,
  //                     ),
  //                     Text(
  //                       DateFormat('yyyy/MM/dd').format(transactions[index].date),
  //                       style: const TextStyle(
  //                         color: Colors.grey,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           );