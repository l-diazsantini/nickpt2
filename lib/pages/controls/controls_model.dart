import '/flutter_flow/flutter_flow_util.dart';
import 'controls_widget.dart' show ControlsWidget;
import 'package:flutter/material.dart';

class ControlsModel extends FlutterFlowModel<ControlsWidget> {
  ///  Local state fields for this page.

  bool showTextBackward = true;

  bool showTextLeft = true;

  bool showTextRight = true;

  bool showTextStop = true;

  bool showTextForward = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
