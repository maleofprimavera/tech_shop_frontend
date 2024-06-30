part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class GetCartProductsEvent extends CartEvent {
  const GetCartProductsEvent();
}


class RemoveCartProductEvent extends CartEvent {
  final String productId;
  const RemoveCartProductEvent({required this.productId});

  @override
  List<Object> get props => [productId];
}

class AddCartProductEvent extends CartEvent {
  final String productId;
  const AddCartProductEvent({required this.productId});

  @override
  List<Object> get props => [productId];
}
