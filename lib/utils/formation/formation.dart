import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

String formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  String hours = twoDigits(duration.inHours);
  String minutes = twoDigits(duration.inMinutes.remainder(60));
  String seconds = twoDigits(duration.inSeconds.remainder(60));
  return "$hours:$minutes:$seconds";
}

String formatHour(DateTime? dateTime) {
  final dateFormat = DateFormat('HH:mm');
  String formattedDate = '';

  if (dateTime != null) {
    formattedDate = dateFormat.format(dateTime);
  }

  return formattedDate;
}

String formatLastPerformed(DateTime? dateTime) {
  final dateFormat = DateFormat('EEEE, MMM. HH:mm');
  String formattedDate = '';

  if (dateTime != null) {
    formattedDate = dateFormat.format(dateTime);
  }

  return formattedDate.replaceFirst(
      formattedDate[0], formattedDate[0].toUpperCase());
}

String formatGeoPoint(GeoPoint? geoPoint) {
  if (geoPoint == null) {
    return '';
  }
  return '${geoPoint.latitude}, ${geoPoint.longitude}';
}

DateTime? timestampFromJson(Timestamp? timestamp) {
  return timestamp?.toDate();
}

Timestamp? timestampToJson(DateTime? dateTime) {
  return dateTime != null ? Timestamp.fromDate(dateTime) : null;
}
