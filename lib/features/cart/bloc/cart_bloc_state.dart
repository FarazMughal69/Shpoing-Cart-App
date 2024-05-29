part of 'cart_bloc_bloc.dart';

@immutable
sealed class CartBlocState {}

final class CartBlocInitial extends CartBlocState {}

abstract class CartListActoinState extends CartBlocState {}

final class CartlistBlocInitial extends CartBlocState {}

class CartListSuccessState extends CartBlocState {
  final List<ProductDataModel> cartListItems;
  CartListSuccessState({required this.cartListItems});
}
