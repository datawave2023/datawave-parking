import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "Saldo" field.
  double? _saldo;
  double get saldo => _saldo ?? 0.0;
  bool hasSaldo() => _saldo != null;

  // "Activo" field.
  bool? _activo;
  bool get activo => _activo ?? false;
  bool hasActivo() => _activo != null;

  // "Ubicacion" field.
  LatLng? _ubicacion;
  LatLng? get ubicacion => _ubicacion;
  bool hasUbicacion() => _ubicacion != null;

  // "inspector" field.
  bool? _inspector;
  bool get inspector => _inspector ?? false;
  bool hasInspector() => _inspector != null;

  // "admin" field.
  bool? _admin;
  bool get admin => _admin ?? false;
  bool hasAdmin() => _admin != null;

  // "Telefono" field.
  int? _telefono;
  int get telefono => _telefono ?? 0;
  bool hasTelefono() => _telefono != null;

  // "Provincia" field.
  String? _provincia;
  String get provincia => _provincia ?? '';
  bool hasProvincia() => _provincia != null;

  // "Ciudad" field.
  String? _ciudad;
  String get ciudad => _ciudad ?? '';
  bool hasCiudad() => _ciudad != null;

  // "Genero" field.
  String? _genero;
  String get genero => _genero ?? '';
  bool hasGenero() => _genero != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _saldo = castToType<double>(snapshotData['Saldo']);
    _activo = snapshotData['Activo'] as bool?;
    _ubicacion = snapshotData['Ubicacion'] as LatLng?;
    _inspector = snapshotData['inspector'] as bool?;
    _admin = snapshotData['admin'] as bool?;
    _telefono = castToType<int>(snapshotData['Telefono']);
    _provincia = snapshotData['Provincia'] as String?;
    _ciudad = snapshotData['Ciudad'] as String?;
    _genero = snapshotData['Genero'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  double? saldo,
  bool? activo,
  LatLng? ubicacion,
  bool? inspector,
  bool? admin,
  int? telefono,
  String? provincia,
  String? ciudad,
  String? genero,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'Saldo': saldo,
      'Activo': activo,
      'Ubicacion': ubicacion,
      'inspector': inspector,
      'admin': admin,
      'Telefono': telefono,
      'Provincia': provincia,
      'Ciudad': ciudad,
      'Genero': genero,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.saldo == e2?.saldo &&
        e1?.activo == e2?.activo &&
        e1?.ubicacion == e2?.ubicacion &&
        e1?.inspector == e2?.inspector &&
        e1?.admin == e2?.admin &&
        e1?.telefono == e2?.telefono &&
        e1?.provincia == e2?.provincia &&
        e1?.ciudad == e2?.ciudad &&
        e1?.genero == e2?.genero;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.saldo,
        e?.activo,
        e?.ubicacion,
        e?.inspector,
        e?.admin,
        e?.telefono,
        e?.provincia,
        e?.ciudad,
        e?.genero
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
