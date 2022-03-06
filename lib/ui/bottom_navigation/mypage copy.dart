import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:seed_app/ui/user_menu_to_pages/user_menu_importer.dart';

/*
  Todo
  ・プロフィール画像はCircleAvatar Widgetを利用したほうがよさそう
  ・アイコンをボタンにするときはIconButton Widgetを利用したほうがよさそう
  ・Widgetの切り出し
  ・Riverpodの導入
  ・アイコンの設定
  ・
*/

String profileImagePath = 'assets/images/logo.jpg';
String footprintLogoPath = 'assets/icon/footprints.png';
String thumbsLogoPath = 'assets/icon/thumbs-up.png';
String likeLogoPath = 'assets/icon/star.png';
String notificationLogoPath = 'assets/icon/notification.png';
String licenseLogoPath = 'assets/icon/license.png';
String settingLogoPath = 'assets/icon/setting.png';
String helpLogoPath = 'assets/icon/help.png';

class MypagePageWidget extends ConsumerWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // プロフィールメニュー
            Container(
              width: double.infinity,
              height: 150,
              decoration: const BoxDecoration(
                color: Color(0x7AEBC24E),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-0.8, 0),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEEEEE),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(profileImagePath),
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.3, -0.4),
                    child: Text(
                      'Handle Name',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.05, 0),
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return UserProfilePageWidget();
                          },
                        ),
                      ),
                      child: Text(
                        'edit profile',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF646CF2),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.55, 0),
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return UserProfilePageWidget();
                          },
                        ),
                      ),
                      child: Text(
                        'view profile',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF646CF2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // 告知欄
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFFFC8585),
              ),
              child: Text(
                '告知欄\n',
                style: FlutterFlowTheme.bodyText1,
              ),
            ),
            // メニュー
            Align(
              alignment: const AlignmentDirectional(0.05, -0.1),
              child: Container(
                width: double.infinity,
                height: 330,
                decoration: const BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0, 0.05),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // 1列目：足跡、自分からのいいね、お気に入り
                        Container(
                          width: double.infinity,
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Color(0xFFEEEEEE),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // 足跡
                                InkWell(
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return FootprintPagesWidget();
                                      },
                                    ),
                                  ),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 20, 20, 20),
                                    child: Image(
                                      image: AssetImage(footprintLogoPath),
                                    ),
                                  ),
                                ),
                                // 自分からのいいね
                                InkWell(
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return YourlikePageWidget();
                                      },
                                    ),
                                  ),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 20, 20, 20),
                                    child: Image(
                                      image: AssetImage(thumbsLogoPath),
                                    ),
                                  ),
                                ),
                                // お気に入り
                                InkWell(
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return YourfavPageWidget();
                                      },
                                    ),
                                  ),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 20, 20, 20),
                                    child: Image(
                                      image: AssetImage(likeLogoPath),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // 2列目：お知らせ、会員ステータス、設定
                        Container(
                          width: double.infinity,
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Color(0xFFEEEEEE),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // お知らせ
                                InkWell(
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return NotificationPageWidget();
                                      },
                                    ),
                                  ),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 20, 20, 20),
                                    child: Image(
                                      image: AssetImage(notificationLogoPath),
                                    ),
                                  ),
                                ),
                                // 会員ステータス
                                InkWell(
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return LicensePageWidget();
                                      },
                                    ),
                                  ),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 20, 20, 20),
                                    child: Image(
                                      image: AssetImage(licenseLogoPath),
                                    ),
                                  ),
                                ),
                                // 設定
                                InkWell(
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return SettingPageWidget();
                                      },
                                    ),
                                  ),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 20, 20, 20),
                                    child: Image(
                                      image: AssetImage(settingLogoPath),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // 3列目：ヘルプ
                        Container(
                          width: double.infinity,
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Color(0xFFEEEEEE),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return HelpPageWidget();
                                      },
                                    ),
                                  ),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 20, 20, 20),
                                    child: Image(
                                      image: AssetImage(helpLogoPath),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
