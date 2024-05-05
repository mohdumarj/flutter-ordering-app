import 'package:flutter/material.dart';

import '../Pages/KpiCardPage.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: ListView(
        children: const [
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
