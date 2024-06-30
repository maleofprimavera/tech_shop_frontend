part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class GetProductsByCategoryEvent extends CategoryEvent {
  final CategoryEnum category;
  const GetProductsByCategoryEvent({required this.category});

  @override
  List<Object> get props => [category];
}
