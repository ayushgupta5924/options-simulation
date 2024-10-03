// import '/components/body_content_widget.dart';
// import '/flutter_flow/flutter_flow_animations.dart';
// import '/flutter_flow/flutter_flow_icon_button.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// import 'menu_page_model.dart';
// export 'menu_page_model.dart';

// class MenuPageWidget extends StatefulWidget {
//   const MenuPageWidget({super.key});

//   @override
//   State<MenuPageWidget> createState() => _MenuPageWidgetState();
// }

// class _MenuPageWidgetState extends State<MenuPageWidget>
//     with TickerProviderStateMixin {
//   late MenuPageModel _model;

//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   final animationsMap = {
//     'containerOnActionTriggerAnimation1': AnimationInfo(
//       trigger: AnimationTrigger.onActionTrigger,
//       applyInitialState: true,
//       effects: [
//         MoveEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 300.ms,
//           begin: Offset(0, 0),
//           end: Offset(0, 340),
//         ),
//       ],
//     ),
//     'containerOnPageLoadAnimation1': AnimationInfo(
//       trigger: AnimationTrigger.onPageLoad,
//       applyInitialState: true,
//       effects: [
//         MoveEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 0.ms,
//           begin: Offset(0, -340),
//           end: Offset(0, -340),
//         ),
//       ],
//     ),
//     'listViewOnPageLoadAnimation': AnimationInfo(
//       trigger: AnimationTrigger.onPageLoad,
//       effects: [
//         FadeEffect(
//           curve: Curves.easeInOut,
//           delay: 300.ms,
//           duration: 400.ms,
//           begin: 0,
//           end: 1,
//         ),
//       ],
//     ),
//     'containerOnPageLoadAnimation2': AnimationInfo(
//       trigger: AnimationTrigger.onPageLoad,
//       effects: [
//         VisibilityEffect(duration: 400.ms),
//         FadeEffect(
//           curve: Curves.easeInOut,
//           delay: 400.ms,
//           duration: 300.ms,
//           begin: 0,
//           end: 1,
//         ),
//         ScaleEffect(
//           curve: Curves.easeInOut,
//           delay: 400.ms,
//           duration: 300.ms,
//           begin: Offset(0.8, 0.8),
//           end: Offset(1, 1),
//         ),
//         MoveEffect(
//           curve: Curves.easeInOut,
//           delay: 400.ms,
//           duration: 300.ms,
//           begin: Offset(0, 20),
//           end: Offset(0, 0),
//         ),
//         TiltEffect(
//           curve: Curves.easeInOut,
//           delay: 400.ms,
//           duration: 300.ms,
//           begin: Offset(-2.793, 0),
//           end: Offset(0, 0),
//         ),
//       ],
//     ),
//     'iconOnPageLoadAnimation1': AnimationInfo(
//       trigger: AnimationTrigger.onPageLoad,
//       effects: [
//         VisibilityEffect(duration: 300.ms),
//         RotateEffect(
//           curve: Curves.easeInOut,
//           delay: 300.ms,
//           duration: 200.ms,
//           begin: 0,
//           end: 0.12,
//         ),
//       ],
//     ),
//     'containerOnPageLoadAnimation3': AnimationInfo(
//       trigger: AnimationTrigger.onPageLoad,
//       effects: [
//         VisibilityEffect(duration: 500.ms),
//         FadeEffect(
//           curve: Curves.easeInOut,
//           delay: 500.ms,
//           duration: 300.ms,
//           begin: 0,
//           end: 1,
//         ),
//         ScaleEffect(
//           curve: Curves.easeInOut,
//           delay: 500.ms,
//           duration: 300.ms,
//           begin: Offset(0.8, 0.8),
//           end: Offset(1, 1),
//         ),
//         MoveEffect(
//           curve: Curves.easeInOut,
//           delay: 500.ms,
//           duration: 300.ms,
//           begin: Offset(0, 20),
//           end: Offset(0, 0),
//         ),
//         TiltEffect(
//           curve: Curves.easeInOut,
//           delay: 500.ms,
//           duration: 300.ms,
//           begin: Offset(-2.793, 0),
//           end: Offset(0, 0),
//         ),
//       ],
//     ),
//     'iconOnPageLoadAnimation2': AnimationInfo(
//       trigger: AnimationTrigger.onPageLoad,
//       effects: [
//         VisibilityEffect(duration: 500.ms),
//         RotateEffect(
//           curve: Curves.easeInOut,
//           delay: 500.ms,
//           duration: 200.ms,
//           begin: 0,
//           end: 0.12,
//         ),
//       ],
//     ),
//     'containerOnPageLoadAnimation4': AnimationInfo(
//       trigger: AnimationTrigger.onPageLoad,
//       effects: [
//         VisibilityEffect(duration: 600.ms),
//         FadeEffect(
//           curve: Curves.easeInOut,
//           delay: 600.ms,
//           duration: 300.ms,
//           begin: 0,
//           end: 1,
//         ),
//         ScaleEffect(
//           curve: Curves.easeInOut,
//           delay: 600.ms,
//           duration: 300.ms,
//           begin: Offset(0.8, 0.8),
//           end: Offset(1, 1),
//         ),
//         MoveEffect(
//           curve: Curves.easeInOut,
//           delay: 600.ms,
//           duration: 300.ms,
//           begin: Offset(0, 20),
//           end: Offset(0, 0),
//         ),
//         TiltEffect(
//           curve: Curves.easeInOut,
//           delay: 600.ms,
//           duration: 300.ms,
//           begin: Offset(-2.793, 0),
//           end: Offset(0, 0),
//         ),
//       ],
//     ),
//     'iconOnPageLoadAnimation3': AnimationInfo(
//       trigger: AnimationTrigger.onPageLoad,
//       effects: [
//         RotateEffect(
//           curve: Curves.easeInOut,
//           delay: 500.ms,
//           duration: 200.ms,
//           begin: 0,
//           end: 0.12,
//         ),
//       ],
//     ),
//     'containerOnPageLoadAnimation5': AnimationInfo(
//       trigger: AnimationTrigger.onPageLoad,
//       applyInitialState: true,
//       effects: [
//         VisibilityEffect(duration: 700.ms),
//         FadeEffect(
//           curve: Curves.easeInOut,
//           delay: 700.ms,
//           duration: 300.ms,
//           begin: 0,
//           end: 1,
//         ),
//         ScaleEffect(
//           curve: Curves.bounceOut,
//           delay: 700.ms,
//           duration: 300.ms,
//           begin: Offset(0.8, 0.8),
//           end: Offset(1, 1),
//         ),
//       ],
//     ),
//     'containerOnActionTriggerAnimation2': AnimationInfo(
//       trigger: AnimationTrigger.onActionTrigger,
//       applyInitialState: true,
//       effects: [
//         ScaleEffect(
//           curve: Curves.bounceOut,
//           delay: 0.ms,
//           duration: 200.ms,
//           begin: Offset(0.8, 0.8),
//           end: Offset(1, 1),
//         ),
//       ],
//     ),
//     'containerOnPageLoadAnimation6': AnimationInfo(
//       trigger: AnimationTrigger.onPageLoad,
//       applyInitialState: true,
//       effects: [
//         VisibilityEffect(duration: 700.ms),
//         FadeEffect(
//           curve: Curves.easeInOut,
//           delay: 700.ms,
//           duration: 300.ms,
//           begin: 0,
//           end: 1,
//         ),
//         ScaleEffect(
//           curve: Curves.bounceOut,
//           delay: 700.ms,
//           duration: 300.ms,
//           begin: Offset(0.8, 0.8),
//           end: Offset(1, 1),
//         ),
//       ],
//     ),
//     'containerOnActionTriggerAnimation3': AnimationInfo(
//       trigger: AnimationTrigger.onActionTrigger,
//       applyInitialState: true,
//       effects: [
//         ScaleEffect(
//           curve: Curves.bounceOut,
//           delay: 0.ms,
//           duration: 200.ms,
//           begin: Offset(0.8, 0.8),
//           end: Offset(1, 1),
//         ),
//       ],
//     ),
//     'iconButtonOnActionTriggerAnimation1': AnimationInfo(
//       trigger: AnimationTrigger.onActionTrigger,
//       applyInitialState: true,
//       effects: [
//         RotateEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 300.ms,
//           begin: 1,
//           end: 0,
//         ),
//         ScaleEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 300.ms,
//           begin: Offset(1, 1),
//           end: Offset(0, 0),
//         ),
//       ],
//     ),
//     'iconButtonOnPageLoadAnimation1': AnimationInfo(
//       trigger: AnimationTrigger.onPageLoad,
//       applyInitialState: true,
//       effects: [
//         VisibilityEffect(duration: 1.ms),
//         RotateEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 300.ms,
//           begin: 0,
//           end: 1,
//         ),
//         ScaleEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 300.ms,
//           begin: Offset(0, 0),
//           end: Offset(1, 1),
//         ),
//       ],
//     ),
//     'iconButtonOnPageLoadAnimation2': AnimationInfo(
//       trigger: AnimationTrigger.onPageLoad,
//       applyInitialState: true,
//       effects: [
//         RotateEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 300.ms,
//           begin: 0,
//           end: 1,
//         ),
//         ScaleEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 300.ms,
//           begin: Offset(0, 0),
//           end: Offset(1, 1),
//         ),
//       ],
//     ),
//     'iconButtonOnActionTriggerAnimation2': AnimationInfo(
//       trigger: AnimationTrigger.onActionTrigger,
//       applyInitialState: true,
//       effects: [
//         RotateEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 300.ms,
//           begin: 1,
//           end: 0,
//         ),
//         ScaleEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 300.ms,
//           begin: Offset(1, 1),
//           end: Offset(0, 0),
//         ),
//       ],
//     ),
//   };

//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => MenuPageModel());

//     // On page load action.
//     SchedulerBinding.instance.addPostFrameCallback((_) async {
//       setState(() {
//         _model.showMenu = false;
//       });
//     });

//     setupAnimations(
//       animationsMap.values.where((anim) =>
//           anim.trigger == AnimationTrigger.onActionTrigger ||
//           !anim.applyInitialState),
//       this,
//     );
//   }

//   @override
//   void dispose() {
//     _model.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isiOS) {
//       SystemChrome.setSystemUIOverlayStyle(
//         SystemUiOverlayStyle(
//           statusBarBrightness: Theme.of(context).brightness,
//           systemStatusBarContrastEnforced: true,
//         ),
//       );
//     }

//     context.watch<FFAppState>();

//     return GestureDetector(
//       onTap: () => _model.unfocusNode.canRequestFocus
//           ? FocusScope.of(context).requestFocus(_model.unfocusNode)
//           : FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//         body: Stack(
//           children: [
//             wrapWithModel(
//               model: _model.bodyContentModel,
//               updateCallback: () => setState(() {}),
//               child: BodyContentWidget(),
//             ),
//             Column(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 AnimatedContainer(
//                   duration: Duration(milliseconds: 300),
//                   curve: Curves.easeInOut,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         blurRadius: 3,
//                         color: Color(0x33000000),
//                         offset: Offset(0, 1),
//                       )
//                     ],
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(0),
//                     child: BackdropFilter(
//                       filter: ImageFilter.blur(
//                         sigmaX: 6,
//                         sigmaY: 4,
//                       ),
//                       child: Container(
//                         width: double.infinity,
//                         height: 470,
//                         decoration: BoxDecoration(
//                           color: FlutterFlowTheme.of(context).overlay,
//                           boxShadow: [
//                             BoxShadow(
//                               blurRadius: 7,
//                               color: Color(0x2E000000),
//                               offset: Offset(0, 4),
//                             )
//                           ],
//                           borderRadius: BorderRadius.circular(0),
//                         ),
//                         child: Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
//                           child: Column(
//                             mainAxisSize: MainAxisSize.max,
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               if (_model.showMenu == true)
//                                 ListView(
//                                   padding: EdgeInsets.zero,
//                                   shrinkWrap: true,
//                                   scrollDirection: Axis.vertical,
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           16, 12, 16, 0),
//                                       child: Container(
//                                         width: double.infinity,
//                                         height: 70,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(12),
//                                         ),
//                                         child: Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   16, 8, 16, 8),
//                                           child: Row(
//                                             mainAxisSize: MainAxisSize.max,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               Text(
//                                                 'My Blog',
//                                                 style:
//                                                     FlutterFlowTheme.of(context)
//                                                         .headlineSmall,
//                                               ),
//                                               Padding(
//                                                 padding: EdgeInsetsDirectional
//                                                     .fromSTEB(12, 0, 0, 0),
//                                                 child: Icon(
//                                                   Icons.arrow_upward_rounded,
//                                                   color: FlutterFlowTheme.of(
//                                                           context)
//                                                       .primaryText,
//                                                   size: 24,
//                                                 ).animateOnPageLoad(animationsMap[
//                                                     'iconOnPageLoadAnimation1']!),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ).animateOnPageLoad(animationsMap[
//                                           'containerOnPageLoadAnimation2']!),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           16, 12, 16, 0),
//                                       child: Container(
//                                         width: double.infinity,
//                                         height: 70,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(12),
//                                         ),
//                                         child: Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   16, 8, 16, 8),
//                                           child: Row(
//                                             mainAxisSize: MainAxisSize.max,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               Text(
//                                                 'Portfolio',
//                                                 style:
//                                                     FlutterFlowTheme.of(context)
//                                                         .headlineSmall,
//                                               ),
//                                               Padding(
//                                                 padding: EdgeInsetsDirectional
//                                                     .fromSTEB(12, 0, 0, 0),
//                                                 child: Icon(
//                                                   Icons.arrow_upward_rounded,
//                                                   color: FlutterFlowTheme.of(
//                                                           context)
//                                                       .primaryText,
//                                                   size: 24,
//                                                 ).animateOnPageLoad(animationsMap[
//                                                     'iconOnPageLoadAnimation2']!),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ).animateOnPageLoad(animationsMap[
//                                           'containerOnPageLoadAnimation3']!),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           16, 12, 16, 0),
//                                       child: Container(
//                                         width: double.infinity,
//                                         height: 70,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(12),
//                                         ),
//                                         child: Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   16, 8, 16, 8),
//                                           child: Row(
//                                             mainAxisSize: MainAxisSize.max,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               Text(
//                                                 'About',
//                                                 style:
//                                                     FlutterFlowTheme.of(context)
//                                                         .headlineSmall,
//                                               ),
//                                               Padding(
//                                                 padding: EdgeInsetsDirectional
//                                                     .fromSTEB(12, 0, 0, 0),
//                                                 child: Icon(
//                                                   Icons.arrow_upward_rounded,
//                                                   color: FlutterFlowTheme.of(
//                                                           context)
//                                                       .primaryText,
//                                                   size: 24,
//                                                 ).animateOnPageLoad(animationsMap[
//                                                     'iconOnPageLoadAnimation3']!),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ).animateOnPageLoad(animationsMap[
//                                           'containerOnPageLoadAnimation4']!),
//                                     ),
//                                     if (Theme.of(context).brightness ==
//                                         Brightness.light)
//                                       Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             16, 12, 16, 0),
//                                         child: InkWell(
//                                           splashColor: Colors.transparent,
//                                           focusColor: Colors.transparent,
//                                           hoverColor: Colors.transparent,
//                                           highlightColor: Colors.transparent,
//                                           onTap: () async {
//                                             setDarkModeSetting(
//                                                 context, ThemeMode.dark);
//                                             if (animationsMap[
//                                                     'containerOnActionTriggerAnimation2'] !=
//                                                 null) {
//                                               animationsMap[
//                                                       'containerOnActionTriggerAnimation2']!
//                                                   .controller
//                                                   .forward(from: 0.0);
//                                             }
//                                           },
//                                           child: Container(
//                                             width: double.infinity,
//                                             height: 70,
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(12),
//                                             ),
//                                             child: Padding(
//                                               padding: EdgeInsetsDirectional
//                                                   .fromSTEB(16, 8, 16, 8),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.center,
//                                                 children: [
//                                                   Text(
//                                                     'Dark Mode',
//                                                     style: FlutterFlowTheme.of(
//                                                             context)
//                                                         .headlineSmall,
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                         EdgeInsetsDirectional
//                                                             .fromSTEB(
//                                                                 12, 0, 0, 0),
//                                                     child: Icon(
//                                                       Icons
//                                                           .nights_stay_outlined,
//                                                       color:
//                                                           FlutterFlowTheme.of(
//                                                                   context)
//                                                               .primaryText,
//                                                       size: 24,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         )
//                                             .animateOnPageLoad(animationsMap[
//                                                 'containerOnPageLoadAnimation5']!)
//                                             .animateOnActionTrigger(
//                                               animationsMap[
//                                                   'containerOnActionTriggerAnimation2']!,
//                                             ),
//                                       ),
//                                     if (Theme.of(context).brightness ==
//                                         Brightness.dark)
//                                       Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             16, 12, 16, 0),
//                                         child: InkWell(
//                                           splashColor: Colors.transparent,
//                                           focusColor: Colors.transparent,
//                                           hoverColor: Colors.transparent,
//                                           highlightColor: Colors.transparent,
//                                           onTap: () async {
//                                             setDarkModeSetting(
//                                                 context, ThemeMode.light);
//                                             if (animationsMap[
//                                                     'containerOnActionTriggerAnimation3'] !=
//                                                 null) {
//                                               animationsMap[
//                                                       'containerOnActionTriggerAnimation3']!
//                                                   .controller
//                                                   .forward(from: 0.0);
//                                             }
//                                           },
//                                           child: Container(
//                                             width: double.infinity,
//                                             height: 70,
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(12),
//                                             ),
//                                             child: Padding(
//                                               padding: EdgeInsetsDirectional
//                                                   .fromSTEB(16, 8, 16, 8),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.center,
//                                                 children: [
//                                                   Text(
//                                                     'Light Mode',
//                                                     style: FlutterFlowTheme.of(
//                                                             context)
//                                                         .headlineSmall,
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                         EdgeInsetsDirectional
//                                                             .fromSTEB(
//                                                                 12, 0, 0, 0),
//                                                     child: Icon(
//                                                       Icons.wb_sunny_rounded,
//                                                       color:
//                                                           FlutterFlowTheme.of(
//                                                                   context)
//                                                               .primaryText,
//                                                       size: 24,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         )
//                                             .animateOnPageLoad(animationsMap[
//                                                 'containerOnPageLoadAnimation6']!)
//                                             .animateOnActionTrigger(
//                                               animationsMap[
//                                                   'containerOnActionTriggerAnimation3']!,
//                                             ),
//                                       ),
//                                   ],
//                                 ).animateOnPageLoad(animationsMap[
//                                     'listViewOnPageLoadAnimation']!),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//                     .animateOnPageLoad(
//                         animationsMap['containerOnPageLoadAnimation1']!)
//                     .animateOnActionTrigger(
//                       animationsMap['containerOnActionTriggerAnimation1']!,
//                     ),
//               ],
//             ),
//             Container(
//               width: double.infinity,
//               height: 130,
//               decoration: BoxDecoration(),
//               child: Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(12, 50, 12, 8),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.max,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
//                       child: Container(
//                         width: 44,
//                         height: 44,
//                         decoration: BoxDecoration(
//                           color: FlutterFlowTheme.of(context).lineColor,
//                           shape: BoxShape.circle,
//                         ),
//                         child: Padding(
//                           padding: EdgeInsets.all(2),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(44),
//                             child: Image.network(
//                               'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
//                               width: 44,
//                               height: 44,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Raquel S.',
//                             style: FlutterFlowTheme.of(context).headlineMedium,
//                           ),
//                           Text(
//                             'Your transactions are below.',
//                             style: FlutterFlowTheme.of(context).titleSmall,
//                           ),
//                         ],
//                       ),
//                     ),
//                     if (_model.showMenu == false)
//                       FlutterFlowIconButton(
//                         borderColor: Colors.transparent,
//                         borderRadius: 30,
//                         borderWidth: 1,
//                         buttonSize: 44,
//                         icon: Icon(
//                           Icons.menu_rounded,
//                           color: FlutterFlowTheme.of(context).primaryText,
//                           size: 24,
//                         ),
//                         onPressed: () async {
//                           // showMenu
//                           if (animationsMap[
//                                   'containerOnActionTriggerAnimation1'] !=
//                               null) {
//                             animationsMap['containerOnActionTriggerAnimation1']!
//                                 .controller
//                                 .forward(from: 0.0);
//                           }
//                           // hideMenuButton
//                           if (animationsMap[
//                                   'iconButtonOnActionTriggerAnimation1'] !=
//                               null) {
//                             await animationsMap[
//                                     'iconButtonOnActionTriggerAnimation1']!
//                                 .controller
//                                 .forward(from: 0.0);
//                           }
//                           // changeStateTrue
//                           setState(() {
//                             _model.showMenu = true;
//                           });
//                           // resetCloseButton
//                           if (animationsMap[
//                                   'iconButtonOnActionTriggerAnimation2'] !=
//                               null) {
//                             animationsMap[
//                                     'iconButtonOnActionTriggerAnimation2']!
//                                 .controller
//                                 .reset();
//                           }
//                         },
//                       )
//                           .animateOnPageLoad(
//                               animationsMap['iconButtonOnPageLoadAnimation1']!)
//                           .animateOnActionTrigger(
//                             animationsMap[
//                                 'iconButtonOnActionTriggerAnimation1']!,
//                           ),
//                     if (_model.showMenu == true)
//                       FlutterFlowIconButton(
//                         borderColor: Colors.transparent,
//                         borderRadius: 30,
//                         borderWidth: 1,
//                         buttonSize: 44,
//                         icon: Icon(
//                           Icons.close_rounded,
//                           color: FlutterFlowTheme.of(context).primaryText,
//                           size: 24,
//                         ),
//                         onPressed: () async {
//                           // hideMenu
//                           if (animationsMap[
//                                   'containerOnActionTriggerAnimation1'] !=
//                               null) {
//                             animationsMap['containerOnActionTriggerAnimation1']!
//                                 .controller
//                                 .reverse();
//                           }
//                           // hideCloseButton
//                           if (animationsMap[
//                                   'iconButtonOnActionTriggerAnimation2'] !=
//                               null) {
//                             animationsMap[
//                                     'iconButtonOnActionTriggerAnimation2']!
//                                 .controller
//                                 .reverse();
//                           }
//                           // changeSTateFalse
//                           setState(() {
//                             _model.showMenu = false;
//                           });
//                           // resetCloseButton
//                           if (animationsMap[
//                                   'iconButtonOnActionTriggerAnimation1'] !=
//                               null) {
//                             await animationsMap[
//                                     'iconButtonOnActionTriggerAnimation1']!
//                                 .controller
//                                 .reverse();
//                           }
//                         },
//                       )
//                           .animateOnPageLoad(
//                               animationsMap['iconButtonOnPageLoadAnimation2']!)
//                           .animateOnActionTrigger(
//                             animationsMap[
//                                 'iconButtonOnActionTriggerAnimation2']!,
//                           ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }