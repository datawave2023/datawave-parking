import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HospedajesRecord extends FirestoreRecord {
  HospedajesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "idhospedaje" field.
  DocumentReference? _idhospedaje;
  DocumentReference? get idhospedaje => _idhospedaje;
  bool hasIdhospedaje() => _idhospedaje != null;

  // "Nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "Descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "Direccion" field.
  String? _direccion;
  String get direccion => _direccion ?? '';
  bool hasDireccion() => _direccion != null;

  // "Coordenada" field.
  LatLng? _coordenada;
  LatLng? get coordenada => _coordenada;
  bool hasCoordenada() => _coordenada != null;

  void _initializeFields() {
    _idhospedaje = snapshotData['idhospedaje'] as DocumentReference?;
    _nombre = snapshotData['Nombre'] as String?;
    _descripcion = snapshotData['Descripcion'] as String?;
    _direccion = snapshotData['Direccion'] as String?;
    _coordenada = snapshotData['Coordenada'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Hospedajes');

  static Stream<HospedajesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HospedajesRecord.fromSnapshot(s));

  static Future<HospedajesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HospedajesRecord.fromSnapshot(s));

  static HospedajesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HospedajesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HospedajesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HospedajesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HospedajesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HospedajesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHospedajesRecordData({
  DocumentReference? idhospedaje,
  String? nombre,
  String? descripcion,
  String? direccion,
  LatLng? coordenada,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idhospedaje': idhospedaje,
      'Nombre': nombre,
      'Descripcion': descripcion,
      'Direccion': direccion,
      'Coordenada': coordenada,
    }.withoutNulls,
  );

  return firestoreData;
}

class HospedajesRecordDocumentEquality implements Equality<HospedajesRecord> {
  const HospedajesRecordDocumentEquality();

  @override
  bool equals(HospedajesRecord? e1, HospedajesRecord? e2) {
    return e1?.idhospedaje == e2?.idhospedaje &&
        e1?.nombre == e2?.nombre &&
        e1?.descripcion == e2?.descripcion &&
        e1?.direccion == e2?.direccion &&
        e1?.coordenada == e2?.coordenada;
  }

  @override
  int hash(HospedajesRecord? e) => const ListEquality().hash(
      [e?.idhospedaje, e?.nombre, e?.descripcion, e?.direccion, e?.coordenada]);

  @override
  bool isValidKey(Object? o) => o is HospedajesRecord;
}
