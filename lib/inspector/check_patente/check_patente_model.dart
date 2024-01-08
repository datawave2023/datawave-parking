import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/selecciontipodia_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/inspector/cargar_vehiculo_ins/cargar_vehiculo_ins_widget.dart';
import '/inspector/forminfraccion/forminfraccion_widget.dart';
import '/inspector/nav_barinspector/nav_barinspector_widget.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'check_patente_widget.dart' show CheckPatenteWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CheckPatenteModel extends FlutterFlowModel<CheckPatenteWidget> {
  ///  Local state fields for this page.

  bool apagarverificar = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? autosverif;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Algolia Search Results from action on Button
  List<AutosGeneralRecord>? algoliaSearchResults = [];
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  VehiculosRecord? vehiculoCopy;
  // Model for NavBarinspector component.
  late NavBarinspectorModel navBarinspectorModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBarinspectorModel = createModel(context, () => NavBarinspectorModel());
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    navBarinspectorModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
