import 'package:flutter/material.dart';
import '../core/constants.dart';

class PrayerTimesWidget extends StatefulWidget {
  const PrayerTimesWidget({Key? key}) : super(key: key);

  @override
  State<PrayerTimesWidget> createState() => _PrayerTimesWidgetState();
}

class _PrayerTimesWidgetState extends State<PrayerTimesWidget> {
  late Map<String, String> prayerTimes;

  @override
  void initState() {
    super.initState();
    _loadPrayerTimes();
  }

  void _loadPrayerTimes() {
    // Sample prayer times data
    prayerTimes = {
      'الفجر': '05:30',
      'الشروق': '07:00',
      'الظهر': '12:30',
      'العصر': '15:45',
      'المغرب': '18:15',
      'العشاء': '19:45',
    };
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(kPaddingMedium),
      children: [
        Text(
          'أوقات الصلاة اليوم',
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: kPaddingMedium),
        ...prayerTimes.entries.map((entry) {
          return Card(
            margin: const EdgeInsets.only(bottom: kPaddingMedium),
            child: Padding(
              padding: const EdgeInsets.all(kPaddingMedium),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    entry.key,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kPaddingSmall,
                      vertical: kPaddingSmall,
                    ),
                    decoration: BoxDecoration(
                      color: kGreen,
                      borderRadius: BorderRadius.circular(kBorderRadiusSmall),
                    ),
                    child: Text(
                      entry.value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}