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

  // "Tipoactturistica" field.
  String? _tipoactturistica;
  String get tipoactturistica => _tipoactturistica ?? '';
  bool hasTipoactturistica() => _tipoactturistica != null;

  // "Foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  bool hasFoto() => _foto != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "Telefono" field.
  int? _telefono;
  int get telefono => _telefono ?? 0;
  bool hasTelefono() => _telefono != null;

  // "Email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "Link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  void _initializeFields() {
    _idhospedaje = snapshotData['idhospedaje'] as DocumentReference?;
    _nombre = snapshotData['Nombre'] as String?;
    _descripcion = snapshotData['Descripcion'] as String?;
    _direccion = snapshotData['Direccion'] as String?;
    _coordenada = snapshotData['Coordenada'] as LatLng?;
    _tipoactturistica = snapshotData['Tipoactturistica'] as String?;
    _foto = snapshotData['Foto'] as String?;
    _likes = getDataList(snapshotData['likes']);
    _telefono = castToType<int>(snapshotData['Telefono']);
    _email = snapshotData['Email'] as String?;
    _fecha = snapshotData['fecha'] as DateTime?;
    _link = snapshotData['Link'] as String?;
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
  String? tipoactturistica,
  String? foto,
  int? telefono,
  String? email,
  DateTime? fecha,
  String? link,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idhospedaje': idhospedaje,
      'Nombre': nombre,
      'Descripcion': descripcion,
      'Direccion': direccion,
      'Coordenada': coordenada,
      'Tipoactturistica': tipoactturistica,
      'Foto': foto,
      'Telefono': telefono,
      'Email': email,
      'fecha': fecha,
      'Link': link,
    }.withoutNulls,
  );

  return firestoreData;
}

class HospedajesRecordDocumentEquality implements Equality<HospedajesRecord> {
  const HospedajesRecordDocumentEquality();

  @override
  bool equals(HospedajesRecord? e1, HospedajesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.idhospedaje == e2?.idhospedaje &&
        e1?.nombre == e2?.nombre &&
        e1?.descripcion == e2?.descripcion &&
        e1?.direccion == e2?.direccion &&
        e1?.coordenada == e2?.coordenada &&
        e1?.tipoactturistica == e2?.tipoactturistica &&
        e1?.foto == e2?.foto &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.telefono == e2?.telefono &&
        e1?.email == e2?.email &&
        e1?.fecha == e2?.fecha &&
        e1?.link == e2?.link;
  }

  @override
  int hash(HospedajesRecord? e) => const ListEquality().hash([
        e?.idhospedaje,
        e?.nombre,
        e?.descripcion,
        e?.direccion,
        e?.coordenada,
        e?.tipoactturistica,
        e?.foto,
        e?.likes,
        e?.telefono,
        e?.email,
        e?.fecha,
        e?.link
      ]);

  @override
  bool isValidKey(Object? o) => o is HospedajesRecord;
}
