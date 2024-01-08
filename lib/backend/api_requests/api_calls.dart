import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class WeatherApiCallCall {
  static Future<ApiCallResponse> call({
    double? latitude,
    double? longitude,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'weather api call',
      apiUrl: 'https://api.open-meteo.com/v1/forecast',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'latitude': latitude,
        'longitude': longitude,
        'hourly': "temperature_2m",
        'forecast_days': 1,
        'past_days': 1,
        'past_hours': 1,
        'forecast_hours': 1,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? temperature(dynamic response) => getJsonField(
        response,
        r'''$.hourly.temperature_2m''',
        true,
      ) as List?;
}

class CrearPagoCall {
  static Future<ApiCallResponse> call({
    double? monto,
    String? accessToken = '',
    String? carId = '',
    String? carId2 = '',
    String? idUser = '',
    String? coordenada = '',
    String? patente = '',
    String? backurl =
        'https://estacionamiento-medido-c8mrlm.flutterflow.app/estacionamiento',
  }) async {
    final ffApiRequestBody = '''
{
  "back_urls": {
    "failure": "",
    "pending": "",
    "success": "${backurl}"
  },
  "metadata": {
    "car_id": "${carId}",
    "car_id2": "${carId2}",
    "IdUser": "${idUser}",
    "Coordenada": "${coordenada}",
    "Patente": "${patente}"
  },
  "notification_url": "https://us-central1-parkingapp-d397e.cloudfunctions.net/app/payment-webhook",
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
      alwaysAllowBody: false,
    );
  }

  static String? idtransaction(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$["auto_return"]''',
      ));
  static int? monto(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.transaction_amount''',
      ));
  static String? mensaje(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$["message"]''',
      ));
  static String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$["init_point"]''',
      ));
}

class GetPagoCall {
  static Future<ApiCallResponse> call({
    String? id = '',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get pago',
      apiUrl: 'https://api.mercadopago.com/v1/payments/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static int? idtransaction(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$["auto_return"]''',
      ));
  static double? monto(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.transaction_amount''',
      ));
  static String? mensaje(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$["message"]''',
      ));
  static String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$["init_point"]''',
      ));
  static String? pagoaprobado(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class GetPagoCopyCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get pago Copy',
      apiUrl: 'https://api.mercadopago.com/v1/payments/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer APP_USR-5831127204307443-102712-fa2771b346da10dccbc10b42cd3a4722-266442697',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static int? idtransaction(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$["auto_return"]''',
      ));
  static double? monto(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.transaction_amount''',
      ));
  static String? mensaje(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$["message"]''',
      ));
  static String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$["init_point"]''',
      ));
  static String? pagoaprobado(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
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
