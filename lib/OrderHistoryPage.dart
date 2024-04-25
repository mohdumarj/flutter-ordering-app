import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ForgotPasswordPage.dart';
import 'KpiCardPage.dart';

class OrderHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
      ),
      body: ListView(
        children: [
          // Repeat OrderCard for each historical order
          OrderCard(
            orderNumber: 'Order #122',
            customerName: 'Jane Doe',
            orderDetails: '2x Salad, 1x Soda',
            orderTime: '11:45 AM',
          ),
          // Add more OrderCards as needed...
        ],
      ),
    );
  }
}
