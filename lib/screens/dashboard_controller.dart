import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/models/states/dashboard_state.dart';

import '../models/wallet_model.dart';

class DashboardNotifier extends StateNotifier<DashboardState> {
  DashboardNotifier() : super(DashboardState());

  Future<void> fetchData() async {
    try {
      state = state.copyWith(isLoading: true);
      Wallet data = Wallet(
          profileImage:
              "https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=764&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          userName: "Test",
          walletID: "520788888",
          accounts: Accounts(accountDetails: [
            AccountDetails(
                accNumber: "408-11111-11111-111111-111111",
                amountEUR: "18199.24",
                amountGBP: "38.67",
                defaultCard: true),
            AccountDetails(
                accNumber: "560-11111-11111-111111-111111",
                amountEUR: "190.24",
                amountGBP: "8.67",
                defaultCard: false),
          ]),
          card: Card(cards: [
            CardDetails(
              cardNumber: "54365436****6643",
              amountEUR: "*2300",
            )
          ]));
      state = state.copyWith(isLoading: false, wallet: data);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }
}

final dashboardProvider =
    StateNotifierProvider<DashboardNotifier, DashboardState>((ref) {
  final controller = DashboardNotifier();
  ref.onDispose(() {
    controller.dispose();
  });
  return controller;
});
