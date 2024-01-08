import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MovimientosRecord extends FirestoreRecord {
  MovimientosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "idUser" field.
  DocumentReference? _idUser;
  DocumentReference? get idUser => _idUser;
  bool hasIdUser() => _idUser != null;

  // "Fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "coordenada" field.
  LatLng? _coordenada;
  LatLng? get coordenada => _coordenada;
  bool hasCoordenada() => _coordenada != null;

  // "Patente" field.
  String? _patente;
  String get patente => _patente ?? '';
  bool hasPatente() => _patente != null;

  // "Inicio" field.
  DateTime? _inicio;
  DateTime? get inicio => _inicio;
  bool hasInicio() => _inicio != null;

  // "Fin" field.
  DateTime? _fin;
  DateTime? get fin => _fin;
  bool hasFin() => _fin != null;

  // "Tiempo" field.
  double? _tiempo;
  double get tiempo => _tiempo ?? 0.0;
  bool hasTiempo() => _tiempo != null;

  // "idvehiculo" field.
  DocumentReference? _idvehiculo;
  DocumentReference? get idvehiculo => _idvehiculo;
  bool hasIdvehiculo() => _idvehiculo != null;

  // "idmovimiento" field.
  DocumentReference? _idmovimiento;
  DocumentReference? get idmovimiento => _idmovimiento;
  bool hasIdmovimiento() => _idmovimiento != null;

  // "gasto" field.
  double? _gasto;
  double get gasto => _gasto ?? 0.0;
  bool hasGasto() => _gasto != null;

  // "diacompleto" field.
  bool? _diacompleto;
  bool get diacompleto => _diacompleto ?? false;
  bool hasDiacompleto() => _diacompleto != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _idUser = snapshotData['idUser'] as DocumentReference?;
    _fecha = snapshotData['Fecha'] as DateTime?;
    _coordenada = snapshotData['coordenada'] as LatLng?;
    _patente = snapshotData['Patente'] as String?;
    _inicio = snapshotData['Inicio'] as DateTime?;
    _fin = snapshotData['Fin'] as DateTime?;
    _tiempo = castToType<double>(snapshotData['Tiempo']);
    _idvehiculo = snapshotData['idvehiculo'] as DocumentReference?;
    _idmovimiento = snapshotData['idmovimiento'] as DocumentReference?;
    _gasto = castToType<double>(snapshotData['gasto']);
    _diacompleto = snapshotData['diacompleto'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Movimientos')
          : FirebaseFirestore.instance.collectionGroup('Movimientos');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Movimientos').doc();

  static Stream<MovimientosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MovimientosRecord.fromSnapshot(s));

  static Future<MovimientosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MovimientosRecord.fromSnapshot(s));

  static MovimientosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MovimientosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MovimientosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MovimientosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MovimientosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MovimientosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMovimientosRecordData({
  DocumentReference? idUser,
  DateTime? fecha,
  LatLng? coordenada,
  String? patente,
  DateTime? inicio,
  DateTime? fin,
  double? tiempo,
  DocumentReference? idvehiculo,
  DocumentReference? idmovimiento,
  double? gasto,
  bool? diacompleto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idUser': idUser,
      'Fecha': fecha,
      'coordenada': coordenada,
      'Patente': patente,
      'Inicio': inicio,
      'Fin': fin,
      'Tiempo': tiempo,
      'idvehiculo': idvehiculo,
      'idmovimiento': idmovimiento,
      'gasto': gasto,
      'diacompleto': diacompleto,
    }.withoutNulls,
  );

  return firestoreData;
}

class MovimientosRecordDocumentEquality implements Equality<MovimientosRecord> {
  const MovimientosRecordDocumentEquality();

  @override
  bool equals(MovimientosRecord? e1, MovimientosRecord? e2) {
    return e1?.idUser == e2?.idUser &&
        e1?.fecha == e2?.fecha &&
        e1?.coordenada == e2?.coordenada &&
        e1?.patente == e2?.patente &&
        e1?.inicio == e2?.inicio &&
        e1?.fin == e2?.fin &&
        e1?.tiempo == e2?.tiempo &&
        e1?.idvehiculo == e2?.idvehiculo &&
        e1?.idmovimiento == e2?.idmovimiento &&
        e1?.gasto == e2?.gasto &&
        e1?.diacompleto == e2?.diacompleto;
  }

  @override
  int hash(MovimientosRecord? e) => const ListEquality().hash([
        e?.idUser,
        e?.fecha,
        e?.coordenada,
        e?.patente,
        e?.inicio,
        e?.fin,
        e?.tiempo,
        e?.idvehiculo,
        e?.idmovimiento,
        e?.gasto,
        e?.diacompleto
      ]);

  @override
  bool isValidKey(Object? o) => o is MovimientosRecord;
}
