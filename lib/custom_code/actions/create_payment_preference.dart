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
import 'dart:convert';

Future<String> createPaymentPreference(String monto) async {
  var url = Uri.parse('https://api.mercadopago.com/checkout/preferences');
  var headers = {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer TEST-8321285503187289-102010-a5642aec36bf1396dc5d8cfa29691cf5-266442697',
  };
  var body = jsonEncode({
    "back_urls": {
      "failure": "",
      "pending": "",
      "success":
          "estacionamientomedido://estacionamientomedido.com/pag_intermedia"
    },
    "items": [
      {
        "title": "saldo",
        "quantity": 1,
        "currency_id": "ARS",
        "unit_price": monto
      }
    ]
  });

  try {
    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data['id'];
    } else {
      throw Exception('Failed to create payment preference. Status code:}');
    }
  } catch (e) {
    // Handle network errors
    print('Failed to create payment preference: $e');
    throw e;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
