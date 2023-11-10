// Automatic FlutterFlow imports
import '/backend/backend.dart';
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
    maps.LatLng(-31.399060290195738, -64.51080301951468),
    maps.LatLng(-31.39632209853696, -64.50870553217766),
    maps.LatLng(-31.398373460327605, -64.50546542386165),
    maps.LatLng(-31.401194009595066, -64.50194636582307),
    maps.LatLng(-31.40736595484785, -64.50786868300996),
    maps.LatLng(-31.399060290195738, -64.51080301951468),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa de Google'),
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
