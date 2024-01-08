import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/showing_q_r_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'cargar_vehiculo_ins_model.dart';
export 'cargar_vehiculo_ins_model.dart';

class CargarVehiculoInsWidget extends StatefulWidget {
  const CargarVehiculoInsWidget({Key? key}) : super(key: key);

  @override
  _CargarVehiculoInsWidgetState createState() =>
      _CargarVehiculoInsWidgetState();
}

class _CargarVehiculoInsWidgetState extends State<CargarVehiculoInsWidget>
    with TickerProviderStateMixin {
  late CargarVehiculoInsModel _model;

  LatLng? currentUserLocationValue;

  final animationsMap = {
    'buttonOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ShakeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          hz: 10,
          offset: Offset(0.0, 0.0),
          rotation: 0.087,
        ),
      ],
    ),
    'buttonOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ShakeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          hz: 10,
          offset: Offset(0.0, 0.0),
          rotation: 0.087,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CargarVehiculoInsModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowChoiceChips(
                                options: [
                                  ChipData('Día completo', Icons.sunny),
                                  ChipData('Medio día', Icons.sunny_snowing)
                                ],
                                onChanged: (val) => setState(
                                    () => _model.choiceChipsValue = val?.first),
                                selectedChipStyle: ChipStyle(
                                  backgroundColor: Color(0xFF9B8E6C),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                  iconColor: Color(0xFFEFAD44),
                                  iconSize: 18.0,
                                  elevation: 4.0,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                  iconColor: Color(0xFF92A0AC),
                                  iconSize: 18.0,
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                chipSpacing: 12.0,
                                rowSpacing: 12.0,
                                multiselect: false,
                                initialized: _model.choiceChipsValue != null,
                                alignment: WrapAlignment.start,
                                controller:
                                    _model.choiceChipsValueController ??=
                                        FormFieldController<List<String>>(
                                  ['Día completo'],
                                ),
                                wrapped: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (!_model.vehiculocreado)
                              FFButtonWidget(
                                onPressed: () async {
                                  currentUserLocationValue =
                                      await getCurrentUserLocation(
                                          defaultLocation: LatLng(0.0, 0.0));
                                  final firestoreBatch =
                                      FirebaseFirestore.instance.batch();
                                  try {
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
                                      _model.idVehiculo =
                                          VehiculosRecord.getDocumentFromData(
                                              createVehiculosRecordData(
                                                patente: functions.mayuscula(
                                                    _model
                                                        .textController1.text),
                                                activo: false,
                                                autoverificado: false,
                                                ubicacionactual:
                                                    currentUserLocationValue,
                                              ),
                                              vehiculosRecordReference1);

                                      firestoreBatch.update(
                                          _model.idVehiculo!.reference,
                                          createVehiculosRecordData(
                                            idvehiculo:
                                                _model.idVehiculo?.reference,
                                          ));

                                      firestoreBatch.set(
                                          AutosGeneralRecord.collection.doc(),
                                          createAutosGeneralRecordData(
                                            patente: functions.mayuscula(
                                                _model.textController1.text),
                                            montopagado: 0.0,
                                            fecha: getCurrentTimestamp,
                                            coordenada:
                                                currentUserLocationValue,
                                            idvehiculo:
                                                _model.idVehiculo?.reference,
                                            inicioestacionamiento:
                                                getCurrentTimestamp,
                                            diacompletotext:
                                                _model.choiceChipsValue,
                                            autoverificado: false,
                                            uid: currentUserReference,
                                            activo: false,
                                          ));
                                      setState(() {
                                        _model.vehiculocreado = true;
                                      });
                                      setState(() {
                                        FFAppState().idvehiculo =
                                            _model.idVehiculo?.reference;
                                        FFAppState().patentetext =
                                            _model.idVehiculo!.patente;
                                        FFAppState().montopagado =
                                            _model.choiceChipsValue ==
                                                    'Día completo'
                                                ? 3000.0
                                                : 1500.0;
                                      });
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                              child: AlertDialog(
                                            title: Text('Creacion de vehiculo'),
                                            content: Text(
                                                'El vehiculo de patente: ${_model.idVehiculo?.patente}. Se creo correctamente'),
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
                                      _model.idVehiculo1 =
                                          VehiculosRecord.getDocumentFromData(
                                              createVehiculosRecordData(
                                                patente: functions.mayuscula(
                                                    _model
                                                        .textController2.text),
                                                activo: false,
                                                autoverificado: false,
                                                ubicacionactual:
                                                    currentUserLocationValue,
                                              ),
                                              vehiculosRecordReference2);

                                      firestoreBatch.update(
                                          _model.idVehiculo1!.reference,
                                          createVehiculosRecordData(
                                            idvehiculo:
                                                _model.idVehiculo1?.reference,
                                          ));

                                      firestoreBatch.set(
                                          AutosGeneralRecord.collection.doc(),
                                          createAutosGeneralRecordData(
                                            patente:
                                                _model.idVehiculo1?.patente,
                                            montopagado: 0.0,
                                            fecha: getCurrentTimestamp,
                                            coordenada:
                                                currentUserLocationValue,
                                            idvehiculo:
                                                _model.idVehiculo1?.reference,
                                            inicioestacionamiento:
                                                getCurrentTimestamp,
                                            activo: false,
                                            diacompletotext:
                                                _model.choiceChipsValue,
                                            autoverificado: false,
                                            uid: currentUserReference,
                                          ));
                                      setState(() {
                                        _model.vehiculocreado = true;
                                      });
                                      setState(() {
                                        FFAppState().idvehiculo =
                                            _model.idVehiculo1?.reference;
                                        FFAppState().patentetext =
                                            _model.idVehiculo1!.patente;
                                        FFAppState().montopagado =
                                            _model.choiceChipsValue ==
                                                    'Día completo'
                                                ? 3000.0
                                                : 1500.0;
                                      });
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                              child: AlertDialog(
                                            title: Text('Creacion de vehiculo'),
                                            content: Text(
                                                'El vehiculo de patente: ${_model.idVehiculo1?.patente}. Se creo correctamente'),
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
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    if (animationsMap[
                                            'buttonOnActionTriggerAnimation1'] !=
                                        null) {
                                      await animationsMap[
                                              'buttonOnActionTriggerAnimation1']!
                                          .controller
                                          .forward(from: 0.0);
                                    }
                                    if (animationsMap[
                                            'buttonOnActionTriggerAnimation2'] !=
                                        null) {
                                      await animationsMap[
                                              'buttonOnActionTriggerAnimation2']!
                                          .controller
                                          .forward(from: 0.0);
                                    }
                                  } finally {
                                    await firestoreBatch.commit();
                                  }

                                  setState(() {});
                                },
                                text: 'Crear vehiculo',
                                options: FFButtonOptions(
                                  width: 200.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xA91DF302),
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
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (_model.vehiculocreado)
                                  FFButtonWidget(
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return WebViewAware(
                                              child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: ShowingQRWidget(
                                              dia: _model.choiceChipsValue!,
                                              idvehiculo:
                                                  FFAppState().idvehiculo!,
                                            ),
                                          ));
                                        },
                                      ).then((value) => safeSetState(() {}));

                                      Navigator.pop(context);
                                    },
                                    text: 'QR',
                                    options: FFButtonOptions(
                                      width: 120.0,
                                      height: 80.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'buttonOnActionTriggerAnimation1']!,
                                  ),
                                if (_model.vehiculocreado)
                                  FFButtonWidget(
                                    onPressed: () async {
                                      currentUserLocationValue =
                                          await getCurrentUserLocation(
                                              defaultLocation:
                                                  LatLng(0.0, 0.0));

                                      await FFAppState()
                                          .idvehiculo!
                                          .update(createVehiculosRecordData(
                                            activo: true,
                                            inicioestacionamiento:
                                                getCurrentTimestamp,
                                            ubicacionactual:
                                                currentUserLocationValue,
                                          ));
                                      _model.queryautosgenerales2 =
                                          await queryAutosGeneralRecordOnce(
                                        queryBuilder: (autosGeneralRecord) =>
                                            autosGeneralRecord.where(
                                          'idvehiculo',
                                          isEqualTo: FFAppState().idvehiculo,
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);

                                      await _model
                                          .queryautosgenerales2!.reference
                                          .update(createAutosGeneralRecordData(
                                        activo: true,
                                        inicioestacionamiento:
                                            getCurrentTimestamp,
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
                                        patente: FFAppState().patentetext,
                                        inicio: getCurrentTimestamp,
                                        idvehiculo: FFAppState().idvehiculo,
                                        gasto: FFAppState().montopagado,
                                      ));

                                      context.pushNamed('CheckPatente');

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Se grabo correctamente la informacion',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );

                                      setState(() {});
                                    },
                                    text: 'Efectivo',
                                    options: FFButtonOptions(
                                      width: 120.0,
                                      height: 80.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
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
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'buttonOnActionTriggerAnimation2']!,
                                  ),
                              ],
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              text: 'Cancelar',
                              options: FFButtonOptions(
                                width: 130.0,
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
                          ].divide(SizedBox(height: 10.0)),
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 13.5))
                        .around(SizedBox(height: 13.5)),
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
