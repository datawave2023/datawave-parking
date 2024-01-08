import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AutosGeneralRecord extends FirestoreRecord {
  AutosGeneralRecord._(
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

  // "Montopagado" field.
  double? _montopagado;
  double get montopagado => _montopagado ?? 0.0;
  bool hasMontopagado() => _montopagado != null;

  // "Fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "coordenada" field.
  LatLng? _coordenada;
  LatLng? get coordenada => _coordenada;
  bool hasCoordenada() => _coordenada != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "idvehiculo" field.
  DocumentReference? _idvehiculo;
  DocumentReference? get idvehiculo => _idvehiculo;
  bool hasIdvehiculo() => _idvehiculo != null;

  // "inicioestacionamiento" field.
  DateTime? _inicioestacionamiento;
  DateTime? get inicioestacionamiento => _inicioestacionamiento;
  bool hasInicioestacionamiento() => _inicioestacionamiento != null;

  // "finestacionamiento" field.
  DateTime? _finestacionamiento;
  DateTime? get finestacionamiento => _finestacionamiento;
  bool hasFinestacionamiento() => _finestacionamiento != null;

  // "Diacompleto" field.
  bool? _diacompleto;
  bool get diacompleto => _diacompleto ?? false;
  bool hasDiacompleto() => _diacompleto != null;

  // "Diacompletotext" field.
  String? _diacompletotext;
  String get diacompletotext => _diacompletotext ?? '';
  bool hasDiacompletotext() => _diacompletotext != null;

  // "Activo" field.
  bool? _activo;
  bool get activo => _activo ?? false;
  bool hasActivo() => _activo != null;

  // "Autoverificado" field.
  bool? _autoverificado;
  bool get autoverificado => _autoverificado ?? false;
  bool hasAutoverificado() => _autoverificado != null;

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "iduserverificadopor" field.
  DocumentReference? _iduserverificadopor;
  DocumentReference? get iduserverificadopor => _iduserverificadopor;
  bool hasIduserverificadopor() => _iduserverificadopor != null;

  void _initializeFields() {
    _marca = snapshotData['Marca'] as String?;
    _patente = snapshotData['Patente'] as String?;
    _montopagado = castToType<double>(snapshotData['Montopagado']);
    _fecha = snapshotData['Fecha'] as DateTime?;
    _coordenada = snapshotData['coordenada'] as LatLng?;
    _displayName = snapshotData['display_name'] as String?;
    _idvehiculo = snapshotData['idvehiculo'] as DocumentReference?;
    _inicioestacionamiento = snapshotData['inicioestacionamiento'] as DateTime?;
    _finestacionamiento = snapshotData['finestacionamiento'] as DateTime?;
    _diacompleto = snapshotData['Diacompleto'] as bool?;
    _diacompletotext = snapshotData['Diacompletotext'] as String?;
    _activo = snapshotData['Activo'] as bool?;
    _autoverificado = snapshotData['Autoverificado'] as bool?;
    _uid = snapshotData['uid'] as DocumentReference?;
    _iduserverificadopor =
        snapshotData['iduserverificadopor'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('autos_general');

  static Stream<AutosGeneralRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AutosGeneralRecord.fromSnapshot(s));

  static Future<AutosGeneralRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AutosGeneralRecord.fromSnapshot(s));

  static AutosGeneralRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AutosGeneralRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AutosGeneralRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AutosGeneralRecord._(reference, mapFromFirestore(data));

  static AutosGeneralRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      AutosGeneralRecord.getDocumentFromData(
        {
          'Marca': snapshot.data['Marca'],
          'Patente': snapshot.data['Patente'],
          'Montopagado': convertAlgoliaParam(
            snapshot.data['Montopagado'],
            ParamType.double,
            false,
          ),
          'Fecha': convertAlgoliaParam(
            snapshot.data['Fecha'],
            ParamType.DateTime,
            false,
          ),
          'coordenada': convertAlgoliaParam(
            snapshot.data,
            ParamType.LatLng,
            false,
          ),
          'display_name': snapshot.data['display_name'],
          'idvehiculo': convertAlgoliaParam(
            snapshot.data['idvehiculo'],
            ParamType.DocumentReference,
            false,
          ),
          'inicioestacionamiento': convertAlgoliaParam(
            snapshot.data['inicioestacionamiento'],
            ParamType.DateTime,
            false,
          ),
          'finestacionamiento': convertAlgoliaParam(
            snapshot.data['finestacionamiento'],
            ParamType.DateTime,
            false,
          ),
          'Diacompleto': snapshot.data['Diacompleto'],
          'Diacompletotext': snapshot.data['Diacompletotext'],
          'Activo': snapshot.data['Activo'],
          'Autoverificado': snapshot.data['Autoverificado'],
          'uid': convertAlgoliaParam(
            snapshot.data['uid'],
            ParamType.DocumentReference,
            false,
          ),
          'iduserverificadopor': convertAlgoliaParam(
            snapshot.data['iduserverificadopor'],
            ParamType.DocumentReference,
            false,
          ),
        },
        AutosGeneralRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<AutosGeneralRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'autos_general',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'AutosGeneralRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AutosGeneralRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAutosGeneralRecordData({
  String? marca,
  String? patente,
  double? montopagado,
  DateTime? fecha,
  LatLng? coordenada,
  String? displayName,
  DocumentReference? idvehiculo,
  DateTime? inicioestacionamiento,
  DateTime? finestacionamiento,
  bool? diacompleto,
  String? diacompletotext,
  bool? activo,
  bool? autoverificado,
  DocumentReference? uid,
  DocumentReference? iduserverificadopor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Marca': marca,
      'Patente': patente,
      'Montopagado': montopagado,
      'Fecha': fecha,
      'coordenada': coordenada,
      'display_name': displayName,
      'idvehiculo': idvehiculo,
      'inicioestacionamiento': inicioestacionamiento,
      'finestacionamiento': finestacionamiento,
      'Diacompleto': diacompleto,
      'Diacompletotext': diacompletotext,
      'Activo': activo,
      'Autoverificado': autoverificado,
      'uid': uid,
      'iduserverificadopor': iduserverificadopor,
    }.withoutNulls,
  );

  return firestoreData;
}

class AutosGeneralRecordDocumentEquality
    implements Equality<AutosGeneralRecord> {
  const AutosGeneralRecordDocumentEquality();

  @override
  bool equals(AutosGeneralRecord? e1, AutosGeneralRecord? e2) {
    return e1?.marca == e2?.marca &&
        e1?.patente == e2?.patente &&
        e1?.montopagado == e2?.montopagado &&
        e1?.fecha == e2?.fecha &&
        e1?.coordenada == e2?.coordenada &&
        e1?.displayName == e2?.displayName &&
        e1?.idvehiculo == e2?.idvehiculo &&
        e1?.inicioestacionamiento == e2?.inicioestacionamiento &&
        e1?.finestacionamiento == e2?.finestacionamiento &&
        e1?.diacompleto == e2?.diacompleto &&
        e1?.diacompletotext == e2?.diacompletotext &&
        e1?.activo == e2?.activo &&
        e1?.autoverificado == e2?.autoverificado &&
        e1?.uid == e2?.uid &&
        e1?.iduserverificadopor == e2?.iduserverificadopor;
  }

  @override
  int hash(AutosGeneralRecord? e) => const ListEquality().hash([
        e?.marca,
        e?.patente,
        e?.montopagado,
        e?.fecha,
        e?.coordenada,
        e?.displayName,
        e?.idvehiculo,
        e?.inicioestacionamiento,
        e?.finestacionamiento,
        e?.diacompleto,
        e?.diacompletotext,
        e?.activo,
        e?.autoverificado,
        e?.uid,
        e?.iduserverificadopor
      ]);

  @override
  bool isValidKey(Object? o) => o is AutosGeneralRecord;
}
