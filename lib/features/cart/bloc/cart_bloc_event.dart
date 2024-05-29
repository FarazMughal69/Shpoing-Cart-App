part of 'cart_bloc_bloc.dart';

@immutable
sealed class CartBlocEvent {}

class CartListInitialEvent extends CartBlocEvent {}

class RemoveCartListEvent extends CartBlocEvent {
  final ProductDataModel clickedProduct;
  RemoveCartListEvent({required this.clickedProduct});
}
