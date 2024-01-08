// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

Future montoAcobrarmp(double? monto) async {
  // Add your function code here!
  String accessToken =
      'TU_ACCESS_TOKEN_DE_MERCADO_PAGO'; // Reemplaza con tu access token
  String url =
      'https://api.mercadopago.com/checkout/preferences'; // URL de la API de Mercado Pago para crear un pago

  Map<String, dynamic> body = {
    'items': [
      {
        'title': 'Producto o servicio',
        'quantity': 1,
        'currency_id': 'ARS', // Moneda (pesos argentinos en este caso)
        'unit_price': monto // El monto que desees cobrar
      }
    ]
    // Otros campos que puedas necesitar para la solicitud
  };

  var response = await http.post(
    Uri.parse(url),
    headers: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json',
    },
    body: jsonEncode(body),
  );

  if (response.statusCode == 201) {
    Map<String, dynamic> jsonObject = jsonDecode(response.body);
    var preferenceId = jsonObject['id'];
    var url =
        'https://sandbox.mercadopago.com.ar/checkout/v1/redirect?pref_id=$preferenceId';
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  } else {
    print('Error al crear el pago');
    //print(response.body);
  }
}
