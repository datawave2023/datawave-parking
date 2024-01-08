import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/cargarvehiculo2_widget.dart';
import '/components/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'estacionamiento_model.dart';
export 'estacionamiento_model.dart';

class EstacionamientoWidget extends StatefulWidget {
  const EstacionamientoWidget({
    Key? key,
    this.antesdela16,
  }) : super(key: key);

  final bool? antesdela16;

  @override
  _EstacionamientoWidgetState createState() => _EstacionamientoWidgetState();
}

class _EstacionamientoWidgetState extends State<EstacionamientoWidget>
    with TickerProviderStateMixin {
  late EstacionamientoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = {
    'iconOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EstacionamientoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().antesdelas16 = functions.hora16()!;
      });
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 1,
      initialIndex: 0,
    )..addListener(() => setState(() {}));

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
        drawer: WebViewAware(
            child: Drawer(
          elevation: 16.0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipOval(
                      child: Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          shape: BoxShape.circle,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://picsum.photos/seed/337/600',
                            width: 80.0,
                            height: 80.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentUserEmail,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        AuthUserStreamWidget(
                          builder: (context) => Text(
                            currentUserDisplayName,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: Divider(
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                      ],
                    ),
                  ].divide(SizedBox(width: 5.0)).around(SizedBox(width: 5.0)),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: 50.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 2.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('Mismovimientos');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipOval(
                                child: Container(
                                  width: 80.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.settings_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 30.0,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mis movimientos',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  SizedBox(
                                    width: 200.0,
                                    child: Divider(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                  ),
                                ],
                              ),
                            ]
                                .divide(SizedBox(width: 5.0))
                                .around(SizedBox(width: 5.0)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 2.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('Misinfracciones');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipOval(
                                child: Container(
                                  width: 80.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.settings_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 30.0,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Infracciones',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  SizedBox(
                                    width: 200.0,
                                    child: Divider(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                  ),
                                ],
                              ),
                            ]
                                .divide(SizedBox(width: 5.0))
                                .around(SizedBox(width: 5.0)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 2.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('Misvehiculos');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipOval(
                                child: Container(
                                  width: 80.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.settings_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 30.0,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mis vehiculos',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  SizedBox(
                                    width: 200.0,
                                    child: Divider(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                  ),
                                ],
                              ),
                            ]
                                .divide(SizedBox(width: 5.0))
                                .around(SizedBox(width: 5.0)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 2.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'Mensajes',
                              queryParameters: {
                                'iduser': serializeParam(
                                  currentUserReference,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipOval(
                                child: Container(
                                  width: 80.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.settings_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 30.0,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mis mensajes',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  SizedBox(
                                    width: 200.0,
                                    child: Divider(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                  ),
                                ],
                              ),
                            ]
                                .divide(SizedBox(width: 5.0))
                                .around(SizedBox(width: 5.0)),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'Perfilusuario',
                          queryParameters: {
                            'iduser': serializeParam(
                              currentUserReference,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 2.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipOval(
                                child: Container(
                                  width: 80.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.settings_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 30.0,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Perfil',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  SizedBox(
                                    width: 200.0,
                                    child: Divider(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                  ),
                                ],
                              ),
                            ]
                                .divide(SizedBox(width: 5.0))
                                .around(SizedBox(width: 5.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  GoRouter.of(context).prepareAuthEvent();
                  await authManager.signOut();
                  GoRouter.of(context).clearRedirectLocation();

                  context.goNamedAuth('login', context.mounted);
                },
                text: 'Cerrar sesión',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).error,
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
        )),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      scaffoldKey.currentState!.openDrawer();
                    },
                  ),
                ],
              ),
            ],
          ),
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Estacionamiento medido',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Outfit',
                          color: Colors.white,
                          fontSize: 22.0,
                        ),
                  ),
                ],
              ),
            ],
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
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
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: Cargarvehiculo2Widget(),
                                    ),
                                  ));
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            text: 'Carga auto',
                            icon: Icon(
                              Icons.add,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              width: 250.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF42EF39),
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
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: StreamBuilder<List<VehiculosRecord>>(
                                  stream: queryVehiculosRecord(
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
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<VehiculosRecord>
                                        listViewVehiculosRecordList =
                                        snapshot.data!;
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewVehiculosRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewVehiculosRecord =
                                            listViewVehiculosRecordList[
                                                listViewIndex];
                                        return Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 2.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              constraints: BoxConstraints(
                                                maxWidth: 600.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 5.0, 10.0, 5.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 180.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, -1.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Vehiculo',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                  Stack(
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/patente.png',
                                                                            width:
                                                                                150.0,
                                                                            height:
                                                                                75.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              25.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            listViewVehiculosRecord.patente,
                                                                            style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                  fontFamily: 'Outfit',
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  fontSize: 20.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Text(
                                                                    'Hora de inicio: ${listViewVehiculosRecord.inicioestacionamiento?.toString()}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          fontSize:
                                                                              10.0,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    'Hora de fin: ${listViewVehiculosRecord.finestacionamiento?.toString()}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          fontSize:
                                                                              10.0,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    'Ultimo estacionamiento en hs: ${listViewVehiculosRecord.ultimotiempo.toString()}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          fontSize:
                                                                              10.0,
                                                                        ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        'Auto verificado',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                      if (listViewVehiculosRecord
                                                                          .autoverificado)
                                                                        Icon(
                                                                          Icons
                                                                              .check_circle,
                                                                          color:
                                                                              Color(0xFF42EF39),
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      if (!listViewVehiculosRecord
                                                                          .autoverificado)
                                                                        Icon(
                                                                          Icons
                                                                              .cancel_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        5.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Container(
                                                            width: 150.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          'Estacionamiento',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              250.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Visibility(
                                                                            visible:
                                                                                !listViewVehiculosRecord.activo,
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                if (FFAppState().antesdelas16)
                                                                                  FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      currentUserLocationValue = await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
                                                                                      var _shouldSetState = false;
                                                                                      _model.apiResultdv7 = await CrearPagoCall.call(
                                                                                        accessToken: 'APP_USR-3479243195017758-122810-5e15779cc8b23ea6428e56e2865a8722-1207751138',
                                                                                        monto: 10.0,
                                                                                        carId: listViewVehiculosRecord.reference.id,
                                                                                        carId2: '/Users/${currentUserReference?.id}/Vehiculos/${listViewVehiculosRecord.reference.id}',
                                                                                        idUser: currentUserReference?.id,
                                                                                        coordenada: currentUserLocationValue?.toString(),
                                                                                        patente: listViewVehiculosRecord.patente,
                                                                                        backurl: 'https://estacionamiento-medido-c8mrlm.flutterflow.app/estacionamiento',
                                                                                      );
                                                                                      _shouldSetState = true;
                                                                                      if ((_model.apiResultdv7?.succeeded ?? true)) {
                                                                                        await launchURL(CrearPagoCall.url(
                                                                                          (_model.apiResultdv7?.jsonBody ?? ''),
                                                                                        ).toString()!);
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              'Inicio de estacionamiento. El estacionamiento es valido por un dia!',
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                            ),
                                                                                            duration: Duration(milliseconds: 4000),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                          ),
                                                                                        );
                                                                                        if (_shouldSetState) setState(() {});
                                                                                        return;
                                                                                      } else {
                                                                                        if (_shouldSetState) setState(() {});
                                                                                        return;
                                                                                      }

                                                                                      if (_shouldSetState) setState(() {});
                                                                                    },
                                                                                    text: 'Iniciar estacionamiento',
                                                                                    icon: Icon(
                                                                                      Icons.sunny,
                                                                                      size: 15.0,
                                                                                    ),
                                                                                    options: FFButtonOptions(
                                                                                      width: 250.0,
                                                                                      height: 40.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: 'Readex Pro',
                                                                                            color: Colors.white,
                                                                                            fontSize: 8.0,
                                                                                          ),
                                                                                      elevation: 3.0,
                                                                                      borderSide: BorderSide(
                                                                                        color: Colors.transparent,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                  ),
                                                                                if (!FFAppState().antesdelas16)
                                                                                  FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      currentUserLocationValue = await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
                                                                                      var _shouldSetState = false;
                                                                                      final firestoreBatch = FirebaseFirestore.instance.batch();
                                                                                      try {
                                                                                        _model.apiResultdv712 = await CrearPagoCall.call(
                                                                                          accessToken: 'APP_USR-3479243195017758-122810-5e15779cc8b23ea6428e56e2865a8722-1207751138',
                                                                                          monto: 1500.0,
                                                                                          carId: listViewVehiculosRecord.reference.id,
                                                                                          carId2: '/Users/${currentUserReference?.id}/Vehiculos/${listViewVehiculosRecord.reference.id}',
                                                                                          idUser: currentUserReference?.id,
                                                                                          coordenada: currentUserLocationValue?.toString(),
                                                                                          patente: listViewVehiculosRecord.patente,
                                                                                          backurl: 'https://estacionamiento-medido-c8mrlm.flutterflow.app/estacionamiento',
                                                                                        );
                                                                                        _shouldSetState = true;
                                                                                        if ((_model.apiResultdv712?.succeeded ?? true)) {
                                                                                          await launchURL(CrearPagoCall.url(
                                                                                            (_model.apiResultdv712?.jsonBody ?? ''),
                                                                                          ).toString()!);
                                                                                          await Future.delayed(const Duration(milliseconds: 15000));

                                                                                          var movimientosRecordReference = MovimientosRecord.createDoc(currentUserReference!);
                                                                                          firestoreBatch.set(
                                                                                              movimientosRecordReference,
                                                                                              createMovimientosRecordData(
                                                                                                idUser: currentUserReference,
                                                                                                fecha: getCurrentTimestamp,
                                                                                                coordenada: currentUserLocationValue,
                                                                                                patente: listViewVehiculosRecord.patente,
                                                                                                inicio: getCurrentTimestamp,
                                                                                                idvehiculo: listViewVehiculosRecord.reference,
                                                                                                diacompleto: true,
                                                                                                gasto: CrearPagoCall.monto(
                                                                                                  (_model.apiResultdv712?.jsonBody ?? ''),
                                                                                                )?.toDouble(),
                                                                                              ));
                                                                                          _model.mov1 = MovimientosRecord.getDocumentFromData(
                                                                                              createMovimientosRecordData(
                                                                                                idUser: currentUserReference,
                                                                                                fecha: getCurrentTimestamp,
                                                                                                coordenada: currentUserLocationValue,
                                                                                                patente: listViewVehiculosRecord.patente,
                                                                                                inicio: getCurrentTimestamp,
                                                                                                idvehiculo: listViewVehiculosRecord.reference,
                                                                                                diacompleto: true,
                                                                                                gasto: CrearPagoCall.monto(
                                                                                                  (_model.apiResultdv712?.jsonBody ?? ''),
                                                                                                )?.toDouble(),
                                                                                              ),
                                                                                              movimientosRecordReference);
                                                                                          _shouldSetState = true;

                                                                                          firestoreBatch.update(
                                                                                              listViewVehiculosRecord.reference,
                                                                                              createVehiculosRecordData(
                                                                                                inicioestacionamiento: getCurrentTimestamp,
                                                                                                idmovimientoactual: _model.mov1?.reference,
                                                                                                diacompleto: true,
                                                                                                diacompletotext: 'Día completo',
                                                                                              ));

                                                                                          firestoreBatch.update(
                                                                                              _model.mov1!.reference,
                                                                                              createMovimientosRecordData(
                                                                                                idmovimiento: _model.mov1?.reference,
                                                                                              ));

                                                                                          var balanceRecordReference = BalanceRecord.createDoc(currentUserReference!);
                                                                                          firestoreBatch.set(
                                                                                              balanceRecordReference,
                                                                                              createBalanceRecordData(
                                                                                                idUser: currentUserReference,
                                                                                                fecha: getCurrentTimestamp,
                                                                                                salida: CrearPagoCall.monto(
                                                                                                  (_model.apiResultdv712?.jsonBody ?? ''),
                                                                                                )?.toDouble(),
                                                                                                balance: 0.0,
                                                                                                ingreso: CrearPagoCall.monto(
                                                                                                  (_model.apiResultdv712?.jsonBody ?? ''),
                                                                                                )?.toDouble(),
                                                                                              ));
                                                                                          _model.balancefinestacio1 = BalanceRecord.getDocumentFromData(
                                                                                              createBalanceRecordData(
                                                                                                idUser: currentUserReference,
                                                                                                fecha: getCurrentTimestamp,
                                                                                                salida: CrearPagoCall.monto(
                                                                                                  (_model.apiResultdv712?.jsonBody ?? ''),
                                                                                                )?.toDouble(),
                                                                                                balance: 0.0,
                                                                                                ingreso: CrearPagoCall.monto(
                                                                                                  (_model.apiResultdv712?.jsonBody ?? ''),
                                                                                                )?.toDouble(),
                                                                                              ),
                                                                                              balanceRecordReference);
                                                                                          _shouldSetState = true;
                                                                                          _model.autogralinicio2 = await queryAutosGeneralRecordOnce(
                                                                                            queryBuilder: (autosGeneralRecord) => autosGeneralRecord.where(
                                                                                              'idvehiculo',
                                                                                              isEqualTo: listViewVehiculosRecord.reference,
                                                                                            ),
                                                                                            singleRecord: true,
                                                                                          ).then((s) => s.firstOrNull);
                                                                                          _shouldSetState = true;

                                                                                          firestoreBatch.update(
                                                                                              _model.autogralinicio2!.reference,
                                                                                              createAutosGeneralRecordData(
                                                                                                activo: true,
                                                                                                montopagado: CrearPagoCall.monto(
                                                                                                  (_model.apiResultdv712?.jsonBody ?? ''),
                                                                                                )?.toDouble(),
                                                                                              ));
                                                                                          await Future.delayed(const Duration(milliseconds: 20000));
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                'Inicio de estacionamiento. El estacionamiento es valido por un dia!',
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                              ),
                                                                                              duration: Duration(milliseconds: 4000),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                            ),
                                                                                          );
                                                                                          if (_shouldSetState) setState(() {});
                                                                                          return;
                                                                                        } else {
                                                                                          if (_shouldSetState) setState(() {});
                                                                                          return;
                                                                                        }
                                                                                      } finally {
                                                                                        await firestoreBatch.commit();
                                                                                      }

                                                                                      if (_shouldSetState) setState(() {});
                                                                                    },
                                                                                    text: 'Iniciar estacionamiento',
                                                                                    icon: Icon(
                                                                                      Icons.sunny_snowing,
                                                                                      size: 15.0,
                                                                                    ),
                                                                                    options: FFButtonOptions(
                                                                                      height: 40.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: 'Readex Pro',
                                                                                            color: Colors.white,
                                                                                            fontSize: 8.0,
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
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            if (listViewVehiculosRecord.activo)
                                                                              Container(
                                                                                width: 80.0,
                                                                                height: 80.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFF42EF39),
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Icon(
                                                                                  Icons.check_sharp,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 40.0,
                                                                                ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation1']!),
                                                                              ),
                                                                            if (!listViewVehiculosRecord.activo)
                                                                              Container(
                                                                                width: 80.0,
                                                                                height: 80.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFFF11717),
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Icon(
                                                                                  Icons.cancel_outlined,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 40.0,
                                                                                ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation2']!),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 5.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 5.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ].divide(SizedBox(height: 10.0)),
                          ),
                        ),
                        Container(
                          height: 500.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 600.0,
                                  constraints: BoxConstraints(
                                    maxWidth: 800.0,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment(0.0, 0),
                                        child: TabBar(
                                          labelColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          unselectedLabelColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 14.0,
                                                  ),
                                          unselectedLabelStyle: TextStyle(),
                                          indicatorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          padding: EdgeInsets.all(4.0),
                                          tabs: [
                                            Tab(
                                              text: 'ZONAS',
                                            ),
                                          ],
                                          controller: _model.tabBarController,
                                          onTap: (i) async {
                                            [() async {}][i]();
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: TabBarView(
                                          controller: _model.tabBarController,
                                          children: [
                                            SingleChildScrollView(
                                              primary: false,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 300.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await launchURL(
                                                                'https://www.google.com/maps/d/u/0/viewer?mid=1BeNwVb5ROA1G8mzmRtX9GF5UTU7776c&ll=-31.470283449487347%2C-64.5252473814453&z=15');
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Image.asset(
                                                              'assets/images/Captura_de_pantalla_2023-12-29_115731.png',
                                                              width: 300.0,
                                                              height: 200.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          'Tocar la imagen para ver en google maps',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 10.0)),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navBar1Model,
                  updateCallback: () => setState(() {}),
                  updateOnChange: true,
                  child: NavBar1Widget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
