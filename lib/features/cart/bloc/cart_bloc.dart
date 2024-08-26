import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_project/data/cart_items.dart';
import 'package:bloc_project/features/home/models/home_product_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveCartEvent);
  }

  // Created method by bulb icon:
  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    // Removes the product from the cart items list
    cartItems.remove(event.productDataModel);

    // Updates the UI with the new cart items
    emit(CartSuccessState(cartItems: cartItems));

    // Triggers additional actions specific to removing an item
    emit(CartRemovedActionState(cartItems: cartItems));
  }
}


/* 
Steps for events:
 1) get your cart items (means its list of items, already done)
    2) check if your product model there in your cart items (always true, cos definitely it is going to be there, thats why we are running this event)
    3) if my product is there then run a function to remove that product model from that cart items
    4) emit cartItemRemovedState
   */