

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';



class TransactionList extends StatelessWidget {
    const TransactionList(this.transactions,{super.key,});

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child:  transactions.isEmpty ? Column(
        children: [
          Text('No transactions added yet!',
          style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 20,),
          Container(
            height: 200,
            child: Image.asset("assets/images/waiting.png",
            fit: BoxFit.cover,
            ),),
        ],
      ) :ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx,index) {
          return Card(
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    )),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      '\$${transactions[index].amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        DateFormat('yyyy/MM/dd').format(transactions[index].date),
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
      }
  }