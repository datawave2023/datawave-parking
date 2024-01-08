import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'showing_q_r_model.dart';
export 'showing_q_r_model.dart';

class ShowingQRWidget extends StatefulWidget {
  const ShowingQRWidget({
    Key? key,
    required this.dia,
    required this.idvehiculo,
  }) : super(key: key);

  final String? dia;
  final DocumentReference? idvehiculo;

  @override
  _ShowingQRWidgetState createState() => _ShowingQRWidgetState();
}

class _ShowingQRWidgetState extends State<ShowingQRWidget> {
  late ShowingQRModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShowingQRModel());

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
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 0.0, 8.0),
        child: Container(
          width: 300.0,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 3.0,
                color: Color(0x33000000),
                offset: Offset(0.0, 1.0),
              )
            ],
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: Color(0xFFE0E3E7),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.dia == 'Día completo')
                  Container(
                    width: 250.0,
                    height: 250.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Dia Completo',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        BarcodeWidget(
                          data: 'https://mpago.la/2hjnxZD',
                          barcode: Barcode.qrCode(),
                          width: 200.0,
                          height: 200.0,
                          color: FlutterFlowTheme.of(context).primaryText,
                          backgroundColor: Colors.transparent,
                          errorBuilder: (_context, _error) => SizedBox(
                            width: 200.0,
                            height: 200.0,
                          ),
                          drawText: false,
                        ),
                      ],
                    ),
                  ),
                if (widget.dia == 'Medio día')
                  Container(
                    width: 250.0,
                    height: 250.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Medio Dia',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        BarcodeWidget(
                          data: 'https://mpago.la/2uKSgSA',
                          barcode: Barcode.qrCode(),
                          width: 200.0,
                          height: 200.0,
                          color: FlutterFlowTheme.of(context).primaryText,
                          backgroundColor: Colors.transparent,
                          errorBuilder: (_context, _error) => SizedBox(
                            width: 200.0,
                            height: 200.0,
                          ),
                          drawText: false,
                        ),
                      ],
                    ),
                  ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed(
                        'codigooperacionpage',
                        queryParameters: {
                          'iduser': serializeParam(
                            currentUserReference,
                            ParamType.DocumentReference,
                          ),
                          'idvehiculo': serializeParam(
                            widget.idvehiculo,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                      );

                      Navigator.pop(context);
                    },
                    text: 'Continuar',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
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
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    text: 'Volver',
                    icon: Icon(
                      Icons.chevron_left,
                      size: 15.0,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).info,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context)
                                    .backgroundComponents,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Color(0xFFF11717),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
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
