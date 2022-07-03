import 'package:flutter/material.dart';
import 'package:seed_app/test_page.dart';
import 'package:seed_app/ui/user_menu_to_pages/other_pages/footprint.dart';
import 'package:seed_app/ui/user_menu_to_pages/other_pages/help.dart';
import 'package:seed_app/ui/user_menu_to_pages/other_pages/license.dart';
import 'package:seed_app/ui/user_menu_to_pages/other_pages/setting.dart';
import 'package:seed_app/ui/user_menu_to_pages/other_pages/yourfav.dart';
import 'package:seed_app/ui/user_menu_to_pages/other_pages/yourlike.dart';

import '../user_menu_to_pages/notification/notification.dart';

class MyPageMenu extends StatelessWidget {
  const MyPageMenu({Key? key}) : super(key: key);

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
    final List<String> firstRowImagePath = [
      footprintLogoPath,
      thumbsLogoPath,
      likeLogoPath,
    ];
    final List<Widget> firstRowNextPageWidget = [
      FootprintPagesWidget(),
      const YourlikePageWidget(),
      const YourfavPageWidget(),
    ];

    final List<String> secondRowImagePath = [
      notificationLogoPath,
      licenseLogoPath,
      settingLogoPath,
    ];
    final List<Widget> secondRowNextPageWidget = [
      NotificationPageWidget(),
      const LicensePageWidget(),
      const SettingPageWidget(),
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
                MenuRowWidget(
                  iconImagePath: firstRowImagePath,
                  nextPageWidget: firstRowNextPageWidget,
                ),
                // 2列目：お知らせ、会員ステータス、設定
                MenuRowWidget(
                  iconImagePath: secondRowImagePath,
                  nextPageWidget: secondRowNextPageWidget,
                ),
                // 3列目：ヘルプ
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MenuIconWidget(
                      iconImagePath: helpLogoPath,
                      nextPageWidget: const HelpPageWidget(),
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
                        color: Color.fromARGB(150, 186, 66, 66),
                      ),
                      child: InkWell(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return TestPage3();
                            },
                          ),
                        ),
                        child: const Icon(Icons.auto_graph),
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

class MenuRowWidget extends StatelessWidget {
  MenuRowWidget(
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
            MenuIconWidget(
              iconImagePath: menuItems['LeftIconPath'],
              nextPageWidget: menuItems['LeftIconWidget'],
            ),
            // 中央アイコン
            MenuIconWidget(
              iconImagePath: menuItems['CenterIconPath'],
              nextPageWidget: menuItems['CenterIconWidget'],
            ),
            // 右アイコン
            MenuIconWidget(
              iconImagePath: menuItems['RightIconPath'],
              nextPageWidget: menuItems['RightIconWidget'],
            ),
          ],
        ),
      ),
    );
  }
}

class MenuIconWidget extends StatelessWidget {
  const MenuIconWidget({
    Key? key,
    required this.iconImagePath,
    required this.nextPageWidget,
  }) : super(key: key);

  final String iconImagePath;
  final Widget nextPageWidget;

  @override
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
