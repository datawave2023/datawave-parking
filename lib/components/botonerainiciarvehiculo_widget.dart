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
import 'package:provider/provider.dart';
import 'botonerainiciarvehiculo_model.dart';
export 'botonerainiciarvehiculo_model.dart';

class BotonerainiciarvehiculoWidget extends StatefulWidget {
  const BotonerainiciarvehiculoWidget({
    Key? key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
    this.parameter5,
    this.parameter6,
  }) : super(key: key);

  final bool? parameter1;
  final String? parameter2;
  final DocumentReference? parameter3;
  final String? parameter4;
  final DateTime? parameter5;
  final DocumentReference? parameter6;

  @override
  _BotonerainiciarvehiculoWidgetState createState() =>
      _BotonerainiciarvehiculoWidgetState();
}

class _BotonerainiciarvehiculoWidgetState
    extends State<BotonerainiciarvehiculoWidget> {
  late BotonerainiciarvehiculoModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BotonerainiciarvehiculoModel());

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

    return Container(
      width: 130.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Estacionamiento',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                  if (widget.parameter1 == false)
                    FFButtonWidget(
                      onPressed: () async {
                        currentUserLocationValue = await getCurrentUserLocation(
                            defaultLocation: LatLng(0.0, 0.0));
                        final firestoreBatch =
                            FirebaseFirestore.instance.batch();
                        try {
                          var movimientosRecordReference =
                              MovimientosRecord.createDoc(
                                  currentUserReference!);
                          firestoreBatch.set(
                              movimientosRecordReference,
                              createMovimientosRecordData(
                                idUser: currentUserReference,
                                fecha: getCurrentTimestamp,
                                coordenada: currentUserLocationValue,
                                patente: widget.parameter2,
                                inicio: getCurrentTimestamp,
                                idvehiculo: widget.parameter3,
                              ));
                          _model.mov = MovimientosRecord.getDocumentFromData(
                              createMovimientosRecordData(
                                idUser: currentUserReference,
                                fecha: getCurrentTimestamp,
                                coordenada: currentUserLocationValue,
                                patente: widget.parameter2,
                                inicio: getCurrentTimestamp,
                                idvehiculo: widget.parameter3,
                              ),
                              movimientosRecordReference);

                          firestoreBatch.update(
                              widget.parameter3!,
                              createVehiculosRecordData(
                                activo: true,
                                inicioestacionamiento: _model.mov?.inicio,
                                idmovimientoactual: _model.mov?.reference,
                              ));

                          firestoreBatch.update(
                              _model.mov!.reference,
                              createMovimientosRecordData(
                                idmovimiento: _model.mov?.reference,
                              ));

                          var autosGeneralRecordReference =
                              AutosGeneralRecord.collection.doc();
                          firestoreBatch.set(
                              autosGeneralRecordReference,
                              createAutosGeneralRecordData(
                                marca: widget.parameter4,
                                patente: widget.parameter2,
                                fecha: getCurrentTimestamp,
                                coordenada: currentUserLocationValue,
                                idvehiculo: widget.parameter3,
                                inicioestacionamiento: getCurrentTimestamp,
                                activo: true,
                              ));
                          _model.creacionVehiculoGral =
                              AutosGeneralRecord.getDocumentFromData(
                                  createAutosGeneralRecordData(
                                    marca: widget.parameter4,
                                    patente: widget.parameter2,
                                    fecha: getCurrentTimestamp,
                                    coordenada: currentUserLocationValue,
                                    idvehiculo: widget.parameter3,
                                    inicioestacionamiento: getCurrentTimestamp,
                                    activo: true,
                                  ),
                                  autosGeneralRecordReference);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Se inicio el estacionamiento',
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
                        } finally {
                          await firestoreBatch.commit();
                        }

                        setState(() {});
                      },
                      text: 'INICIAR',
                      icon: Icon(
                        Icons.play_arrow,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        width: 170.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF64F34F),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
                  if (widget.parameter1 == true)
                    StreamBuilder<List<BalanceRecord>>(
                      stream: queryBalanceRecord(
                        parent: currentUserReference,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<BalanceRecord> buttonBalanceRecordList =
                            snapshot.data!;
                        return FFButtonWidget(
                          onPressed: () async {
                            await widget.parameter6!
                                .update(createMovimientosRecordData(
                              fin: getCurrentTimestamp,
                              tiempo: valueOrDefault<double>(
                                functions.tiempodeestacionamiento(
                                    widget.parameter5!, getCurrentTimestamp),
                                00000.0,
                              ),
                            ));

                            await widget.parameter3!
                                .update(createVehiculosRecordData(
                              ultimotiempo: valueOrDefault<double>(
                                functions.tiempodeestacionamiento(
                                    widget.parameter5!, getCurrentTimestamp),
                                0000000.0,
                              ),
                              activo: false,
                              finestacionamiento: getCurrentTimestamp,
                            ));

                            var balanceRecordReference =
                                BalanceRecord.createDoc(currentUserReference!);
                            await balanceRecordReference
                                .set(createBalanceRecordData(
                              idUser: currentUserReference,
                              fecha: getCurrentTimestamp,
                              salida: functions.montoacobrar2(
                                  functions.tiempodeestacionamiento(
                                      widget.parameter5!, getCurrentTimestamp),
                                  10000.0),
                              balance: valueOrDefault<double>(
                                functions.balance(
                                    buttonBalanceRecordList
                                        .map((e) => e.ingreso)
                                        .toList(),
                                    buttonBalanceRecordList
                                        .map((e) => e.salida)
                                        .toList(),
                                    0.0,
                                    functions.montoacobrar2(
                                        functions.tiempodeestacionamiento(
                                            widget.parameter5!,
                                            getCurrentTimestamp),
                                        10000.0)),
                                0.0,
                              ),
                              tipodemovimiento: 'Salida',
                            ));
                            _model.balancefinestacio =
                                BalanceRecord.getDocumentFromData(
                                    createBalanceRecordData(
                                      idUser: currentUserReference,
                                      fecha: getCurrentTimestamp,
                                      salida: functions.montoacobrar2(
                                          functions.tiempodeestacionamiento(
                                              widget.parameter5!,
                                              getCurrentTimestamp),
                                          10000.0),
                                      balance: valueOrDefault<double>(
                                        functions.balance(
                                            buttonBalanceRecordList
                                                .map((e) => e.ingreso)
                                                .toList(),
                                            buttonBalanceRecordList
                                                .map((e) => e.salida)
                                                .toList(),
                                            0.0,
                                            functions.montoacobrar2(
                                                functions
                                                    .tiempodeestacionamiento(
                                                        widget.parameter5!,
                                                        getCurrentTimestamp),
                                                10000.0)),
                                        0.0,
                                      ),
                                      tipodemovimiento: 'Salida',
                                    ),
                                    balanceRecordReference);

                            await widget.parameter6!
                                .update(createMovimientosRecordData(
                              gasto: _model.balancefinestacio?.salida,
                            ));

                            await currentUserReference!
                                .update(createUsersRecordData(
                              saldo: _model.balancefinestacio?.balance,
                            ));

                            await _model.creacionVehiculoGral!.reference
                                .update(createAutosGeneralRecordData(
                              montopagado: _model.balancefinestacio?.salida,
                              finestacionamiento: getCurrentTimestamp,
                              activo: false,
                            ));
                            setState(() {
                              FFAppState().startomer = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Se finalizo el estacionamiento',
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

                            setState(() {});
                          },
                          text: 'FINALIZAR',
                          icon: Icon(
                            Icons.play_arrow,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            width: 170.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).error,
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
                        );
                      },
                    ),
                  Theme(
                    data: ThemeData(
                      checkboxTheme: CheckboxThemeData(
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      unselectedWidgetColor:
                          FlutterFlowTheme.of(context).secondaryText,
                    ),
                    child: Checkbox(
                      value: _model.checkboxValue ??= FFAppState().ubicacbool,
                      onChanged: (newValue) async {
                        setState(() => _model.checkboxValue = newValue!);
                      },
                      activeColor: FlutterFlowTheme.of(context).primary,
                      checkColor: FlutterFlowTheme.of(context).info,
                    ),
                  ),
                ].divide(SizedBox(height: 5.0)),
              ),
            ),
          ),
          if (!FFAppState().ubicacbool)
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (FFAppState().ubicacbool == false)
                  Text(
                    'Esta fuera del area de estacionamiento pago',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
