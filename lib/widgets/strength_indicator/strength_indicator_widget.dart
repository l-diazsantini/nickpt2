import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'strength_indicator_model.dart';
export 'strength_indicator_model.dart';

class StrengthIndicatorWidget extends StatefulWidget {
  const StrengthIndicatorWidget({
    super.key,
    required this.rssi,
    Color? color,
  }) : color = color ?? const Color(0x7F39D2C0);

  final int? rssi;
  final Color color;

  @override
  State<StrengthIndicatorWidget> createState() =>
      _StrengthIndicatorWidgetState();
}

class _StrengthIndicatorWidgetState extends State<StrengthIndicatorWidget> {
  late StrengthIndicatorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StrengthIndicatorModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Align(
              alignment: const AlignmentDirectional(-1.0, -1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 11.0, 2.0, 0.0),
                child: Container(
                  width: 4.0,
                  height: 7.0,
                  decoration: BoxDecoration(
                    color: const Color(0x7F11F2D6),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-1.0, -1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 2.0, 0.0),
                child: Container(
                  width: 4.0,
                  height: 11.0,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      widget.rssi! >= -90
                          ? widget.color
                          : FlutterFlowTheme.of(context).secondaryText,
                      FlutterFlowTheme.of(context).secondaryText,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-1.0, -1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 2.0, 0.0),
                child: Container(
                  width: 4.0,
                  height: 15.0,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      widget.rssi! >= -67
                          ? widget.color
                          : FlutterFlowTheme.of(context).secondaryText,
                      FlutterFlowTheme.of(context).secondaryText,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-1.0, -1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.2, 2.0, 0.0),
                child: Container(
                  width: 4.0,
                  height: 18.0,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      widget.rssi! >= -55
                          ? widget.color
                          : FlutterFlowTheme.of(context).secondaryText,
                      FlutterFlowTheme.of(context).secondaryText,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
