import 'package:flutter/material.dart';

import '../../../../core/helper/spacing.dart';

class TitleOfButtonSheet extends StatelessWidget {
  const TitleOfButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(50),
        const Center(
          child: Text(
            'New Task Todo',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        const Divider(
          height: 25,
          thickness: .9,
          color: Colors.grey,
        ),
        const Text(
          "What are you planing 😇 ?",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 19,
          ),
        ),
        verticalSpace(18),
      ],
    );
  }
}
