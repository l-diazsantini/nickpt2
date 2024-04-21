import '/flutter_flow/flutter_flow_util.dart';
import 'bluetoothpermission_widget.dart' show BluetoothpermissionWidget;
import 'package:flutter/material.dart';

class BluetoothpermissionModel
    extends FlutterFlowModel<BluetoothpermissionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - isBluetoothEnabled] action in bluetoothpermission widget.
  bool? bluetoothEnabled;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
