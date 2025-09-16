import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/models/wallet_model.dart';
import 'package:task/screens/dashboard_controller.dart';
import 'package:task/screens/widget/common_list_card.dart';
import 'package:task/screens/widget/expanded_list.dart';
import 'package:task/utils/app_colors.dart';

import '../api/api_calls.dart';

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
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.5,
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
}
