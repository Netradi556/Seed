// Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Riverpod
import 'package:seed_app/provider/profile_provider.dart';

// PageWidget

// const

class RegistrationPage2 extends ConsumerWidget {
  const RegistrationPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomSpace = MediaQuery.of(context).viewInsets.bottom;
    final param = ref.watch(profileSexProvider.state);
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: double.infinity,
            height: 200,
            child: Align(
              child: Text('''
プロフィールを充実させていくほど
検索されやすくなります
証明書のアップロードでスコアがアップします'''),
            ),
          ),
          Container(
            width: double.infinity,
            height: 200,
            decoration: const BoxDecoration(),
            child: InkWell(
              child: Text(param.state),
            ),
          ),
        ],
      ),
    );
  }
}

class YearDateItemsWidget extends ConsumerWidget {
  const YearDateItemsWidget({
    Key? key,
    required this.boxWidth,
    required this.boxHeight,
  }) : super(key: key);

  final double boxWidth;
  final double boxHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final param = ref.watch(profileBirthdateProvider.state);
    return SizedBox(
      width: boxWidth,
      height: boxHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('生年月日'),
          IconButton(
            icon: const Icon(FontAwesomeIcons.calendarAlt),
            color: Colors.amber,
            onPressed: () async {
              final selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(DateTime.now().year),
                lastDate: DateTime(DateTime.now().year + 6),
                initialDatePickerMode: DatePickerMode.year,
              );

              if (selectedDate != null) {
                param.state = selectedDate.toString();
                // do something
              }
            },
          )
        ],
      ),
    );
  }
}
