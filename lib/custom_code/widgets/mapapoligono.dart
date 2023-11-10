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

class Mapapoligono extends StatefulWidget {
  const Mapapoligono({
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
  _MapapoligonoState createState() => _MapapoligonoState();
}

class _MapapoligonoState extends State<Mapapoligono> {
  late maps.GoogleMapController _mapController;
  List<maps.LatLng> _polygonPoints = [
    maps.LatLng(-31.401395486746758, -64.5083782723659),
    maps.LatLng(-31.400131747345366, -64.50702643909497),
    maps.LatLng(-31.402787411903102, -64.50906491783685),
    maps.LatLng(-31.402860670550037, -64.50880742578524),
    maps.LatLng(-31.401395486746758, -64.5083782723659),
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
      ),
    );
  }
}
