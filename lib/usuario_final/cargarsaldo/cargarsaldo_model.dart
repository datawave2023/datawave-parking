import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'cargarsaldo_widget.dart' show CargarsaldoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CargarsaldoModel extends FlutterFlowModel<CargarsaldoWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for monto widget.
  FocusNode? montoFocusNode;
  TextEditingController? montoController;
  String? Function(BuildContext, String?)? montoControllerValidator;
  // Stores action output result for [Custom Action - createPaymentPreference] action in Button widget.
  String? id;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  BalanceRecord? bal1;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    montoFocusNode?.dispose();
    montoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
