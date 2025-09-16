class Formatter {
  String divideCardNumber(String cardNumber) {
    List<String> list = [];

    for (int i = 0; i < cardNumber.length; i += 4) {
      int end = (i + 4 < cardNumber.length) ? i + 4 : cardNumber.length;
      list.add(cardNumber.substring(i, end));
    }

    return list.join(" ");
  }
}
