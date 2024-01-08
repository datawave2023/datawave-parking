import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'botonerainiciarvehiculo_widget.dart' show BotonerainiciarvehiculoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BotonerainiciarvehiculoModel
    extends FlutterFlowModel<BotonerainiciarvehiculoWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  MovimientosRecord? mov;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AutosGeneralRecord? creacionVehiculoGral;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  BalanceRecord? balancefinestacio;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
