import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AutosinspeccionadosRecord extends FirestoreRecord {
  AutosinspeccionadosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "iduser" field.
  DocumentReference? _iduser;
  DocumentReference? get iduser => _iduser;
  bool hasIduser() => _iduser != null;

  // "Fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "fechapago" field.
  DateTime? _fechapago;
  DateTime? get fechapago => _fechapago;
  bool hasFechapago() => _fechapago != null;

  // "Montopagado" field.
  double? _montopagado;
  double get montopagado => _montopagado ?? 0.0;
  bool hasMontopagado() => _montopagado != null;

  // "diacompleto" field.
  bool? _diacompleto;
  bool get diacompleto => _diacompleto ?? false;
  bool hasDiacompleto() => _diacompleto != null;

  // "Montoauto" field.
  double? _montoauto;
  double get montoauto => _montoauto ?? 0.0;
  bool hasMontoauto() => _montoauto != null;

  // "idvehiculoestacionado" field.
  DocumentReference? _idvehiculoestacionado;
  DocumentReference? get idvehiculoestacionado => _idvehiculoestacionado;
  bool hasIdvehiculoestacionado() => _idvehiculoestacionado != null;

  // "diadecobro" field.
  bool? _diadecobro;
  bool get diadecobro => _diadecobro ?? false;
  bool hasDiadecobro() => _diadecobro != null;

  // "cantidaddeinspeccionadosdia" field.
  int? _cantidaddeinspeccionadosdia;
  int get cantidaddeinspeccionadosdia => _cantidaddeinspeccionadosdia ?? 0;
  bool hasCantidaddeinspeccionadosdia() => _cantidaddeinspeccionadosdia != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _iduser = snapshotData['iduser'] as DocumentReference?;
    _fecha = snapshotData['Fecha'] as DateTime?;
    _fechapago = snapshotData['fechapago'] as DateTime?;
    _montopagado = castToType<double>(snapshotData['Montopagado']);
    _diacompleto = snapshotData['diacompleto'] as bool?;
    _montoauto = castToType<double>(snapshotData['Montoauto']);
    _idvehiculoestacionado =
        snapshotData['idvehiculoestacionado'] as DocumentReference?;
    _diadecobro = snapshotData['diadecobro'] as bool?;
    _cantidaddeinspeccionadosdia =
        castToType<int>(snapshotData['cantidaddeinspeccionadosdia']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('autosinspeccionados')
          : FirebaseFirestore.instance.collectionGroup('autosinspeccionados');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('autosinspeccionados').doc();

  static Stream<AutosinspeccionadosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AutosinspeccionadosRecord.fromSnapshot(s));

  static Future<AutosinspeccionadosRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AutosinspeccionadosRecord.fromSnapshot(s));

  static AutosinspeccionadosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AutosinspeccionadosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AutosinspeccionadosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AutosinspeccionadosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AutosinspeccionadosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AutosinspeccionadosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAutosinspeccionadosRecordData({
  DocumentReference? iduser,
  DateTime? fecha,
  DateTime? fechapago,
  double? montopagado,
  bool? diacompleto,
  double? montoauto,
  DocumentReference? idvehiculoestacionado,
  bool? diadecobro,
  int? cantidaddeinspeccionadosdia,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'iduser': iduser,
      'Fecha': fecha,
      'fechapago': fechapago,
      'Montopagado': montopagado,
      'diacompleto': diacompleto,
      'Montoauto': montoauto,
      'idvehiculoestacionado': idvehiculoestacionado,
      'diadecobro': diadecobro,
      'cantidaddeinspeccionadosdia': cantidaddeinspeccionadosdia,
    }.withoutNulls,
  );

  return firestoreData;
}

class AutosinspeccionadosRecordDocumentEquality
    implements Equality<AutosinspeccionadosRecord> {
  const AutosinspeccionadosRecordDocumentEquality();

  @override
  bool equals(AutosinspeccionadosRecord? e1, AutosinspeccionadosRecord? e2) {
    return e1?.iduser == e2?.iduser &&
        e1?.fecha == e2?.fecha &&
        e1?.fechapago == e2?.fechapago &&
        e1?.montopagado == e2?.montopagado &&
        e1?.diacompleto == e2?.diacompleto &&
        e1?.montoauto == e2?.montoauto &&
        e1?.idvehiculoestacionado == e2?.idvehiculoestacionado &&
        e1?.diadecobro == e2?.diadecobro &&
        e1?.cantidaddeinspeccionadosdia == e2?.cantidaddeinspeccionadosdia;
  }

  @override
  int hash(AutosinspeccionadosRecord? e) => const ListEquality().hash([
        e?.iduser,
        e?.fecha,
        e?.fechapago,
        e?.montopagado,
        e?.diacompleto,
        e?.montoauto,
        e?.idvehiculoestacionado,
        e?.diadecobro,
        e?.cantidaddeinspeccionadosdia
      ]);

  @override
  bool isValidKey(Object? o) => o is AutosinspeccionadosRecord;
}
