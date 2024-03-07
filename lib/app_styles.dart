
import 'package:flutter/material.dart';

Color primary = const Color(0xff687daf);
Color scienceBlue = const Color(0xFF0262E4); //#0262E4
Color navy = const Color(0xFF0C203D); //#0C203D
Color greenTeal = const Color(0xFF0AB75B); //#0AB75B
Color regentGrey = const Color(0xFF858F9E); //#858F9E
Color ghostWhite = const Color(0xFFF7F9FC); //#F7F9FC
Color white = const Color(0xFFFFFFFF); //#FFFFFF

class AppStyles{
  static Color primaryColor = primary;
  static Color scienceBlueColor = scienceBlue;
  static Color navyColor = navy;
  static Color greenTealColor = greenTeal;
  static Color regentGreyColor = regentGrey;
  static Color ghostWhiteColor = ghostWhite;
  static Color whiteColor = white;
  //
  static Color textColor = const Color(0xff3b3b3b);
  static Color bgColor = const Color(0xffeeedf2);
  static Color orangeColor = const Color(0xFFF37B67);
  static Color kakiColor = const Color(0xFFd2bdb6);
  //Text
  static TextStyle textStyle = TextStyle(fontFamily: 'HelveticaNeue_Medium', fontSize: 16, color: textColor, fontWeight: FontWeight.w500);
  static TextStyle textGhostWhitetyle = TextStyle(fontFamily: 'HelveticaNeue_Light', fontSize: 16, color: ghostWhiteColor, fontWeight: FontWeight.bold);
  //Heading
  static TextStyle headLineStyle1A = TextStyle(fontFamily: 'HelveticaNeue_Medium', fontSize: 26, color: whiteColor, fontWeight: FontWeight.bold);
  static TextStyle headLineStyle1B = TextStyle(fontFamily: 'HelveticaNeue_Medium', fontSize: 20, color: navyColor, fontWeight: FontWeight.bold);
  static TextStyle headLineStyle2 = TextStyle(fontFamily: 'HelveticaNeue_Medium', fontSize: 21, color: textColor, fontWeight: FontWeight.bold);
  static TextStyle headLineStyle2A = TextStyle(fontFamily: 'HelveticaNeue_Medium', fontSize: 21, color: whiteColor, fontWeight: FontWeight.bold);
  static TextStyle headLineStyle3 = const TextStyle(fontFamily: 'HelveticaNeue_Medium', fontSize: 17, fontWeight: FontWeight.w500);
  static TextStyle headLineStyle3B = TextStyle(fontFamily: 'HelveticaNeue_Medium', fontSize: 17, color: regentGreyColor, fontWeight: FontWeight.bold);
  static TextStyle headLineStyle3C = TextStyle(fontFamily: 'HelveticaNeue_Medium', fontSize: 17, color: whiteColor, fontWeight: FontWeight.bold);
  static TextStyle headLineStyle4 = TextStyle(fontFamily: 'HelveticaNeue_Medium', fontSize: 14, color: Colors.grey.shade500, fontWeight: FontWeight.w500);

  static IconData getVehicleIcon(int vehicleTypeId) {
    switch (vehicleTypeId) {
      case 1:
        return Icons.electric_rickshaw;
      case 2:
        return Icons.motorcycle;
      case 3:
        return Icons.bus_alert_rounded;
      case 4:
        return Icons.local_taxi_outlined;
      case 4:
        return Icons.local_taxi_outlined;
      case 7:
        return Icons.airport_shuttle;
      default:
        return Icons.directions_car; // Default icon
    }
  }
}

