import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
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
  // State field(s) for nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreController;
  String? Function(BuildContext, String?)? nombreControllerValidator;
  String? _nombreControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'el valor debe ser mayo a \$ 100';
    }

    return null;
  }

  // State field(s) for DNI widget.
  FocusNode? dniFocusNode;
  TextEditingController? dniController;
  String? Function(BuildContext, String?)? dniControllerValidator;
  // State field(s) for monto widget.
  FocusNode? montoFocusNode;
  TextEditingController? montoController;
  String? Function(BuildContext, String?)? montoControllerValidator;
  // State field(s) for nro_tarjeta widget.
  FocusNode? nroTarjetaFocusNode;
  TextEditingController? nroTarjetaController;
  String? Function(BuildContext, String?)? nroTarjetaControllerValidator;
  // State field(s) for vencimientoanio widget.
  FocusNode? vencimientoanioFocusNode;
  TextEditingController? vencimientoanioController;
  String? Function(BuildContext, String?)? vencimientoanioControllerValidator;
  // State field(s) for vencimientomes widget.
  FocusNode? vencimientomesFocusNode;
  TextEditingController? vencimientomesController;
  String? Function(BuildContext, String?)? vencimientomesControllerValidator;
  // State field(s) for codigo_seguridad widget.
  FocusNode? codigoSeguridadFocusNode;
  TextEditingController? codigoSeguridadController;
  String? Function(BuildContext, String?)? codigoSeguridadControllerValidator;
  // Stores action output result for [Backend Call - API (Crear pago)] action in Button widget.
  ApiCallResponse? ed;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  BalanceRecord? bal1;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nombreControllerValidator = _nombreControllerValidator;
  }

  void dispose() {
    nombreFocusNode?.dispose();
    nombreController?.dispose();

    dniFocusNode?.dispose();
    dniController?.dispose();

    montoFocusNode?.dispose();
    montoController?.dispose();

    nroTarjetaFocusNode?.dispose();
    nroTarjetaController?.dispose();

    vencimientoanioFocusNode?.dispose();
    vencimientoanioController?.dispose();

    vencimientomesFocusNode?.dispose();
    vencimientomesController?.dispose();

    codigoSeguridadFocusNode?.dispose();
    codigoSeguridadController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
