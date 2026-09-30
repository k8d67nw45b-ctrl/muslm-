import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../widgets/prayer_times_widget.dart';
import '../widgets/qibla_widget.dart';
import '../widgets/adhkar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const PrayerTimesWidget(),
    const QiblaWidget(),
    const AdhkarWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مسلم'),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'أوقات الصلاة',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration),
            label: 'القبلة',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'الأذكار',
          ),
        ],
      ),
    );
  }
}