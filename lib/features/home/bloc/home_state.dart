part of 'home_bloc.dart';

@immutable
sealed class HomeBlocState {}

abstract class HomeActionState extends HomeBlocState {}

final class HomeBlocInitial extends HomeBlocState {}

class IconChangedState extends HomeBlocState {
  final bool isSelected;
  IconChangedState({required this.isSelected});
}

class HomeLoadedSuccessState extends HomeBlocState {
  final List<ProductDataModel> products;
  HomeLoadedSuccessState({required this.products});
}

class HomeLoadingState extends HomeBlocState {}

class HomeErrorState extends HomeBlocState {}

class HomeNavigatorWishlstState extends HomeActionState {}

class HomeNavigatorCartState extends HomeActionState {}

class ProductAddedtoCartState extends HomeActionState {}

class ProductexisttoCartState extends HomeActionState {}

class ProductAddedtoWishListtState extends HomeActionState {}

class ProductExistWishListtState extends HomeActionState {}
