import 'package:math_expressions/math_expressions.dart';

import '../models/custom_models/cart_item.dart';
import 'lists.dart';
import 'values.dart';

// For each food details Screen
void checkExtras() {
  isExtraChecked = !isExtraChecked;
}

// bool alreadyInCart = false;
//                                   for (CartItem item in cartItems) {
//                                     if (item.food!.foodName ==
//                                         widget.foodCustomItem!.foodName) {
//                                       item.quantity += 1;
//                                       alreadyInCart = true;
//                                       break;
//                                     }
//                                   }
//
//                                   // If not, add it to the cart
//                                   if (!alreadyInCart) {
//                                     cartItems.add(CartItem(
//                                         food: widget.foodCustomItem,
//                                         quantity: 1));
//                                   }

int calculateTotalPrice(List<CartItem> cartItems) {
  int totalPrice = 0;
  for (CartItem cartItem in cartItems) {
    int totalEachFoodPrice =
        (cartItem.food!.foodQuantity) * (cartItem.food!.foodPrice);
    totalPrice += totalEachFoodPrice;
  }
  return totalPrice;
}

// For calculator logistics

class CalculatorHelpers {
  bool specialOperators(String x) {
    if (x == '÷' ||
        x == '×' ||
        x == '-' ||
        x == '+' ||
        x == '.' ||
        x == ')' ||
        x == '(') {
      return true;
    } else {
      return false;
    }
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('×', '*');
    finalQuestion = finalQuestion.replaceAll('÷', '/');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}

class DeliveryProcessHelpers {
  // To select one payment & unselect the rest
  void selectPaymentTypes(int currentPayment) {
    for (int i = 0; i < paymentTypes.length; i++) {
      paymentTypes[i].paymentIsSelected = false;
    }
    paymentTypes[currentPayment].paymentIsSelected = true;
  }

  // To unselect all payment types
  void unselectPaymentTypes() {
    for (int i = 0; i < paymentTypes.length; i++) {
      paymentTypes[i].paymentIsSelected = false;
    }
  }

  // To select & unselect pay on arrival option
  void selectArrivalPayment() {
    shouldPayOnArrival = !shouldPayOnArrival;
    if (shouldPayOnArrival == true) {
      showError = false;
    } else {
      showError = true;
    }
  }

  // To only unselect pay on arrival option
  void unselectArrivalPayment() => shouldPayOnArrival = false;
}
