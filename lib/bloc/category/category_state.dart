// ignore_for_file: must_be_immutable

part of 'category_bloc.dart';

class CategoryState extends Equatable {
  List<ProductResponse> categoryProducts;
  LoadStatus loadStatus;

  CategoryState({required this.categoryProducts, required this.loadStatus});

  CategoryState copyWith(
      {List<ProductResponse>? categoryProducts, LoadStatus? loadStatus}) {
    return CategoryState(
        categoryProducts: categoryProducts ?? this.categoryProducts,
        loadStatus: loadStatus ?? this.loadStatus);}
  
    @override
  List<Object> get props => [categoryProducts, loadStatus];
}
