import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/inspector/payment_message_false_q_r/payment_message_false_q_r_widget.dart';
import 'codigodeoperacionobsoleto_widget.dart'
    show CodigodeoperacionobsoletoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CodigodeoperacionobsoletoModel
    extends FlutterFlowModel<CodigodeoperacionobsoletoWidget> {
  ///  Local state fields for this component.

  int? retryCount = 0;

  int? maxRetries = 5;

  String aprobado = 'approved';

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  final textFieldMask = MaskTextInputFormatter(mask: '###########');
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (get pago)] action in Button widget.
  ApiCallResponse? apiResultald;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  AutosGeneralRecord? queryautosgenerales;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
