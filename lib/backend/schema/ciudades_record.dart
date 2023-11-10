import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CiudadesRecord extends FirestoreRecord {
  CiudadesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ciudades')
          : FirebaseFirestore.instance.collectionGroup('ciudades');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('ciudades').doc();

  static Stream<CiudadesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CiudadesRecord.fromSnapshot(s));

  static Future<CiudadesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CiudadesRecord.fromSnapshot(s));

  static CiudadesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CiudadesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CiudadesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CiudadesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CiudadesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CiudadesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCiudadesRecordData({
  String? nombre,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
    }.withoutNulls,
  );

  return firestoreData;
}

class CiudadesRecordDocumentEquality implements Equality<CiudadesRecord> {
  const CiudadesRecordDocumentEquality();

  @override
  bool equals(CiudadesRecord? e1, CiudadesRecord? e2) {
    return e1?.nombre == e2?.nombre;
  }

  @override
  int hash(CiudadesRecord? e) => const ListEquality().hash([e?.nombre]);

  @override
  bool isValidKey(Object? o) => o is CiudadesRecord;
}
