import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:seed_app/ui/user_menu_to_pages/footprint.dart';
import 'package:seed_app/ui/user_menu_to_pages/help.dart';
import 'package:seed_app/ui/user_menu_to_pages/license.dart';
import 'package:seed_app/ui/user_menu_to_pages/setting.dart';
import 'package:seed_app/ui/user_menu_to_pages/yourfav.dart';
import 'package:seed_app/ui/user_menu_to_pages/yourlike.dart';

import '../user_menu_to_pages/notification/notification.dart';

class MyPageMenu extends StatelessWidget {
  MyPageMenu();

  // 1行目
  final String footprintLogoPath = 'assets/icon/footprints.png';
  final String thumbsLogoPath = 'assets/icon/thumbs-up.png';
  final String likeLogoPath = 'assets/icon/star.png';

  // 2行目
  final String notificationLogoPath = 'assets/icon/notification.png';
  final String licenseLogoPath = 'assets/icon/license.png';
  final String settingLogoPath = 'assets/icon/setting.png';

  // 3行目
  final String helpLogoPath = 'assets/icon/help.png';

  @override
  Widget build(BuildContext context) {
    final List<String> row1_ImagePath = [
      footprintLogoPath,
      thumbsLogoPath,
      likeLogoPath,
    ];
    final List<Widget> row1_nextPageWidget = [
      FootprintPagesWidget(),
      YourlikePageWidget(),
      YourfavPageWidget(),
    ];

    final List<String> row2_ImagePath = [
      notificationLogoPath,
      licenseLogoPath,
      settingLogoPath,
    ];
    final List<Widget> row2_nextPageWidget = [
      NotificationPageWidget(),
      LicensePageWidget(),
      SettingPageWidget(),
    ];

    return Align(
      alignment: const AlignmentDirectional(0.05, -0.1),
      child: SizedBox(
        width: double.infinity,
        height: 330,
        child: Align(
          alignment: const AlignmentDirectional(0, 0.05),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 1列目：足跡、自分からのいいね、お気に入り
                menuRowWidget(
                  iconImagePath: row1_ImagePath,
                  nextPageWidget: row1_nextPageWidget,
                ),
                // 2列目：お知らせ、会員ステータス、設定
                menuRowWidget(
                  iconImagePath: row2_ImagePath,
                  nextPageWidget: row2_nextPageWidget,
                ),
                // 3列目：ヘルプ
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    menuIconWidget(
                      iconImagePath: helpLogoPath,
                      nextPageWidget: HelpPageWidget(),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Color(0x97000000),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Color(0x97000000),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class menuRowWidget extends StatelessWidget {
  menuRowWidget(
      {Key? key, required this.iconImagePath, required this.nextPageWidget})
      : menuItems = {
          'LeftIconPath': iconImagePath[0],
          'LeftIconWidget': nextPageWidget[0],
          'CenterIconPath': iconImagePath[1],
          'CenterIconWidget': nextPageWidget[1],
          'RightIconPath': iconImagePath[2],
          'RightIconWidget': nextPageWidget[2],
        },
        super(key: key);

  final List<String> iconImagePath;
  final List<Widget> nextPageWidget;
  final Map<String, dynamic> menuItems;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Align(
        alignment: const AlignmentDirectional(0, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 左アイコン
            menuIconWidget(
              iconImagePath: menuItems['LeftIconPath'],
              nextPageWidget: menuItems['LeftIconWidget'],
            ),
            // 中央アイコン
            menuIconWidget(
              iconImagePath: menuItems['CenterIconPath'],
              nextPageWidget: menuItems['CenterIconWidget'],
            ),
            // 右アイコン
            menuIconWidget(
              iconImagePath: menuItems['RightIconPath'],
              nextPageWidget: menuItems['RightIconWidget'],
            ),
          ],
        ),
      ),
    );
  }
}

class menuIconWidget extends StatelessWidget {
  const menuIconWidget({
    required this.iconImagePath,
    required this.nextPageWidget,
  });

  final String iconImagePath;
  final Widget nextPageWidget;

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return nextPageWidget;
          },
        ),
      ),
      child: Container(
        width: 100,
        height: 100,
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Image(
          image: AssetImage(iconImagePath),
        ),
      ),
    );
  }
}
