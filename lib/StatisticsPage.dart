import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ForgotPasswordPage.dart';
import 'KpiCardPage.dart';

class StatisticsPage extends StatefulWidget {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now().subtract(Duration(days: 7)),
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
        title: Text('Statistics & Reports'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _pickDateRange,
                child: Text('Select Date Range'),
              ),
            ),
            KpiCard(title: 'Total Sales', value: '\$12,345'),
            KpiCard(title: 'Orders', value: '123'),
            KpiCard(title: 'Average Order Value', value: '\$100.45'),
            // Additional KPIs can be added here
          ],
        ),
      ),
    );
  }
}