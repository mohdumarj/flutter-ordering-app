import 'package:flutter/material.dart';

class KpiCard extends StatelessWidget {
  final String title;
  final String value;

  const KpiCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontSize: 18)),
        trailing: Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
}


class OrderCard extends StatelessWidget {
  final String orderNumber;
  final String customerName;
  final String orderDetails;
  final String orderTime;

  const OrderCard({super.key, 
    required this.orderNumber,
    required this.customerName,
    required this.orderDetails,
    required this.orderTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(orderNumber),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CustomerUser: $customerName'),
            Text('Details: $orderDetails'),
            Text('Time: $orderTime'),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min, // Ensures the row only takes up as much space as its children
          children: [
            IconButton(
              icon: const Icon(Icons.print),
              onPressed: () {
                // Implement your print functionality here
                print('Printing Order: $orderNumber');
              },
            ),
          ],
        ),
      ),
    );
  }
}
