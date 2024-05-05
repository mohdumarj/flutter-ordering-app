import 'package:flutter/material.dart';

import 'KpiCardPage.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now().subtract(const Duration(days: 7)),
    end: DateTime.now(),
  );

  void _pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime.now(),
      initialDateRange: dateRange,
    );

    if (newDateRange == null) return;

    setState(() => dateRange = newDateRange);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics & Reports'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _pickDateRange,
                child: const Text('Select Date Range'),
              ),
            ),
            const KpiCard(title: 'Total Sales', value: '\$12,345'),
            const KpiCard(title: 'Orders', value: '123'),
            const KpiCard(title: 'Average Order Value', value: '\$100.45'),
            // Additional KPIs can be added here
          ],
        ),
      ),
    );
  }
}