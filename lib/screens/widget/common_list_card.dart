import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class ListCard extends StatefulWidget {
  final String data;

  const ListCard({super.key, required this.data});

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  bool open = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          open != open;
        });
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: AppColors().secondaryBgColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: AppColors().dividerColor,
                  blurRadius: 10,
                  spreadRadius: 5)
            ]),
        child: Row(
          children: [
            ///Image
            Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: AppColors().iconBlueBg,
                    borderRadius: BorderRadius.circular(20)),
                child: Icon(Icons.credit_card, color: AppColors().mainColor)),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                widget.data,
                style: TextStyle(fontSize: 16, color: AppColors().fontColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
