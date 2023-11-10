import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BalanceRecord extends FirestoreRecord {
  BalanceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "IdUser" field.
  DocumentReference? _idUser;
  DocumentReference? get idUser => _idUser;
  bool hasIdUser() => _idUser != null;

  // "Fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "Ingreso" field.
  double? _ingreso;
  double get ingreso => _ingreso ?? 0.0;
  bool hasIngreso() => _ingreso != null;

  // "Salida" field.
  double? _salida;
  double get salida => _salida ?? 0.0;
  bool hasSalida() => _salida != null;

  // "Balance" field.
  double? _balance;
  double get balance => _balance ?? 0.0;
  bool hasBalance() => _balance != null;

  // "Tipodemovimiento" field.
  String? _tipodemovimiento;
  String get tipodemovimiento => _tipodemovimiento ?? '';
  bool hasTipodemovimiento() => _tipodemovimiento != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _idUser = snapshotData['IdUser'] as DocumentReference?;
    _fecha = snapshotData['Fecha'] as DateTime?;
    _ingreso = castToType<double>(snapshotData['Ingreso']);
    _salida = castToType<double>(snapshotData['Salida']);
    _balance = castToType<double>(snapshotData['Balance']);
    _tipodemovimiento = snapshotData['Tipodemovimiento'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Balance')
          : FirebaseFirestore.instance.collectionGroup('Balance');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Balance').doc();

  static Stream<BalanceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BalanceRecord.fromSnapshot(s));

  static Future<BalanceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BalanceRecord.fromSnapshot(s));

  static BalanceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BalanceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BalanceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BalanceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BalanceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BalanceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBalanceRecordData({
  DocumentReference? idUser,
  DateTime? fecha,
  double? ingreso,
  double? salida,
  double? balance,
  String? tipodemovimiento,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'IdUser': idUser,
      'Fecha': fecha,
      'Ingreso': ingreso,
      'Salida': salida,
      'Balance': balance,
      'Tipodemovimiento': tipodemovimiento,
    }.withoutNulls,
  );

  return firestoreData;
}

class BalanceRecordDocumentEquality implements Equality<BalanceRecord> {
  const BalanceRecordDocumentEquality();

  @override
  bool equals(BalanceRecord? e1, BalanceRecord? e2) {
    return e1?.idUser == e2?.idUser &&
        e1?.fecha == e2?.fecha &&
        e1?.ingreso == e2?.ingreso &&
        e1?.salida == e2?.salida &&
        e1?.balance == e2?.balance &&
        e1?.tipodemovimiento == e2?.tipodemovimiento;
  }

  @override
  int hash(BalanceRecord? e) => const ListEquality().hash([
        e?.idUser,
        e?.fecha,
        e?.ingreso,
        e?.salida,
        e?.balance,
        e?.tipodemovimiento
      ]);

  @override
  bool isValidKey(Object? o) => o is BalanceRecord;
}
