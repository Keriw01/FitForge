import 'package:cloud_firestore/cloud_firestore.dart';

String formatGeoPoint(GeoPoint? geoPoint) {
  if (geoPoint == null) {
    return '';
  }
  return '${geoPoint.latitude}, ${geoPoint.longitude}';
}
