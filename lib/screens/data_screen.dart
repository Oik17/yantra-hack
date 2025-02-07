import 'package:flutter/material.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        elevation: 0,
        title:
            const Text('My Workspace', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tabs for Day, Week, Month, Year
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: ['Day', 'Week', 'Month', 'Year'].map((tab) {
                final isSelected = tab == 'Week'; // Highlight "Week" tab
                return GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color:
                          isSelected ? Colors.orange[400] : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      tab,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // Bar Chart Section
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children:
                    [50, 80, 70, 100, 60, 70, 80].asMap().entries.map((entry) {
                  final day =
                      ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'][entry.key];
                  final height = entry.value;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: height.toDouble(),
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.orange[400],
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(day),
                    ],
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),

            // Energy Usage Cards
            Expanded(
              flex: 3,
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 1.5,
                children: [
                  _buildEnergyCard(
                    icon: Icons.ac_unit,
                    label: 'Air-Conditioning',
                    value: '126 kw/h',
                  ),
                  _buildEnergyCard(
                    icon: Icons.videocam,
                    label: 'CCTV',
                    value: '42.5 kw/h',
                  ),
                  _buildEnergyCard(
                    icon: Icons.tv,
                    label: 'Smart TV',
                    value: '12 kw/h',
                  ),
                  _buildEnergyCard(
                    icon: Icons.computer,
                    label: 'Computer',
                    value: '30.25 kw/h',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEnergyCard({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 40, color: Colors.orange[400]),
          Text(label),
          Text(value, style: TextStyle(color: Colors.orange[400])),
        ],
      ),
    );
  }
}
