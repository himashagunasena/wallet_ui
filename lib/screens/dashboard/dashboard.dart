import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/screens/dashboard/dashboard_controller.dart';
import 'package:task/screens/widget/common_button.dart';
import 'package:task/screens/widget/common_list_card.dart';
import 'package:task/screens/widget/expanded_list.dart';
import 'package:task/utils/app_colors.dart';

import '../card/card_screen.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dashboardProvider.notifier).fetchData();
    });
    super.initState();
  }

  final PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(dashboardProvider);

    return Scaffold(
      body: SafeArea(
        top: false,
        child: state.isLoading ?? false
            ? Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  Container(
                    color: AppColors().mainColor,
                    height: MediaQuery.of(context).size.height,
                    child: SafeArea(
                      top: true,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              state.wallet!.profileImage!),
                                          fit: BoxFit.cover)),
                                ),
                              ],
                            ),
                            Container(
                              height: 150,
                              padding: EdgeInsets.only(left: 24),
                              child: PageView.builder(
                                padEnds: false,
                                itemCount: ref
                                    .watch(dashboardProvider.notifier)
                                    .amountList()
                                    .length,
                                controller: _pageController,
                                itemBuilder: (BuildContext context, int index) {
                                  List list = ref
                                      .watch(dashboardProvider.notifier)
                                      .amountList();
                                  return Align(
                                    alignment: Alignment.topLeft,
                                    child: amountSwipe(list[index].amount,
                                        list[index].currency, list[index].mark),
                                  );
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: CommonButton(name: "Add Money")),
                                SizedBox(width: 8),
                                Expanded(
                                    flex: 1,
                                    child: CommonButton(name: "Exchange"))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.8,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: AppColors().bgColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: Text(
                                  "Accounts",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: AppColors().fontColor,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              state.wallet?.accounts?.accountDetails == null
                                  ? SizedBox.shrink()
                                  : ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: state.wallet?.accounts
                                          ?.accountDetails?.length,
                                      itemBuilder: (context, index) {
                                        var data = state
                                            .wallet?.accounts?.accountDetails;
                                        return ExpandedList(
                                          data: data?[index].accNumber ?? "--",
                                          list: data![index],
                                        );
                                      },
                                    ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: Text(
                                  "Cards",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: AppColors().fontColor,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: state.wallet?.card?.cards?.length,
                                itemBuilder: (context, index) {
                                  var data = state.wallet?.card?.cards;
                                  return ListCard(
                                      onClickCard: () {
                                        setState(() {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CardScreen(
                                                        cardDetails:
                                                            data[index],
                                                      )));
                                        });
                                      },
                                      data:
                                          "EUR ${data![index].amountEUR ?? "--"}");
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget amountSwipe(String amount, String currencyType, String mark) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mark,
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors().secondaryBgColor,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                amount,
                style: TextStyle(
                    fontSize: 48,
                    color: AppColors().secondaryBgColor,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Text(
            currencyType,
            style: TextStyle(
                fontSize: 16,
                color: AppColors().secondaryBgColor,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
