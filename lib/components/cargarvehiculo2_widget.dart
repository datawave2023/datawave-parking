import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'cargarvehiculo2_model.dart';
export 'cargarvehiculo2_model.dart';

class Cargarvehiculo2Widget extends StatefulWidget {
  const Cargarvehiculo2Widget({Key? key}) : super(key: key);

  @override
  _Cargarvehiculo2WidgetState createState() => _Cargarvehiculo2WidgetState();
}

class _Cargarvehiculo2WidgetState extends State<Cargarvehiculo2Widget> {
  late Cargarvehiculo2Model _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Cargarvehiculo2Model());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Material(
        color: Colors.transparent,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: 300.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nuevo vehículo',
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Text(
                          'Ingrese la patente del nuevo vehículo',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Text(
                          'Seleccionar tipo de patente',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                FFAppState().patente = 1;
                              });
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/patente.png',
                                width: 100.0,
                                height: 50.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                FFAppState().patente = 2;
                              });
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/patente_nueva6.png',
                                width: 100.0,
                                height: 50.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (FFAppState().patente == 1)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController1,
                            focusNode: _model.textFieldFocusNode1,
                            autofocus: true,
                            textCapitalization: TextCapitalization.none,
                            textInputAction: TextInputAction.go,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'ABC 123',
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              alignLabelWithHint: false,
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.textController1Validator
                                .asValidator(context),
                            inputFormatters: [_model.textFieldMask1],
                          ),
                        ),
                      if (FFAppState().patente == 2)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController2,
                            focusNode: _model.textFieldFocusNode2,
                            autofocus: true,
                            textCapitalization: TextCapitalization.none,
                            textInputAction: TextInputAction.go,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'AB 123 CD',
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              alignLabelWithHint: false,
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.textController2Validator
                                .asValidator(context),
                            inputFormatters: [_model.textFieldMask2],
                          ),
                        ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                            text: 'Cancelar',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).info,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              currentUserLocationValue =
                                  await getCurrentUserLocation(
                                      defaultLocation: LatLng(0.0, 0.0));
                              final firestoreBatch =
                                  FirebaseFirestore.instance.batch();
                              try {
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                if (FFAppState().patente == 1) {
                                  var vehiculosRecordReference1 =
                                      VehiculosRecord.createDoc(
                                          currentUserReference!);
                                  firestoreBatch.set(
                                      vehiculosRecordReference1,
                                      createVehiculosRecordData(
                                        patente: functions.mayuscula(
                                            _model.textController1.text),
                                        activo: false,
                                        autoverificado: false,
                                        ubicacionactual:
                                            currentUserLocationValue,
                                      ));
                                  _model.crearpatentevieja =
                                      VehiculosRecord.getDocumentFromData(
                                          createVehiculosRecordData(
                                            patente: functions.mayuscula(
                                                _model.textController1.text),
                                            activo: false,
                                            autoverificado: false,
                                            ubicacionactual:
                                                currentUserLocationValue,
                                          ),
                                          vehiculosRecordReference1);

                                  firestoreBatch.update(
                                      _model.crearpatentevieja!.reference,
                                      createVehiculosRecordData(
                                        idvehiculo:
                                            _model.crearpatentevieja?.reference,
                                      ));

                                  firestoreBatch.set(
                                      AutosGeneralRecord.collection.doc(),
                                      createAutosGeneralRecordData(
                                        patente: functions.mayuscula(
                                            _model.textController1.text),
                                        fecha: getCurrentTimestamp,
                                        coordenada: _model
                                            .crearpatentevieja?.ubicacionactual,
                                        idvehiculo:
                                            _model.crearpatentevieja?.reference,
                                        inicioestacionamiento: _model
                                            .crearpatentevieja
                                            ?.inicioestacionamiento,
                                        finestacionamiento: _model
                                            .crearpatentevieja
                                            ?.finestacionamiento,
                                        uid: currentUserReference,
                                        autoverificado: false,
                                        activo: false,
                                      ));

                                  firestoreBatch.update(currentUserReference!, {
                                    ...mapToFirestore(
                                      {
                                        'Vehiculos': FieldValue.arrayUnion([
                                          _model.crearpatentevieja?.patente
                                        ]),
                                      },
                                    ),
                                  });
                                } else {
                                  var vehiculosRecordReference2 =
                                      VehiculosRecord.createDoc(
                                          currentUserReference!);
                                  firestoreBatch.set(
                                      vehiculosRecordReference2,
                                      createVehiculosRecordData(
                                        patente: functions.mayuscula(
                                            _model.textController2.text),
                                        activo: false,
                                        autoverificado: false,
                                        ubicacionactual:
                                            currentUserLocationValue,
                                      ));
                                  _model.patentenueva =
                                      VehiculosRecord.getDocumentFromData(
                                          createVehiculosRecordData(
                                            patente: functions.mayuscula(
                                                _model.textController2.text),
                                            activo: false,
                                            autoverificado: false,
                                            ubicacionactual:
                                                currentUserLocationValue,
                                          ),
                                          vehiculosRecordReference2);

                                  firestoreBatch.update(
                                      _model.patentenueva!.reference,
                                      createVehiculosRecordData(
                                        idvehiculo:
                                            _model.patentenueva?.reference,
                                      ));

                                  firestoreBatch.set(
                                      AutosGeneralRecord.collection.doc(),
                                      createAutosGeneralRecordData(
                                        patente: functions.mayuscula(
                                            _model.textController2.text),
                                        fecha: getCurrentTimestamp,
                                        coordenada: _model
                                            .patentenueva?.ubicacionactual,
                                        idvehiculo:
                                            _model.patentenueva?.reference,
                                        inicioestacionamiento: _model
                                            .patentenueva
                                            ?.inicioestacionamiento,
                                        finestacionamiento: _model
                                            .patentenueva?.finestacionamiento,
                                        uid: currentUserReference,
                                        autoverificado: false,
                                        activo: false,
                                      ));

                                  firestoreBatch.update(currentUserReference!, {
                                    ...mapToFirestore(
                                      {
                                        'Vehiculos': FieldValue.arrayUnion(
                                            [_model.patentenueva?.patente]),
                                      },
                                    ),
                                  });
                                }

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Su vehículo se cargó correctamente',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                                Navigator.pop(context);
                              } finally {
                                await firestoreBatch.commit();
                              }

                              setState(() {});
                            },
                            text: 'Continuar',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ),
                    ]
                        .divide(SizedBox(height: 10.0))
                        .around(SizedBox(height: 10.0)),
                  ),
                ),
              ].divide(SizedBox(height: 10.0)).around(SizedBox(height: 10.0)),
            ),
          ),
        ),
      ),
    );
  }
}
