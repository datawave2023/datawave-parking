import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _ubicacbool = false;
  bool get ubicacbool => _ubicacbool;
  set ubicacbool(bool _value) {
    _ubicacbool = _value;
  }

  bool _startomer = false;
  bool get startomer => _startomer;
  set startomer(bool _value) {
    _startomer = _value;
  }

  bool _like = false;
  bool get like => _like;
  set like(bool _value) {
    _like = _value;
  }

  String _preferenceId = '';
  String get preferenceId => _preferenceId;
  set preferenceId(String _value) {
    _preferenceId = _value;
  }

  String _tipoactividad = '';
  String get tipoactividad => _tipoactividad;
  set tipoactividad(String _value) {
    _tipoactividad = _value;
  }

  int _tipoactividadindex = 0;
  int get tipoactividadindex => _tipoactividadindex;
  set tipoactividadindex(int _value) {
    _tipoactividadindex = _value;
  }

  int _navbar = 0;
  int get navbar => _navbar;
  set navbar(int _value) {
    _navbar = _value;
  }

  int _patente = 0;
  int get patente => _patente;
  set patente(int _value) {
    _patente = _value;
  }

  int _Autosdiacompleto = 0;
  int get Autosdiacompleto => _Autosdiacompleto;
  set Autosdiacompleto(int _value) {
    _Autosdiacompleto = _value;
  }

  int _autosmediodia = 0;
  int get autosmediodia => _autosmediodia;
  set autosmediodia(int _value) {
    _autosmediodia = _value;
  }

  double _montoacobrarcuidador = 0.0;
  double get montoacobrarcuidador => _montoacobrarcuidador;
  set montoacobrarcuidador(double _value) {
    _montoacobrarcuidador = _value;
  }

  bool _antesdelas16 = false;
  bool get antesdelas16 => _antesdelas16;
  set antesdelas16(bool _value) {
    _antesdelas16 = _value;
  }

  bool _hora16 = false;
  bool get hora16 => _hora16;
  set hora16(bool _value) {
    _hora16 = _value;
  }

  LatLng? _ubicacion;
  LatLng? get ubicacion => _ubicacion;
  set ubicacion(LatLng? _value) {
    _ubicacion = _value;
  }

  DocumentReference? _idvehiculo;
  DocumentReference? get idvehiculo => _idvehiculo;
  set idvehiculo(DocumentReference? _value) {
    _idvehiculo = _value;
  }

  String _patentetext = '';
  String get patentetext => _patentetext;
  set patentetext(String _value) {
    _patentetext = _value;
  }

  double _montopagado = 0.0;
  double get montopagado => _montopagado;
  set montopagado(double _value) {
    _montopagado = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
