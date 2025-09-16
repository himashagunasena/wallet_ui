class Wallet {
  final String? walletID;
  final String? userName;
  final String? profileImage;
  final Accounts? accounts;
  final Card? card;

  Wallet(
      {this.walletID,
      this.userName,
      this.profileImage,
      this.accounts,
      this.card});
}

class Accounts {
  final List<AccountDetails>? accountDetails;
  final String? type;

  Accounts({this.accountDetails, this.type});
}

class AccountDetails {
  final String? accNumber;
  final String? amountEUR;
  final String? amountGBP;
  final bool? defaultCard;

  AccountDetails(
      {this.accNumber, this.amountEUR, this.amountGBP, this.defaultCard});
}

class Card {
  final List<CardDetails>? cards;

  Card({this.cards});
}

class CardDetails {
  final String? cardNumber;
  final String? amountEUR;
  final String? expireDate;
  final String? type;

  CardDetails({this.cardNumber, this.amountEUR, this.expireDate, this.type});
}
