import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/spacing.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(60.h),
        const Text(
          "My Tasks",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        verticalSpace(10.h),
        const Padding(
          padding: EdgeInsets.only(left: 80),
          child: Divider(),
        ),
      ],
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       verticalSpace(40),
  //       Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
  //         child: const Text(
  //           "TO Do",
  //           style: TextStyle(
  //             fontSize: 40,
  //             fontWeight: FontWeight.w700,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
