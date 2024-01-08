import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'emptylistturismo_model.dart';
export 'emptylistturismo_model.dart';

class EmptylistturismoWidget extends StatefulWidget {
  const EmptylistturismoWidget({Key? key}) : super(key: key);

  @override
  _EmptylistturismoWidgetState createState() => _EmptylistturismoWidgetState();
}

class _EmptylistturismoWidgetState extends State<EmptylistturismoWidget> {
  late EmptylistturismoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptylistturismoModel());

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
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: 300.0,
          height: 120.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                FlutterFlowTheme.of(context).primary,
                FlutterFlowTheme.of(context).info
              ],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(0.07, -1.0),
              end: AlignmentDirectional(-0.07, 1.0),
            ),
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              color: Color(0xFFBFCEDC),
            ),
          ),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              'Proximamente Información turistica de la zona',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: FlutterFlowTheme.of(context).info,
                    fontSize: 20.0,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
