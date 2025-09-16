import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class ListCard extends StatefulWidget {
  final String data;
  final Function()? onClickCard;

  const ListCard({super.key, required this.data, this.onClickCard});

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onClickCard!();
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: AppColors().secondaryBgColor,
            borderRadius: BorderRadius.circular(16),
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
                    borderRadius: BorderRadius.circular(16)),
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
