part of 'cart_bloc.dart';

abstract class CartState {}

abstract class CartActionState extends CartState {}

final class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<ProductDataModel> cartItems;

  CartSuccessState({required this.cartItems});
}

class CartRemovedActionState extends CartActionState {
  final List<ProductDataModel> cartItems;

  CartRemovedActionState({required this.cartItems});
}
