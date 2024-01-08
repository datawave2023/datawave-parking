import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double? sumaingresos(List<double>? ingresos) {
  // Sumar los valores de el documento ingreso de la coleccion Balance
  if (ingresos == null || ingresos.isEmpty) {
    return null;
  }
  double sum = 0.0;
  for (double ingreso in ingresos) {
    sum += ingreso;
  }
  return sum;
}

double? balance(
  List<double>? ingreso,
  List<double>? salida,
  double? ingresonuevo,
  double? salidanueva,
) {
  // retornar el balance entre (ingreso + ingresonuevo) - (salida+salidanueva)
  double totalIngreso = 0;
  double totalSalida = 0;

  if (ingreso != null) {
    for (double i in ingreso) {
      totalIngreso += i;
    }
  }

  if (salida != null) {
    for (double s in salida) {
      totalSalida += s;
    }
  }

  if (ingresonuevo != null) {
    totalIngreso += ingresonuevo;
  }

  if (salidanueva != null) {
    totalSalida += salidanueva;
  }

  return totalIngreso - totalSalida;
}

int? horas(
  List<DateTime>? fechas,
  DateTime? currentime,
) {
  // return count fechas que esten entre el inicio del dia de hoy y current time
  if (fechas == null || currentime == null) {
    return null;
  }

  final now = DateTime.now();
  final startOfDay = DateTime(now.year, now.month, now.day);
  final count = fechas
      .where((fecha) => fecha.isAfter(startOfDay) && fecha.isBefore(currentime))
      .length;

  return count;
}

String? definepolygon() {
  // define a polygon in google maps
// Define a polygon in Google Maps
  String polygon = '''
  <script>
    function initMap() {
      const map = new google.maps.Map(document.getElementById("map"), {
        zoom: 4,
        center: { lat: -31.502066738459643, lng: -64.54162878806835 },
      });
      const parkingCoords = [
        { lat: -31.4979508, lng: -64.5427709 },
        { lat: -31.5120743, lng: -64.5449167 },
        { lat: -31.5125134, lng: -64.5382219 },
        { lat: -31.49839, lng:  -64.5370202 },
        { lat: -31.4979508, lng:  -64.5427709 },
      ];
      const parkingarea = new google.maps.Polygon({
        paths: parkingCoords,
        strokeColor: "#FF0000",
        strokeOpacity: 0.8,
        strokeWeight: 2,
        fillColor: "#FF0000",
        fillOpacity: 0.35,
      });
      parkingarea.setMap(map);
    }
  </script>
''';

  return polygon;
}

bool newCustomFunction(LatLng? latLng) {
  // Retornar verdadero o falso si el argumento LatLng esta dentro de un poligono
// Define the polygon coordinates
  List<LatLng> polygonCoords = [
    LatLng(-31.399060290195738, -64.51080301951468),
    LatLng(-31.39632209853696, -64.50870553217766),
    LatLng(-31.398373460327605, -64.50546542386165),
    LatLng(-31.401194009595066, -64.50194636582307),
    LatLng(-31.40736595484785, -64.50786868300996),
    LatLng(-31.399060290195738, -64.51080301951468),
  ];

  // Check if the point is inside the polygon using the ray-casting algorithm
  int i, j = polygonCoords.length - 1;
  bool isInside = false;
  for (i = 0; i < polygonCoords.length; i++) {
    if ((polygonCoords[i].longitude > latLng!.longitude) !=
            (polygonCoords[j].longitude > latLng.longitude) &&
        (latLng.latitude <
            (polygonCoords[j].latitude - polygonCoords[i].latitude) *
                    (latLng.longitude - polygonCoords[i].longitude) /
                    (polygonCoords[j].longitude - polygonCoords[i].longitude) +
                polygonCoords[i].latitude)) {
      isInside = !isInside;
    }
    j = i;
  }

  return isInside;
}

double tiempodeestacionamiento(
  DateTime inicioestacionamiento,
  DateTime finestacionamiento,
) {
  // retornar minutos entre dos datetime (finestacionamiento-inicioestacionamiento) y dividirlo en 60
  final duration = finestacionamiento.difference(inicioestacionamiento);
  final minutes = duration.inMinutes;
  return minutes / 60.0;
}

double? longitud(LatLng? coordenada) {
  // retornar latitud a partir de LatLng(lat: 0, lng: 0)
  return coordenada?.longitude;
}

double? montoacobrar2(
  double tiempo,
  double? valorhora,
) {
  return tiempo * (valorhora ?? 0.0);
}

double? promediotiempoestacionamiento(
  double? tiempoestacionamiento,
  int? countmovimientos,
) {
  // return promedio de la suma de tiempoestacionamiento y countmovimiento.
  if (tiempoestacionamiento == null ||
      countmovimientos == null ||
      countmovimientos == 0) {
    return null;
  }
  return tiempoestacionamiento / countmovimientos;
}

String mayuscula(String patente) {
  // return uppercase patente
  return patente.toUpperCase();
}

double cuidadorescobrar(
  double monto,
  double porcentaje,
) {
  // return monto * porcentaje
  return monto * porcentaje;
}

bool? hora16() {
  // return true si la hora de del dia de hoy es menor a las 16hs de argentina
  final now = DateTime.now()
      .toUtc()
      .add(Duration(hours: -3)); // Convert to Argentina time
  final hour = now.hour;
  return hour < 18;
}

double? latitud(LatLng? coordenada) {
  // retornar latitud a partir de LatLng(lat: 0, lng: 0)
  if (coordenada != null) {
    return coordenada.latitude;
  } else {
    return null;
  }
}

int? contarautosinspeccionados(List<DateTime>? fecha) {
  // count fecha que esten dentro de 00 hs y la 23 del dia de hoy con el horario de argentina
  final now = DateTime.now()
      .toUtc()
      .subtract(Duration(hours: -3)); // Adjust for Argentina timezone
  final startOfDay = DateTime(now.year, now.month, now.day);
  final endOfDay =
      startOfDay.add(Duration(days: 1)).subtract(Duration(milliseconds: 1));
  final filteredDates = fecha
      ?.where((date) => date.isAfter(startOfDay) && date.isBefore(endOfDay));
  return filteredDates?.length;
}

DateTime? hoy() {
  // return today 00 hs de argentina
  final now = DateTime.now();
  final argentina = DateTime.now().toUtc().add(Duration(hours: -3));
  final today = DateTime(argentina.year, argentina.month, argentina.day);
  return today; // returns today at 00:00:00 in Argentina timezone
}
