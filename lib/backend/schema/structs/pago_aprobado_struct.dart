// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PagoAprobadoStruct extends FFFirebaseStruct {
  PagoAprobadoStruct({
    String? pagoAprobado,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _pagoAprobado = pagoAprobado,
        super(firestoreUtilData);

  // "pago_aprobado" field.
  String? _pagoAprobado;
  String get pagoAprobado => _pagoAprobado ?? 'approved';
  set pagoAprobado(String? val) => _pagoAprobado = val;
  bool hasPagoAprobado() => _pagoAprobado != null;

  static PagoAprobadoStruct fromMap(Map<String, dynamic> data) =>
      PagoAprobadoStruct(
        pagoAprobado: data['pago_aprobado'] as String?,
      );

  static PagoAprobadoStruct? maybeFromMap(dynamic data) => data is Map
      ? PagoAprobadoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'pago_aprobado': _pagoAprobado,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'pago_aprobado': serializeParam(
          _pagoAprobado,
          ParamType.String,
        ),
      }.withoutNulls;

  static PagoAprobadoStruct fromSerializableMap(Map<String, dynamic> data) =>
      PagoAprobadoStruct(
        pagoAprobado: deserializeParam(
          data['pago_aprobado'],
          ParamType.String,
          false,
        ),
      );

  static PagoAprobadoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      PagoAprobadoStruct(
        pagoAprobado: convertAlgoliaParam(
          data['pago_aprobado'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PagoAprobadoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PagoAprobadoStruct && pagoAprobado == other.pagoAprobado;
  }

  @override
  int get hashCode => const ListEquality().hash([pagoAprobado]);
}

PagoAprobadoStruct createPagoAprobadoStruct({
  String? pagoAprobado,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PagoAprobadoStruct(
      pagoAprobado: pagoAprobado,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PagoAprobadoStruct? updatePagoAprobadoStruct(
  PagoAprobadoStruct? pagoAprobadoStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pagoAprobadoStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPagoAprobadoStructData(
  Map<String, dynamic> firestoreData,
  PagoAprobadoStruct? pagoAprobadoStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pagoAprobadoStruct == null) {
    return;
  }
  if (pagoAprobadoStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pagoAprobadoStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pagoAprobadoStructData =
      getPagoAprobadoFirestoreData(pagoAprobadoStruct, forFieldValue);
  final nestedData =
      pagoAprobadoStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      pagoAprobadoStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPagoAprobadoFirestoreData(
  PagoAprobadoStruct? pagoAprobadoStruct, [
  bool forFieldValue = false,
]) {
  if (pagoAprobadoStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pagoAprobadoStruct.toMap());

  // Add any Firestore field values
  pagoAprobadoStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPagoAprobadoListFirestoreData(
  List<PagoAprobadoStruct>? pagoAprobadoStructs,
) =>
    pagoAprobadoStructs
        ?.map((e) => getPagoAprobadoFirestoreData(e, true))
        .toList() ??
    [];
