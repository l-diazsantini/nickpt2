import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/empty_devices/empty_devices_widget.dart';
import '/widgets/strength_indicator/strength_indicator_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'bluetoothconnect_model.dart';
export 'bluetoothconnect_model.dart';

class BluetoothconnectWidget extends StatefulWidget {
  const BluetoothconnectWidget({
    super.key,
    bool? isBTEnabled,
  }) : isBTEnabled = isBTEnabled ?? false;

  final bool isBTEnabled;

  @override
  State<BluetoothconnectWidget> createState() => _BluetoothconnectWidgetState();
}

class _BluetoothconnectWidgetState extends State<BluetoothconnectWidget>
    with TickerProviderStateMixin {
  late BluetoothconnectModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BluetoothconnectModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.isBluetoothEnabled = widget.isBTEnabled;
      });
      if (_model.isBluetoothEnabled) {
        setState(() {
          _model.isFetchingDevices = true;
          _model.isFetchingConnectedDevices = true;
        });
        _model.fetchedConnectedDevices = await actions.getConnectedDevices();
        setState(() {
          _model.isFetchingConnectedDevices = false;
          _model.connectedDevices =
              _model.fetchedConnectedDevices!.toList().cast<BTDeviceStruct>();
        });
        _model.fetchedDevices = await actions.findDevices();
        setState(() {
          _model.isFetchingDevices = false;
          _model.foundDevices =
              _model.fetchedDevices!.toList().cast<BTDeviceStruct>();
        });
      }
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 0.5,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 0.5,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: true,
          title: Text(
            'RoboTAMU',
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'Plus Jakarta Sans',
                  color: FlutterFlowTheme.of(context).alternate,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 4.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Stack(
                children: [
                  if (_model.isBluetoothEnabled)
                    Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Connected Devices',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                          if (_model
                                                  .isFetchingConnectedDevices ??
                                              true)
                                            Text(
                                              'Searching...',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ).animateOnPageLoad(animationsMap[
                                                'textOnPageLoadAnimation1']!),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final displayConnectedDevices =
                                              _model.connectedDevices.toList();
                                          if (displayConnectedDevices.isEmpty) {
                                            return const Center(
                                              child: SizedBox(
                                                width: double.infinity,
                                                height: 50.0,
                                                child: EmptyDevicesWidget(
                                                  text: 'No connected devices',
                                                ),
                                              ),
                                            );
                                          }
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                displayConnectedDevices.length,
                                            itemBuilder: (context,
                                                displayConnectedDevicesIndex) {
                                              final displayConnectedDevicesItem =
                                                  displayConnectedDevices[
                                                      displayConnectedDevicesIndex];
                                              return Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 12.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'bluetoothsenddata',
                                                      queryParameters: {
                                                        'deviceName':
                                                            serializeParam(
                                                          displayConnectedDevicesItem
                                                              .name,
                                                          ParamType.String,
                                                        ),
                                                        'deviceID':
                                                            serializeParam(
                                                          displayConnectedDevicesItem
                                                              .id,
                                                          ParamType.String,
                                                        ),
                                                        'deviceRssi':
                                                            serializeParam(
                                                          displayConnectedDevicesItem
                                                              .rssi,
                                                          ParamType.int,
                                                        ),
                                                        'hasWriteCharacteristic':
                                                            serializeParam(
                                                          true,
                                                          ParamType.bool,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: const Color(0xFFF0D4D4),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  12.0,
                                                                  16.0,
                                                                  12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      displayConnectedDevicesItem
                                                                          .name,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Plus Jakarta Sans',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  StrengthIndicatorWidget(
                                                                    key: Key(
                                                                        'Keydbt_${displayConnectedDevicesIndex}_of_${displayConnectedDevices.length}'),
                                                                    rssi: displayConnectedDevicesItem
                                                                        .rssi,
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      () {
                                                                        if (displayConnectedDevicesItem.rssi >=
                                                                            -67) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .success;
                                                                        } else if (displayConnectedDevicesItem.rssi >=
                                                                            -90) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .warning;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .error;
                                                                        }
                                                                      }(),
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .success,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  displayConnectedDevicesItem
                                                                      .id,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Plus Jakarta Sans',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .arrow_forward_ios_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 24.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 50.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Devices',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                            if (!_model.isFetchingDevices)
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 2.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    setState(() {
                                                      _model.isFetchingConnectedDevices =
                                                          true;
                                                      _model.isFetchingDevices =
                                                          true;
                                                    });
                                                    _model.fetchedConnectedDevicesCopy =
                                                        await actions
                                                            .getConnectedDevices();
                                                    setState(() {
                                                      _model.isFetchingConnectedDevices =
                                                          false;
                                                      _model.connectedDevices = _model
                                                          .fetchedConnectedDevices!
                                                          .toList()
                                                          .cast<
                                                              BTDeviceStruct>();
                                                    });
                                                    _model.fetchedDevicesCopy =
                                                        await actions
                                                            .findDevices();
                                                    setState(() {
                                                      _model.isFetchingDevices =
                                                          false;
                                                      _model.foundDevices = _model
                                                          .fetchedDevices!
                                                          .toList()
                                                          .cast<
                                                              BTDeviceStruct>();
                                                    });

                                                    setState(() {});
                                                  },
                                                  child: Icon(
                                                    Icons.refresh_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 22.0,
                                                  ),
                                                ),
                                              ),
                                            if (_model.isFetchingDevices)
                                              Text(
                                                'Scanning...',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'textOnPageLoadAnimation2']!),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final displayDevices =
                                                _model.foundDevices.toList();
                                            if (displayDevices.isEmpty) {
                                              return const Center(
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  height: 50.0,
                                                  child: EmptyDevicesWidget(
                                                    text: 'No devices found',
                                                  ),
                                                ),
                                              );
                                            }
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: displayDevices.length,
                                              itemBuilder: (context,
                                                  displayDevicesIndex) {
                                                final displayDevicesItem =
                                                    displayDevices[
                                                        displayDevicesIndex];
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 12.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      _model.hasWrite =
                                                          await actions
                                                              .connectDevice(
                                                        displayDevicesItem,
                                                      );
                                                      setState(() {
                                                        _model.addToConnectedDevices(
                                                            displayDevicesItem);
                                                      });

                                                      context.pushNamed(
                                                        'bluetoothsenddata',
                                                        queryParameters: {
                                                          'deviceName':
                                                              serializeParam(
                                                            displayDevicesItem
                                                                .name,
                                                            ParamType.String,
                                                          ),
                                                          'deviceID':
                                                              serializeParam(
                                                            displayDevicesItem
                                                                .id,
                                                            ParamType.String,
                                                          ),
                                                          'deviceRssi':
                                                              serializeParam(
                                                            displayDevicesItem
                                                                .rssi,
                                                            ParamType.int,
                                                          ),
                                                          'hasWriteCharacteristic':
                                                              serializeParam(
                                                            _model.hasWrite,
                                                            ParamType.bool,
                                                          ),
                                                        }.withoutNulls,
                                                      );

                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            const Color(0xFFF0D4D4),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    12.0,
                                                                    16.0,
                                                                    12.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        displayDevicesItem
                                                                            .name,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    StrengthIndicatorWidget(
                                                                      key: Key(
                                                                          'Key89u_${displayDevicesIndex}_of_${displayDevices.length}'),
                                                                      rssi: displayDevicesItem
                                                                          .rssi,
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        () {
                                                                          if (displayDevicesItem.rssi >=
                                                                              -67) {
                                                                            return FlutterFlowTheme.of(context).success;
                                                                          } else if (displayDevicesItem.rssi >=
                                                                              -90) {
                                                                            return FlutterFlowTheme.of(context).warning;
                                                                          } else {
                                                                            return FlutterFlowTheme.of(context).error;
                                                                          }
                                                                        }(),
                                                                        FlutterFlowTheme.of(context)
                                                                            .success,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    displayDevicesItem
                                                                        .id,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Plus Jakarta Sans',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .keyboard_arrow_right_sharp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  if (!_model.isBluetoothEnabled)
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Turn on bluetooth to connect with any device',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
