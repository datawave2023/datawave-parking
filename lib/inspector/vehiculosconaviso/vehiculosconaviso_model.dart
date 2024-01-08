import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/inspector/nav_barinspector/nav_barinspector_widget.dart';
import 'vehiculosconaviso_widget.dart' show VehiculosconavisoWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VehiculosconavisoModel extends FlutterFlowModel<VehiculosconavisoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NavBarinspector component.
  late NavBarinspectorModel navBarinspectorModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBarinspectorModel = createModel(context, () => NavBarinspectorModel());
  }

  void dispose() {
    unfocusNode.dispose();
    navBarinspectorModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
