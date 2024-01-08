import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/inspector/payment_message_false_q_r/payment_message_false_q_r_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'codigooperacionpage_model.dart';
export 'codigooperacionpage_model.dart';

class CodigooperacionpageWidget extends StatefulWidget {
  const CodigooperacionpageWidget({
    Key? key,
    required this.iduser,
    required this.idvehiculo,
  }) : super(key: key);

  final DocumentReference? iduser;
  final DocumentReference? idvehiculo;

  @override
  _CodigooperacionpageWidgetState createState() =>
      _CodigooperacionpageWidgetState();
}

class _CodigooperacionpageWidgetState extends State<CodigooperacionpageWidget> {
  late CodigooperacionpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CodigooperacionpageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'verificacion',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Container(
                    width: 400.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Por favor ingrese el codigo de operacion para verificar el pago',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).titleLarge,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Ingresar codigo de operacion',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 14.0,
                                    ),
                                hintText: 'Ingresar codigo de operacion',
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 22.0,
                                  ),
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                              inputFormatters: [_model.textFieldMask],
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              currentUserLocationValue =
                                  await getCurrentUserLocation(
                                      defaultLocation: LatLng(0.0, 0.0));
                              var _shouldSetState = false;
                              final firestoreBatch =
                                  FirebaseFirestore.instance.batch();
                              try {
                                while (
                                    _model.retryCount! < _model.maxRetries!) {
                                  _model.apiResultald555 =
                                      await GetPagoCall.call(
                                    id: _model.textController.text,
                                    accessToken:
                                        'APP_USR-3479243195017758-122810-5e15779cc8b23ea6428e56e2865a8722-1207751138',
                                  );
                                  _shouldSetState = true;
                                  setState(() {
                                    _model.aprobado = GetPagoCall.pagoaprobado(
                                      (_model.apiResultald555?.jsonBody ?? ''),
                                    ).toString()!;
                                    _model.montolocal = GetPagoCall.monto(
                                      (_model.apiResultald555?.jsonBody ?? ''),
                                    );
                                  });
                                  if (_model.aprobado == 'approved') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Pago exitoso!',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );

                                    firestoreBatch.update(
                                        widget.idvehiculo!,
                                        createVehiculosRecordData(
                                          activo: true,
                                          inicioestacionamiento:
                                              getCurrentTimestamp,
                                          ubicacionactual:
                                              currentUserLocationValue,
                                        ));
                                    _model.queryautosgenerales =
                                        await queryAutosGeneralRecordOnce(
                                      queryBuilder: (autosGeneralRecord) =>
                                          autosGeneralRecord.where(
                                        'idvehiculo',
                                        isEqualTo: widget.idvehiculo,
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    _shouldSetState = true;

                                    firestoreBatch.update(
                                        _model.queryautosgenerales!.reference,
                                        createAutosGeneralRecordData(
                                          activo: true,
                                          inicioestacionamiento:
                                              getCurrentTimestamp,
                                          coordenada: currentUserLocationValue,
                                          montopagado: GetPagoCall.monto(
                                            (_model.apiResultald555?.jsonBody ??
                                                ''),
                                          ),
                                        ));

                                    firestoreBatch.set(
                                        BalanceRecord.createDoc(
                                            currentUserReference!),
                                        createBalanceRecordData(
                                          idUser: currentUserReference,
                                          fecha: getCurrentTimestamp,
                                          ingreso: _model.montolocal,
                                          salida: _model.montolocal,
                                          balance: 0.0,
                                        ));

                                    firestoreBatch.set(
                                        MovimientosRecord.createDoc(
                                            currentUserReference!),
                                        createMovimientosRecordData(
                                          idUser: currentUserReference,
                                          fecha: getCurrentTimestamp,
                                          coordenada: currentUserLocationValue,
                                          patente: _model
                                              .queryautosgenerales?.patente,
                                          inicio: getCurrentTimestamp,
                                          idvehiculo: widget.idvehiculo,
                                          gasto: _model.montolocal,
                                        ));

                                    context.pushNamed('CheckPatente');

                                    if (_shouldSetState) setState(() {});
                                    return;
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'No pudimos procesar su pago. Reintentando en 3 segundos',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    await Future.delayed(
                                        const Duration(milliseconds: 3000));
                                    setState(() {
                                      _model.retryCount =
                                          _model.retryCount! + 1;
                                    });
                                  }
                                }
                                if (_model.maxRetries == _model.retryCount) {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return WebViewAware(
                                          child: GestureDetector(
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: PaymentMessageFalseQRWidget(),
                                        ),
                                      ));
                                    },
                                  ).then((value) => safeSetState(() {}));
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                          child: AlertDialog(
                                        title: Text('sdfsdf'),
                                        content: Text('sdfsdf'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      ));
                                    },
                                  );
                                }
                              } finally {
                                await firestoreBatch.commit();
                              }

                              if (_shouldSetState) setState(() {});
                            },
                            text: 'Verificar',
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
                          FFButtonWidget(
                            onPressed: () async {
                              currentUserLocationValue =
                                  await getCurrentUserLocation(
                                      defaultLocation: LatLng(0.0, 0.0));

                              await widget.idvehiculo!
                                  .update(createVehiculosRecordData(
                                activo: true,
                                inicioestacionamiento: getCurrentTimestamp,
                                ubicacionactual: currentUserLocationValue,
                              ));
                              _model.queryautosgeneralesCopy =
                                  await queryAutosGeneralRecordOnce(
                                queryBuilder: (autosGeneralRecord) =>
                                    autosGeneralRecord.where(
                                  'idvehiculo',
                                  isEqualTo: widget.idvehiculo,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);

                              await _model.queryautosgeneralesCopy!.reference
                                  .update(createAutosGeneralRecordData(
                                activo: true,
                                inicioestacionamiento: getCurrentTimestamp,
                                coordenada: currentUserLocationValue,
                                montopagado: FFAppState().montopagado,
                              ));

                              await BalanceRecord.createDoc(
                                      currentUserReference!)
                                  .set(createBalanceRecordData(
                                idUser: currentUserReference,
                                fecha: getCurrentTimestamp,
                                ingreso: FFAppState().montopagado,
                                salida: FFAppState().montopagado,
                                balance: 0.0,
                              ));

                              await MovimientosRecord.createDoc(
                                      currentUserReference!)
                                  .set(createMovimientosRecordData(
                                idUser: currentUserReference,
                                fecha: getCurrentTimestamp,
                                coordenada: currentUserLocationValue,
                                patente:
                                    _model.queryautosgeneralesCopy?.patente,
                                inicio: getCurrentTimestamp,
                                idvehiculo: widget.idvehiculo,
                                gasto: FFAppState().montopagado,
                              ));

                              context.pushNamed('CheckPatente');

                              setState(() {});
                            },
                            text: 'Confirmacion visual de comprobante',
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
                        ]
                            .divide(SizedBox(height: 10.0))
                            .around(SizedBox(height: 10.0)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
