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
        const Padding(
          padding: EdgeInsets.only(left: 80),
          child: Divider(),
        ),
      ],
    );
  }
}
