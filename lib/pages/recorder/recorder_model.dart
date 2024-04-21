import '/flutter_flow/flutter_flow_util.dart';
import 'recorder_widget.dart' show RecorderWidget;
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class RecorderModel extends FlutterFlowModel<RecorderWidget> {
  ///  Local state fields for this page.

  bool isRecording = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  AudioRecorder? audioRecorder;
  String? myrecording;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks.
  Future stopRecording(BuildContext context) async {}
}
