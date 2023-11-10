import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProvinciasRecord extends FirestoreRecord {
  ProvinciasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('provincias');

  static Stream<ProvinciasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProvinciasRecord.fromSnapshot(s));

  static Future<ProvinciasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProvinciasRecord.fromSnapshot(s));

  static ProvinciasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProvinciasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProvinciasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProvinciasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProvinciasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProvinciasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProvinciasRecordData({
  String? nombre,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProvinciasRecordDocumentEquality implements Equality<ProvinciasRecord> {
  const ProvinciasRecordDocumentEquality();

  @override
  bool equals(ProvinciasRecord? e1, ProvinciasRecord? e2) {
    return e1?.nombre == e2?.nombre;
  }

  @override
  int hash(ProvinciasRecord? e) => const ListEquality().hash([e?.nombre]);

  @override
  bool isValidKey(Object? o) => o is ProvinciasRecord;
}
