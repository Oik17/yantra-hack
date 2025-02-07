import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:yantra_blackspace/constants.dart';
import 'package:yantra_blackspace/widgets/bottom_navbar.dart';


class HomeScreen extends StatelessWidget {
  final List<FlSpot> powerData = [
    FlSpot(10, 30),
    FlSpot(12, 45),
    FlSpot(14, 80),
    FlSpot(16, 50),
    FlSpot(18, 20),
    FlSpot(20, 10),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              _buildHeader(),
              SizedBox(height: 16),
              _buildChart(),
              SizedBox(height: 16),
              _buildStatsGrid(),
              Spacer(),
              buildBottomNav(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primaryOrange, darkOrange],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: primaryOrange.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(Icons.bolt, color: primaryOrange),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total power output',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text('Total solar panel',
                      style: TextStyle(color: Colors.white70, fontSize: 14)),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text('Day',
                style: TextStyle(
                    color: primaryOrange, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  Widget _buildChart() {
    return Container(
      height: 250,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.withOpacity(0.1),
                strokeWidth: 1,
              );
            },
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: Colors.grey.withOpacity(0.1),
                strokeWidth: 1,
              );
            },
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return Text(
                    '${value.toInt()}:00',
                    style: TextStyle(color: textDark, fontSize: 12),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: powerData,
              isCurved: true,
              color: primaryOrange,
              barWidth: 3,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 4,
                    color: Colors.white,
                    strokeWidth: 2,
                    strokeColor: primaryOrange,
                  );
                },
              ),
              belowBarData: BarAreaData(
                show: true,
                color: primaryOrange.withOpacity(0.1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsGrid() {
    final stats = [
      {'title': 'Total energy', 'value': '80.40 kw/h', 'icon': Icons.bolt},
      {'title': 'Consumed', 'value': '63.52 kw/h', 'icon': Icons.power},
      {
        'title': 'Capacity',
        'value': '10.80 kw/h',
        'icon': Icons.battery_charging_full
      },
      {'title': 'Co2 Reduction', 'value': '12.68 ton', 'icon': Icons.eco},
    ];

    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.5,
      children: stats.map((stat) => _buildStatCard(stat)).toList(),
    );
  }

  Widget _buildStatCard(Map<String, dynamic> stat) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(stat['icon'], color: primaryOrange, size: 20),
              SizedBox(width: 8),
              Text(stat['title']!,
                  style: TextStyle(color: textDark, fontSize: 14)),
            ],
          ),
          SizedBox(height: 8),
          Text(stat['value']!,
              style: TextStyle(
                  color: textDark, fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  
}
