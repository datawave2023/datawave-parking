import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MensajesusuariosRecord extends FirestoreRecord {
  MensajesusuariosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "Mensaje" field.
  String? _mensaje;
  String get mensaje => _mensaje ?? '';
  bool hasMensaje() => _mensaje != null;

  // "Tipodemensaje" field.
  String? _tipodemensaje;
  String get tipodemensaje => _tipodemensaje ?? '';
  bool hasTipodemensaje() => _tipodemensaje != null;

  // "Leido" field.
  bool? _leido;
  bool get leido => _leido ?? false;
  bool hasLeido() => _leido != null;

  // "iduser" field.
  DocumentReference? _iduser;
  DocumentReference? get iduser => _iduser;
  bool hasIduser() => _iduser != null;

  // "idmensaje" field.
  DocumentReference? _idmensaje;
  DocumentReference? get idmensaje => _idmensaje;
  bool hasIdmensaje() => _idmensaje != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _fecha = snapshotData['Fecha'] as DateTime?;
    _mensaje = snapshotData['Mensaje'] as String?;
    _tipodemensaje = snapshotData['Tipodemensaje'] as String?;
    _leido = snapshotData['Leido'] as bool?;
    _iduser = snapshotData['iduser'] as DocumentReference?;
    _idmensaje = snapshotData['idmensaje'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('mensajesusuarios')
          : FirebaseFirestore.instance.collectionGroup('mensajesusuarios');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('mensajesusuarios').doc();

  static Stream<MensajesusuariosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MensajesusuariosRecord.fromSnapshot(s));

  static Future<MensajesusuariosRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => MensajesusuariosRecord.fromSnapshot(s));

  static MensajesusuariosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MensajesusuariosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MensajesusuariosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MensajesusuariosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MensajesusuariosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MensajesusuariosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMensajesusuariosRecordData({
  DateTime? fecha,
  String? mensaje,
  String? tipodemensaje,
  bool? leido,
  DocumentReference? iduser,
  DocumentReference? idmensaje,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Fecha': fecha,
      'Mensaje': mensaje,
      'Tipodemensaje': tipodemensaje,
      'Leido': leido,
      'iduser': iduser,
      'idmensaje': idmensaje,
    }.withoutNulls,
  );

  return firestoreData;
}

class MensajesusuariosRecordDocumentEquality
    implements Equality<MensajesusuariosRecord> {
  const MensajesusuariosRecordDocumentEquality();

  @override
  bool equals(MensajesusuariosRecord? e1, MensajesusuariosRecord? e2) {
    return e1?.fecha == e2?.fecha &&
        e1?.mensaje == e2?.mensaje &&
        e1?.tipodemensaje == e2?.tipodemensaje &&
        e1?.leido == e2?.leido &&
        e1?.iduser == e2?.iduser &&
        e1?.idmensaje == e2?.idmensaje;
  }

  @override
  int hash(MensajesusuariosRecord? e) => const ListEquality().hash([
        e?.fecha,
        e?.mensaje,
        e?.tipodemensaje,
        e?.leido,
        e?.iduser,
        e?.idmensaje
      ]);

  @override
  bool isValidKey(Object? o) => o is MensajesusuariosRecord;
}
