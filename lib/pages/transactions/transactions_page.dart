import 'package:flutter/material.dart';
import 'package:grocery_app/pages/transactions/widget/transaction_item.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F5F9),
      appBar: AppBar(
        toolbarHeight: 90,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text(
          "Transactions",
          style: TextStyle(
            fontSize: 18,
            fontWeight: .w500,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 17, vertical: 30),
        itemCount: 5,
        itemBuilder: (context, index) {
          return TransactionItem();
        },
      ),
    );
  }
}
