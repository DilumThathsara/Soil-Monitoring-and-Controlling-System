import 'package:flutter/material.dart';
import 'package:soil_app/screens/main/status/linechart.dart';

int currentIndex = 0;

class LineMain extends StatelessWidget {
  const LineMain({super.key});

  @override
  Widget build(BuildContext context) => Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        color: const Color(0xff232d37),
        child: Column(
          children: const [
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: LineChartPage(),
            ),
          ],
        ),
      );
}
