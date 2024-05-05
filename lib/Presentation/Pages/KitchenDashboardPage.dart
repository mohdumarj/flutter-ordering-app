import 'package:flutter/material.dart';

import '../Pages/KpiCardPage.dart';
import '../Pages/StatisticsPage.dart';

// import '../KpiCardPage.dart';
// import '../StatisticsPage.dart';

class KitchenDashboardPage extends StatefulWidget {
  final dynamic data;
  const KitchenDashboardPage({super.key, required this.data});

  @override
  State<KitchenDashboardPage> createState() => _KitchenDashboardPageState();
}

class _KitchenDashboardPageState extends State<KitchenDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kitchen Dashboard')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return OrderCard(
            orderNumber: 'Order #${index + 1}',
            customerName: 'Customer ${index + 1}',
            orderDetails: 'Details for order ${index + 1}',
            orderTime: '${12 + index}:00 PM',
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Statistics'),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const StatisticsPage()));
          }
        },
      ),
    );
  }
}


