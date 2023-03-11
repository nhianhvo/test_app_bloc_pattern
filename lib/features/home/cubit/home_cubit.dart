import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/data_source/repository/home_repository.dart';
import 'package:test_app/features/home/cubit/home_state.dart';
import 'package:test_app/models/home_model.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;
  HomeCubit({required this.homeRepository}) : super(HomeLoading()) {
    loadData(page);
    // print('${scrollController.position.extentAfter}');
    scrollController.addListener(_onScroll);
  }

  final ScrollController scrollController = ScrollController();

  int page = 1;
  final listData = <Datum>[];
  bool canLoadmore = true;
  int changeWidget = 0;

  Future<void> _onScroll() async {
    if (!scrollController.hasClients) return;
    final thresholdReached = scrollController.position.extentAfter < 10.0;

    if (thresholdReached) {
      // Load more!
      if (canLoadmore == true) {
        emit(HomeLoaded(listData: listData));

        await loadMore(++page);
      }
      // print('${scrollController.position.extentAfter}');

    }
  }

  Future<HomeModel> loadData(int page) async {
    emit(HomeLoading());

    await Future.delayed(const Duration(seconds: 3));
    final res = await homeRepository.loadData(page);
    emit(HomeLoaded(changeList: changeWidget));

    if (res.data != null && res.data!.isNotEmpty) {
      listData.addAll(res.data!);
    }
    emit(HomeLoaded(listData: listData));
    return res;
  }

  Future<HomeModel> loadMore(int page) async {
    emit(HomeLoadMore(
        listData: listData, changeList: changeWidget, isLoadMore: true));

    await Future.delayed(const Duration(seconds: 3));
    final res = await homeRepository.loadData(page);
    // emit(const HomeLoaded(changeList: 0));

    if (res.data != null && res.data!.isNotEmpty) {
      listData.addAll(res.data!);
    } else {
      canLoadmore = false;
    }

    emit(HomeLoaded(listData: listData, changeList: changeWidget));
    return res;
  }

  Future<void> changeListOrGrid(int index, {List<Datum>? listData}) async {
    changeWidget = index;
    emit(HomeLoading());
    emit(HomeLoaded(listData: listData, changeList: changeWidget));
  }
}
