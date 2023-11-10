import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ObtenerTokenCardCall {
  static Future<ApiCallResponse> call({
    String? publicKey = 'TEST-46943c6b-9b40-4908-acdf-bd3f1403f0ec',
    String? accessToken =
        'TEST-8321285503187289-102010-a5642aec36bf1396dc5d8cfa29691cf5-266442697',
    String? cardNumber = '',
    String? cardHolderName = '',
    String? identificationType = '',
    String? identificationNumber = '',
    String? securityCode = '',
    String? cardExpirationYear = '',
    String? cardExpirationMonth = '',
  }) async {
    final ffApiRequestBody = '''
{
  "card_number": "${cardNumber}",
  "card_holder": {
    "name": "${cardHolderName}",
    "identification": {
      "type": "${identificationType}",
      "number": "${identificationNumber}"
    }
  },
  "security_code": "${securityCode}",
  "expiration_month": "${cardExpirationMonth}",
  "expiration_year": "${cardExpirationYear}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Obtener token card',
      apiUrl:
          'https://api.mercadopago.com/v1/card_tokens?public_key=${publicKey}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer${accessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic tokenTarjeta(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  static dynamic ultimosCuatroDigitos(dynamic response) => getJsonField(
        response,
        r'''$.last_four_digits''',
      );
  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
}

class CrearPagoCall {
  static Future<ApiCallResponse> call({
    double? monto,
    String? accessToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "auto_return": "all",
  "back_urls": {
    "failure": "",
    "pending": "",
    "success": "estacionamientomedido://estacionamientomedido.com/pag_intermedia"
  },
  "items": [
    {
      "title": "saldo",
      "quantity": 1,
      "currency_id": "ARS",
      "unit_price": ${monto}
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Crear pago',
      apiUrl: 'https://api.mercadopago.com/checkout/preferences',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic idtransaction(dynamic response) => getJsonField(
        response,
        r'''$["id"]''',
      );
  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$["auto_return"]''',
      );
  static dynamic monto(dynamic response) => getJsonField(
        response,
        r'''$.transaction_amount''',
      );
  static dynamic mensaje(dynamic response) => getJsonField(
        response,
        r'''$["message"]''',
      );
  static dynamic url(dynamic response) => getJsonField(
        response,
        r'''$["init_point"]''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
