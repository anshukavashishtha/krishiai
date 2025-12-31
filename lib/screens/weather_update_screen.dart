import 'package:flutter/material.dart';
import '../services/weather_update_service.dart';

class WeatherUpdateScreen extends StatefulWidget {
  const WeatherUpdateScreen({super.key});

  @override
  State<WeatherUpdateScreen> createState() => _WeatherUpdateScreenState();
}

class _WeatherUpdateScreenState extends State<WeatherUpdateScreen> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  bool get isDark => Theme.of(context).brightness == Brightness.dark;

  void _update(String input) {
    setState(() {
      _controller.text = input;
      _result = WeatherUpdateService.getWeatherAdvice(input);
    });
  }

  // 🔹 Dropdown tile
  Widget _dropdownSection(String title, List<String> items, IconData icon) {
    return ExpansionTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
      collapsedBackgroundColor:
          isDark ? const Color(0xFF1F2A22) : Colors.green.shade50,
      backgroundColor:
          isDark ? const Color(0xFF1F2A22) : Colors.green.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      children: items
          .map(
            (item) => ListTile(
              dense: true,
              title: Text(
                item,
                style: TextStyle(
                  fontSize: 13,
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
              trailing: const Icon(Icons.chevron_right, size: 18),
              onTap: () => _update(item),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather Updates')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔍 Input
            TextField(
              controller: _controller,
              onSubmitted: _update,
              style: TextStyle(color: isDark ? Colors.white : Colors.black),
              decoration: InputDecoration(
                hintText: 'Type crop or weather',
                filled: true,
                fillColor: isDark ? const Color(0xFF1C1C1C) : Colors.green.shade50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // 🌦 Weather
            _dropdownSection(
              'Weather Conditions',
              ['Rain', 'Heat', 'Cold', 'Wind', 'Humidity'],
              Icons.cloud,
            ),

            // 🌾 Cereals
            _dropdownSection(
              'Cereals',
              ['Wheat', 'Rice', 'Maize', 'Barley', 'Millet', 'Sorghum'],
              Icons.agriculture,
            ),

            // 🍅 Vegetables
            _dropdownSection(
              'Vegetables',
              [
                'Tomato',
                'Potato',
                'Onion',
                'Chilli',
                'Brinjal',
                'Cabbage',
                'Carrot',
                'Cauliflower'
              ],
              Icons.eco,
            ),

            // 🍎 Fruits
            _dropdownSection(
              'Fruits',
              ['Apple', 'Banana', 'Mango', 'Grapes', 'Orange', 'Papaya'],
              Icons.apple,
            ),

            // 🌿 Cash Crops
            _dropdownSection(
              'Cash Crops',
              ['Cotton', 'Sugarcane', 'Sunflower', 'Tobacco'],
              Icons.local_florist,
            ),

            // 🌱 Pulses & Oilseeds
            _dropdownSection(
              'Pulses & Oilseeds',
              ['Chickpea', 'Lentil', 'Groundnut', 'Soybean', 'Mustard'],
              Icons.grass,
            ),

            // 📊 Result
            if (_result.isNotEmpty) ...[
              const SizedBox(height: 14),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Container(
                  key: ValueKey(_result),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color:
                        isDark ? const Color(0xFF24362C) : Colors.green.shade100,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    _result,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.4,
                      color: isDark ? Colors.white70 : Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
