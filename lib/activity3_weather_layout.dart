
import 'package:flutter/material.dart';

void main() {
  runApp(const WeatherDashboardApp());
}

class WeatherDashboardApp extends StatelessWidget {
  const WeatherDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Dashboard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const WeatherDashboardScreen(),
    );
  }
}

class WeatherDashboardScreen extends StatelessWidget {
  const WeatherDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Dashboard'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Magallanes',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Partly Cloudy',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            const Center(
              child: Column(
                children: [
                  Icon(
                    Icons.cloud,
                    size: 80,
                  ),
                  SizedBox(height: 8),
                  Text(
                    '32°',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Row(
              children: [
                Expanded(
                  child: StatBox(
                    icon: Icons.water_drop,
                    label: 'Humidity',
                    value: '70%',
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: StatBox(
                    icon: Icons.air,
                    label: 'Wind',
                    value: '12 km/h',
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: StatBox(
                    icon: Icons.umbrella,
                    label: 'Rain',
                    value: '10%',
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: StatBox(
                    icon: Icons.thermostat,
                    label: 'Feels like',
                    value: '35°',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StatBox extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const StatBox({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Icon(icon, size: 24),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
