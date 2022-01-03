import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserTopWidget extends ConsumerWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromARGB(255, 167, 86, 86),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(),
                    child: Align(
                      alignment: AlignmentDirectional(1, -0.1),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 10, 0),
                        child: Container(
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Color(0xFFFEE9AC),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                                child: Text(
                                  '絞り込み',
                                  style: FlutterFlowTheme.bodyText1,
                                ),
                              ),
                              Icon(
                                Icons.search,
                                color: Color(0xFFFFDA6F),
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.1, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 9, 0, 5),
                      child: Container(
                        width: double.infinity,
                        height: 35,
                        decoration: BoxDecoration(),
                        child: Align(
                          alignment: AlignmentDirectional(-0.05, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: ListView(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Container(
                                    width: 100,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFEE9AC),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Text(
                                        '地域が一緒',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.bodyText1,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Container(
                                      width: 100,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFEE9AC),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Text(
                                          '年齢が近い',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.bodyText1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Container(
                                      width: 100,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFEE9AC),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Text(
                                          '共通の趣味',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.bodyText1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Container(
                                      width: 100,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFEE9AC),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Text(
                                          '地域が一緒',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.bodyText1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xB4FCBC00), Color(0xFFFDE283)],
                  stops: [0, 1],
                  begin: AlignmentDirectional(0.34, -1),
                  end: AlignmentDirectional(-0.34, 1),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 7, 0, 0),
                    child: Text(
                      '似た条件のユーザー',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
                      child: GridView(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 0,
                          childAspectRatio: 1,
                        ),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F8F7),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.05, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
                      child: GridView(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 20,
                          childAspectRatio: 1,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                          ),
                        ],
                      ),
                    ),
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
