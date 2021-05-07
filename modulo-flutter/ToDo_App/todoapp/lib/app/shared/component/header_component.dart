import 'package:flutter/material.dart';

class HeaderComponent extends StatelessWidget {
  final ThemeData themeData;

  const HeaderComponent({this.themeData});

  @override
  PreferredSize build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: Container(
        color: Colors.red,
      ),
    );

    // Container(
    //   padding: EdgeInsets.all(8),
    //   height: MediaQuery.of(context).viewPadding.top + 52,
    //   color: themeData.primaryColor,
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.end,
    //     children: [
    //       Icon(Icons.menu, color: Colors.white),
    //       Expanded(
    //         child: Padding(
    //           padding: const EdgeInsets.only(left: 12),
    //           child: Text(
    //             'Atividades da Semana',
    //             style: TextStyle(
    //               fontSize: 28,
    //               color: Colors.white,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
