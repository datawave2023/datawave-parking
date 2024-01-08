import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/inspector/payment_message_false_q_r/payment_message_false_q_r_widget.dart';
import 'codigooperacionpage_widget.dart' show CodigooperacionpageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CodigooperacionpageModel
    extends FlutterFlowModel<CodigooperacionpageWidget> {
  ///  Local state fields for this page.

  String aprobado = '';

  int? maxRetries = 5;

  int? retryCount = 0;

  double? montolocal;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  final textFieldMask = MaskTextInputFormatter(mask: '###########');
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (get pago)] action in Button widget.
  ApiCallResponse? apiResultald555;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  AutosGeneralRecord? queryautosgenerales;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  AutosGeneralRecord? queryautosgeneralesCopy;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
