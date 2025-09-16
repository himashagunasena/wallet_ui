import 'package:flutter/material.dart';
import 'package:task/utils/formatter.dart';

import '../../models/wallet_model.dart';
import '../../utils/app_colors.dart';
import '../widget/common_list_card.dart';

class CardScreen extends StatefulWidget {
  final CardDetails cardDetails;

  const CardScreen({super.key, required this.cardDetails});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Card",
        )),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.density_medium_rounded),
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "\$",
                      style: TextStyle(
                          fontSize: 16,
                          color: AppColors().fontColor,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      widget.cardDetails.walletAmount ?? "0.00",
                      style: TextStyle(
                          fontSize: 48,
                          color: AppColors().fontColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                cardView()
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Expanded(
            child: Column(
              children: [
                TabBar(
                    controller: controller,
                    indicatorColor: AppColors().mainColor,
                    labelStyle: TextStyle(
                        color: AppColors().mainColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    dividerColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(
                          child: Text(
                        "Operations",
                      )),
                      Tab(
                        child: Text(
                          "History",
                        ),
                      )
                    ]),
                Expanded(
                  child: TabBarView(controller: controller, children: [
                    operation(),
                    Center(
                      child: Text(
                        "History",
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColors().mainColor,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget operation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24),
            ListCard(
              data: "Top up Card",
            ),
            SizedBox(height: 24),
            ListCard(
              data: "Payment",
            ),
            SizedBox(height: 24),
            ListCard(
              data: "Card Output",
            ),
            SizedBox(height: 16),
            ListCard(
              data: "Take all money to card",
            ),
            SizedBox(height: 24),
            ListCard(
              data: "Take all money to card",
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget cardView() {
    return Container(
      height: 200,
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors().mainColor,
          borderRadius: BorderRadius.circular(18)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.credit_card, color: AppColors().secondaryBgColor),
              SizedBox(height: 16),
              Text(
                Formatter()
                    .divideCardNumber(widget.cardDetails.cardNumber ?? "--"),
                style: TextStyle(
                    fontSize: 24,
                    color: AppColors().secondaryBgColor,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Expiry Date",
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColors().secondaryBgColor,
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    widget.cardDetails.expireDate ?? "--",
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColors().secondaryBgColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Image.asset(
                "assets/images/master.png",
                width: 50,
                height: 50,
              )
            ],
          )
        ],
      ),
    );
  }
}
