import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InfraccionesRecord extends FirestoreRecord {
  InfraccionesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "idUsers" field.
  DocumentReference? _idUsers;
  DocumentReference? get idUsers => _idUsers;
  bool hasIdUsers() => _idUsers != null;

  // "Fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "Tipodeinfraccion" field.
  String? _tipodeinfraccion;
  String get tipodeinfraccion => _tipodeinfraccion ?? '';
  bool hasTipodeinfraccion() => _tipodeinfraccion != null;

  // "idVehiculo" field.
  DocumentReference? _idVehiculo;
  DocumentReference? get idVehiculo => _idVehiculo;
  bool hasIdVehiculo() => _idVehiculo != null;

  // "Foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  bool hasFoto() => _foto != null;

  // "Observaciones" field.
  String? _observaciones;
  String get observaciones => _observaciones ?? '';
  bool hasObservaciones() => _observaciones != null;

  // "coordenada" field.
  LatLng? _coordenada;
  LatLng? get coordenada => _coordenada;
  bool hasCoordenada() => _coordenada != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _idUsers = snapshotData['idUsers'] as DocumentReference?;
    _fecha = snapshotData['Fecha'] as DateTime?;
    _tipodeinfraccion = snapshotData['Tipodeinfraccion'] as String?;
    _idVehiculo = snapshotData['idVehiculo'] as DocumentReference?;
    _foto = snapshotData['Foto'] as String?;
    _observaciones = snapshotData['Observaciones'] as String?;
    _coordenada = snapshotData['coordenada'] as LatLng?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Infracciones')
          : FirebaseFirestore.instance.collectionGroup('Infracciones');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Infracciones').doc();

  static Stream<InfraccionesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InfraccionesRecord.fromSnapshot(s));

  static Future<InfraccionesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InfraccionesRecord.fromSnapshot(s));

  static InfraccionesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InfraccionesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InfraccionesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InfraccionesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InfraccionesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InfraccionesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInfraccionesRecordData({
  DocumentReference? idUsers,
  DateTime? fecha,
  String? tipodeinfraccion,
  DocumentReference? idVehiculo,
  String? foto,
  String? observaciones,
  LatLng? coordenada,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idUsers': idUsers,
      'Fecha': fecha,
      'Tipodeinfraccion': tipodeinfraccion,
      'idVehiculo': idVehiculo,
      'Foto': foto,
      'Observaciones': observaciones,
      'coordenada': coordenada,
    }.withoutNulls,
  );

  return firestoreData;
}

class InfraccionesRecordDocumentEquality
    implements Equality<InfraccionesRecord> {
  const InfraccionesRecordDocumentEquality();

  @override
  bool equals(InfraccionesRecord? e1, InfraccionesRecord? e2) {
    return e1?.idUsers == e2?.idUsers &&
        e1?.fecha == e2?.fecha &&
        e1?.tipodeinfraccion == e2?.tipodeinfraccion &&
        e1?.idVehiculo == e2?.idVehiculo &&
        e1?.foto == e2?.foto &&
        e1?.observaciones == e2?.observaciones &&
        e1?.coordenada == e2?.coordenada;
  }

  @override
  int hash(InfraccionesRecord? e) => const ListEquality().hash([
        e?.idUsers,
        e?.fecha,
        e?.tipodeinfraccion,
        e?.idVehiculo,
        e?.foto,
        e?.observaciones,
        e?.coordenada
      ]);

  @override
  bool isValidKey(Object? o) => o is InfraccionesRecord;
}
