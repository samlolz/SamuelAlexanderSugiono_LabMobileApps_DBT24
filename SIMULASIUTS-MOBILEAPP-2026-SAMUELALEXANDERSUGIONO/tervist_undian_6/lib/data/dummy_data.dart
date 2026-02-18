import 'package:latlong2/latlong.dart';

class DummyData {
  static const String userName = 'Bahlil';
  static const String userAvatar = 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Kepala_Badan_Koordinasi_Penanaman_Modal_Bahlil_Lahadalia_%28cropped%29.jpg/960px-Kepala_Badan_Koordinasi_Penanaman_Modal_Bahlil_Lahadalia_%28cropped%29.jpg';
  static const double distanceKm = 4.89;
  static const String timeFormatted = '01:18:02';
  static const String pace = "15'58\"";
  static const int calories = 286;
  static const int steps = 5234;
  static const String dateTime = '17/07/25 8:47 AM';
  static const String activityType = 'Tervist | Outdoor Running';

  // Route polyline points (around Tangerang Selatan area)
  static final List<LatLng> routePoints = [
    const LatLng(-6.2900, 106.7150),
    const LatLng(-6.2890, 106.7158),
    const LatLng(-6.2878, 106.7165),
    const LatLng(-6.2868, 106.7172),
    const LatLng(-6.2855, 106.7180),
    const LatLng(-6.2845, 106.7188),
    const LatLng(-6.2835, 106.7175),
    const LatLng(-6.2825, 106.7162),
    const LatLng(-6.2818, 106.7150),
  ];

  static LatLng get currentPosition => routePoints.last;
  static LatLng get mapCenter => const LatLng(-6.2862, 106.7165);
}