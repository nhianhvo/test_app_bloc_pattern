import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:test_app/models/home_model.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoaded extends HomeState {
  const HomeLoaded({this.listData, this.changeList});

  final List<Datum>? listData;
  final int? changeList;

  @override
  List<Object> get props => [listData ?? HomeModel()];
}

class HomeLoadMore extends HomeState {
  const HomeLoadMore({this.listData, this.changeList, this.isLoadMore});

  final List<Datum>? listData;
  final int? changeList;
  final bool? isLoadMore;

  @override
  List<Object> get props => [listData ?? HomeModel()];
}

class CartError extends HomeState {
  @override
  List<Object> get props => [];
}
