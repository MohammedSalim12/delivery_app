import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Dio dio = Dio();

Future getPolyline(lat, long, destlat, destlong) async {
  List<LatLng> polylineco = [];
  PolylinePoints polylinePoints = PolylinePoints();
  Set<Polyline> polylineSet = {};

  String url =
      "https://maps.googleapis.com/maps/api/direction/json?origin=$lat,$long&destination=$destlat,$destlong&key=keymap"; // <------- the your key

  var respones = await dio.post(url);

  var responesbody = respones.data;

  var point = responesbody['routes'][0]['overview_polyline']['points'];

  List<PointLatLng> result = polylinePoints.decodePolyline(point);
  if (result.isNotEmpty) {
    result.forEach((PointLatLng pointlatlong) {
      polylineco.add(LatLng(pointlatlong.latitude, pointlatlong.longitude));
    });
  }
  Polyline polyline = Polyline(
    polylineId: PolylineId("mohammed"),
    color: Color(0xff245db),
    width: 5,
    points: polylineco,
  );
  polylineSet.add(polyline);
  return polylineSet;
}
