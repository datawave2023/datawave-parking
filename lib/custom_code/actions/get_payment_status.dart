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

Future<String> getPaymentStatus(String paymentId) async {
  var url = Uri.parse('https://api.mercadopago.com/v1/payments/$paymentId');
  var headers = {
    'Authorization':
        'Bearer TEST-8321285503187289-102010-a5642aec36bf1396dc5d8cfa29691cf5-266442697',
  };

  var response = await http.get(url, headers: headers);

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return data['status'];
  } else {
    throw Exception('Failed to get payment status');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
