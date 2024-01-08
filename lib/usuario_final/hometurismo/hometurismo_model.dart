import '/admin/crearactturistica/crearactturistica_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/emptylistturismo_widget.dart';
import '/components/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'hometurismo_widget.dart' show HometurismoWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HometurismoModel extends FlutterFlowModel<HometurismoWidget> {
  ///  Local state fields for this page.

  List<double> temp = [];
  void addToTemp(double item) => temp.add(item);
  void removeFromTemp(double item) => temp.remove(item);
  void removeAtIndexFromTemp(int index) => temp.removeAt(index);
  void insertAtIndexInTemp(int index, double item) => temp.insert(index, item);
  void updateTempAtIndex(int index, Function(double) updateFn) =>
      temp[index] = updateFn(temp[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (weather api call)] action in Hometurismo widget.
  ApiCallResponse? apiResultooa;
  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  void dispose() {
    unfocusNode.dispose();
    navBar1Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
