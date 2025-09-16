import 'package:flutter/material.dart';
import '../../models/wallet_model.dart';
import '../../utils/app_colors.dart';

class ExpandedList extends StatefulWidget {
  final String data;
  final AccountDetails list;

  const ExpandedList({
    super.key,
    required this.data,
    required this.list,
  });

  @override
  State<ExpandedList> createState() => _ExpandedListState();
}

class _ExpandedListState extends State<ExpandedList> {
  bool open = false;
  double radiusIcon = 16;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            open = !open;
          });
        },
        child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors().secondaryBgColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: AppColors().dividerColor,
                      blurRadius: 10,
                      spreadRadius: 5)
                ]),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors().iconBlueBg,
                      borderRadius: BorderRadius.circular(radiusIcon),
                    ),
                    child: Icon(Icons.account_balance_wallet_outlined,
                        color: AppColors().mainColor),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      widget.data,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors().fontColor,
                      ),
                    ),
                  ),
                  Icon(
                    open
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                  ),
                ],
              ),
              !open
                  ? SizedBox.shrink()
                  : Column(children: [
                      SizedBox(height: 24),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors().iconBlueBg,
                              borderRadius: BorderRadius.circular(radiusIcon),
                            ),
                            child: Icon(Icons.attach_money,
                                color: AppColors().mainColor),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              "${widget.list.amountEUR ?? '0.00'} EUR",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors().fontColor,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Divider(
                          height: 0,
                          color: AppColors().dividerColor,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors().iconBlueBg,
                              borderRadius: BorderRadius.circular(radiusIcon),
                            ),
                            child: Icon(Icons.attach_money,
                                color: AppColors().mainColor),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              "${widget.list.amountGBP ?? '0.00'} GBP",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors().fontColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
            ])));
  }
}
