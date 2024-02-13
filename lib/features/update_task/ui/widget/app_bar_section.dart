import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            "Update Task",
            style: TextStyle(
              fontSize: 33.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}
