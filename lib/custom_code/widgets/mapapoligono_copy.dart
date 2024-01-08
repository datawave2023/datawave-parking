// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;

class MapapoligonoCopy extends StatefulWidget {
  const MapapoligonoCopy({
    Key? key,
    this.width,
    this.height,
    required this.ubicacionusuario,
    required this.centrodelmapa,
  }) : super(key: key);

  final double? width;
  final double? height;
  final LatLng ubicacionusuario;
  final LatLng centrodelmapa;

  @override
  _MapapoligonoCopyState createState() => _MapapoligonoCopyState();
}

class _MapapoligonoCopyState extends State<MapapoligonoCopy> {
  late maps.GoogleMapController _mapController;
  List<maps.LatLng> _polygonPoints = [
    maps.LatLng(-31.4674925, -64.535826),
    maps.LatLng(-31.4679866, -64.540654),
    maps.LatLng(-31.4736417, -64.5342811),
    maps.LatLng(-31.4759659, -64.5328005),
    maps.LatLng(-31.4788939, -64.5316632),
    maps.LatLng(-31.4816389, -64.5306332),
    maps.LatLng(-31.4821329, -64.5299466),
    maps.LatLng(-31.4794429, -64.525934),
    maps.LatLng(-31.4748313, -64.522651),
    maps.LatLng(-31.4628253, -64.5194538),
    maps.LatLng(-31.4621664, -64.5224579),
    maps.LatLng(-31.4752888, -64.5258053),
    maps.LatLng(-31.4779057, -64.5277794),
    maps.LatLng(-31.4789854, -64.5291741),
    maps.LatLng(-31.4751058, -64.5300539),
    maps.LatLng(-31.4674925, -64.535826),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zona de estacionamiento medido'),
      ),
      body: maps.GoogleMap(
        onMapCreated: (controller) {
          _mapController = controller;
        },
        initialCameraPosition: maps.CameraPosition(
          target: maps.LatLng(-31.401395486746758,
              -64.5083782723659), // Coordenadas de San Francisco
          zoom: 15,
        ),
        polygons: {
          maps.Polygon(
            polygonId: maps.PolygonId('myPolygon'),
            points: _polygonPoints,
            fillColor: Colors.blue.withOpacity(0.5),
            strokeColor: Colors.blue,
            strokeWidth: 2,
          ),
        },
        markers: {
          maps.Marker(
            markerId: maps.MarkerId('miMarcador'),
            position: maps.LatLng(
              widget.ubicacionusuario.latitude,
              widget.ubicacionusuario.longitude,
            ),
            visible: true,
          ),
        },
      ),
    );
  }
}
