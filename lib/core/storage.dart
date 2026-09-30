import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _prayerTimesKey = 'prayer_times';
  static const String _qiblaDirectionKey = 'qibla_direction';
  static const String _userLocationKey = 'user_location';
  static const String _adhkarKey = 'adhkar_list';

  static Future<void> savePrayerTimes(String prayerTimes) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prayerTimesKey, prayerTimes);
  }

  static Future<String?> getPrayerTimes() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_prayerTimesKey);
  }

  static Future<void> saveQiblaDirection(double direction) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_qiblaDirectionKey, direction);
  }

  static Future<double?> getQiblaDirection() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_qiblaDirectionKey);
  }

  static Future<void> saveUserLocation(String latitude, String longitude) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userLocationKey, '$latitude,$longitude');
  }

  static Future<String?> getUserLocation() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userLocationKey);
  }

  static Future<void> saveAdhkar(String adhkar) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_adhkarKey, adhkar);
  }

  static Future<String?> getAdhkar() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_adhkarKey);
  }
}