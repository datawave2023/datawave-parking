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
import 'codigodeoperacionobsoleto_model.dart';
export 'codigodeoperacionobsoleto_model.dart';

class CodigodeoperacionobsoletoWidget extends StatefulWidget {
  const CodigodeoperacionobsoletoWidget({
    Key? key,
    required this.idvehiculo,
  }) : super(key: key);

  final DocumentReference? idvehiculo;

  @override
  _CodigodeoperacionobsoletoWidgetState createState() =>
      _CodigodeoperacionobsoletoWidgetState();
}

class _CodigodeoperacionobsoletoWidgetState
    extends State<CodigodeoperacionobsoletoWidget> {
  late CodigodeoperacionobsoletoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CodigodeoperacionobsoletoModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          width: 400.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Por favor ingrese el codigo de operacion para verificar el pago',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleLarge,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Ingresar codigo de operacion',
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Readex Pro',
                                fontSize: 14.0,
                              ),
                      hintText: 'Ingresar codigo de operacion',
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
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
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 22.0,
                        ),
                    validator:
                        _model.textControllerValidator.asValidator(context),
                    inputFormatters: [_model.textFieldMask],
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    var _shouldSetState = false;
                    final firestoreBatch = FirebaseFirestore.instance.batch();
                    try {
                      while (_model.retryCount! < _model.maxRetries!) {
                        _model.apiResultald = await GetPagoCall.call(
                          id: _model.textController.text,
                          accessToken:
                              'APP_USR-5831127204307443-102712-fa2771b346da10dccbc10b42cd3a4722-266442697',
                        );
                        _shouldSetState = true;
                        setState(() {
                          _model.aprobado = GetPagoCall.pagoaprobado(
                            (_model.apiResultald?.jsonBody ?? ''),
                          ).toString()!;
                        });
                        if (_model.aprobado == 'approved') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Pago exitoso!',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );

                          firestoreBatch.update(
                              widget.idvehiculo!,
                              createVehiculosRecordData(
                                activo: true,
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
                              ));
                          if (_shouldSetState) setState(() {});
                          return;
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'No pudimos procesar su pago. Reintentando en 3 segundos',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                          await Future.delayed(
                              const Duration(milliseconds: 3000));
                          setState(() {
                            _model.retryCount = _model.retryCount! + 1;
                          });
                        }
                      }
                      if (_model.retryCount == _model.maxRetries) {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return WebViewAware(
                                child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: PaymentMessageFalseQRWidget(),
                            ));
                          },
                        ).then((value) => safeSetState(() {}));
                      }
                      Navigator.pop(context);
                    } finally {
                      await firestoreBatch.commit();
                    }

                    if (_shouldSetState) setState(() {});
                  },
                  text: 'Verificar',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
              ].divide(SizedBox(height: 10.0)).around(SizedBox(height: 10.0)),
            ),
          ),
        ),
      ),
    );
  }
}
