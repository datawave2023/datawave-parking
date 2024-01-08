import '/components/showing_q_r_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'selecciontipodia_model.dart';
export 'selecciontipodia_model.dart';

class SelecciontipodiaWidget extends StatefulWidget {
  const SelecciontipodiaWidget({
    Key? key,
    required this.idvehiculo,
    required this.iduser,
  }) : super(key: key);

  final DocumentReference? idvehiculo;
  final DocumentReference? iduser;

  @override
  _SelecciontipodiaWidgetState createState() => _SelecciontipodiaWidgetState();
}

class _SelecciontipodiaWidgetState extends State<SelecciontipodiaWidget> {
  late SelecciontipodiaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelecciontipodiaModel());

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
      child: Container(
        width: 350.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: FlutterFlowChoiceChips(
                  options: [
                    ChipData('Día completo', Icons.sunny),
                    ChipData('Medio día', Icons.sunny_snowing)
                  ],
                  onChanged: (val) =>
                      setState(() => _model.choiceChipsValue = val?.first),
                  selectedChipStyle: ChipStyle(
                    backgroundColor: Color(0xFF9B8E6C),
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                    iconColor: Color(0xFFEFAD44),
                    iconSize: 25.0,
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  unselectedChipStyle: ChipStyle(
                    backgroundColor: FlutterFlowTheme.of(context).alternate,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).secondaryText,
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
                  controller: _model.choiceChipsValueController ??=
                      FormFieldController<List<String>>(
                    ['Día completo'],
                  ),
                  wrapped: true,
                ),
              ),
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
                        padding: MediaQuery.viewInsetsOf(context),
                        child: ShowingQRWidget(
                          dia: _model.choiceChipsValue!,
                          idvehiculo: widget.idvehiculo!,
                        ),
                      ));
                    },
                  ).then((value) => safeSetState(() {}));

                  setState(() {
                    FFAppState().montopagado =
                        _model.choiceChipsValue == 'Día completo'
                            ? 3000.0
                            : 1500.0;
                  });
                },
                text: 'QR de cobro',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
    );
  }
}
