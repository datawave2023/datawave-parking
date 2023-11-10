import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VehiculosRecord extends FirestoreRecord {
  VehiculosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Marca" field.
  String? _marca;
  String get marca => _marca ?? '';
  bool hasMarca() => _marca != null;

  // "Patente" field.
  String? _patente;
  String get patente => _patente ?? '';
  bool hasPatente() => _patente != null;

  // "Color" field.
  Color? _color;
  Color? get color => _color;
  bool hasColor() => _color != null;

  // "Modelo" field.
  String? _modelo;
  String get modelo => _modelo ?? '';
  bool hasModelo() => _modelo != null;

  // "Vehiculoseleccionado" field.
  bool? _vehiculoseleccionado;
  bool get vehiculoseleccionado => _vehiculoseleccionado ?? false;
  bool hasVehiculoseleccionado() => _vehiculoseleccionado != null;

  // "Ubicacionactual" field.
  LatLng? _ubicacionactual;
  LatLng? get ubicacionactual => _ubicacionactual;
  bool hasUbicacionactual() => _ubicacionactual != null;

  // "Activo" field.
  bool? _activo;
  bool get activo => _activo ?? false;
  bool hasActivo() => _activo != null;

  // "ultimotiempo" field.
  double? _ultimotiempo;
  double get ultimotiempo => _ultimotiempo ?? 0.0;
  bool hasUltimotiempo() => _ultimotiempo != null;

  // "inicioestacionamiento" field.
  DateTime? _inicioestacionamiento;
  DateTime? get inicioestacionamiento => _inicioestacionamiento;
  bool hasInicioestacionamiento() => _inicioestacionamiento != null;

  // "Finestacionamiento" field.
  DateTime? _finestacionamiento;
  DateTime? get finestacionamiento => _finestacionamiento;
  bool hasFinestacionamiento() => _finestacionamiento != null;

  // "Idmovimientoactual" field.
  DocumentReference? _idmovimientoactual;
  DocumentReference? get idmovimientoactual => _idmovimientoactual;
  bool hasIdmovimientoactual() => _idmovimientoactual != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _marca = snapshotData['Marca'] as String?;
    _patente = snapshotData['Patente'] as String?;
    _color = getSchemaColor(snapshotData['Color']);
    _modelo = snapshotData['Modelo'] as String?;
    _vehiculoseleccionado = snapshotData['Vehiculoseleccionado'] as bool?;
    _ubicacionactual = snapshotData['Ubicacionactual'] as LatLng?;
    _activo = snapshotData['Activo'] as bool?;
    _ultimotiempo = castToType<double>(snapshotData['ultimotiempo']);
    _inicioestacionamiento = snapshotData['inicioestacionamiento'] as DateTime?;
    _finestacionamiento = snapshotData['Finestacionamiento'] as DateTime?;
    _idmovimientoactual =
        snapshotData['Idmovimientoactual'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Vehiculos')
          : FirebaseFirestore.instance.collectionGroup('Vehiculos');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Vehiculos').doc();

  static Stream<VehiculosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VehiculosRecord.fromSnapshot(s));

  static Future<VehiculosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VehiculosRecord.fromSnapshot(s));

  static VehiculosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VehiculosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VehiculosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VehiculosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VehiculosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VehiculosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVehiculosRecordData({
  String? marca,
  String? patente,
  Color? color,
  String? modelo,
  bool? vehiculoseleccionado,
  LatLng? ubicacionactual,
  bool? activo,
  double? ultimotiempo,
  DateTime? inicioestacionamiento,
  DateTime? finestacionamiento,
  DocumentReference? idmovimientoactual,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Marca': marca,
      'Patente': patente,
      'Color': color,
      'Modelo': modelo,
      'Vehiculoseleccionado': vehiculoseleccionado,
      'Ubicacionactual': ubicacionactual,
      'Activo': activo,
      'ultimotiempo': ultimotiempo,
      'inicioestacionamiento': inicioestacionamiento,
      'Finestacionamiento': finestacionamiento,
      'Idmovimientoactual': idmovimientoactual,
    }.withoutNulls,
  );

  return firestoreData;
}

class VehiculosRecordDocumentEquality implements Equality<VehiculosRecord> {
  const VehiculosRecordDocumentEquality();

  @override
  bool equals(VehiculosRecord? e1, VehiculosRecord? e2) {
    return e1?.marca == e2?.marca &&
        e1?.patente == e2?.patente &&
        e1?.color == e2?.color &&
        e1?.modelo == e2?.modelo &&
        e1?.vehiculoseleccionado == e2?.vehiculoseleccionado &&
        e1?.ubicacionactual == e2?.ubicacionactual &&
        e1?.activo == e2?.activo &&
        e1?.ultimotiempo == e2?.ultimotiempo &&
        e1?.inicioestacionamiento == e2?.inicioestacionamiento &&
        e1?.finestacionamiento == e2?.finestacionamiento &&
        e1?.idmovimientoactual == e2?.idmovimientoactual;
  }

  @override
  int hash(VehiculosRecord? e) => const ListEquality().hash([
        e?.marca,
        e?.patente,
        e?.color,
        e?.modelo,
        e?.vehiculoseleccionado,
        e?.ubicacionactual,
        e?.activo,
        e?.ultimotiempo,
        e?.inicioestacionamiento,
        e?.finestacionamiento,
        e?.idmovimientoactual
      ]);

  @override
  bool isValidKey(Object? o) => o is VehiculosRecord;
}
