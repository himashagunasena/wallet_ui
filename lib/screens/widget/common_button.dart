import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class CommonButton extends StatefulWidget {
  final String name;
  final Function()? onClickCard;

  const CommonButton({super.key, required this.name, this.onClickCard});

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onClickCard!();
      },
      child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors().buttonColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              widget.name,
              style:
                  TextStyle(fontSize: 16, color: AppColors().secondaryBgColor),
            ),
          )),
    );
  }
}
