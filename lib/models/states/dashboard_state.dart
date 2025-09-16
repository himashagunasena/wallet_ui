import 'package:task/models/wallet_model.dart';

class DashboardState {
  final bool? isLoading;
  final Wallet? wallet;

  DashboardState({this.isLoading = true, this.wallet});

  DashboardState copyWith({bool? isLoading, Wallet? wallet}) {
    return DashboardState(
        isLoading: isLoading ?? this.isLoading, wallet: wallet ?? this.wallet);
  }
}
