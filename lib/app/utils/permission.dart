import 'package:permission_handler/permission_handler.dart';

class AppPermission {
  const AppPermission._();

  static Future<void> requestLocation() async {
    final locStat = await Permission.location.status;

    switch (locStat) {
      case PermissionStatus.denied:
        await [Permission.locationAlways].request();
        break;
      case PermissionStatus.granted:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
        break;
      case PermissionStatus.permanentlyDenied:
        await openAppSettings();
        break;
    }
  }

  static Future<bool> get locationPermissionGranted =>
      Permission.locationAlways.isGranted;
}
