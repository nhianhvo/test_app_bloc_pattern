import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/home/cubit/home_cubit.dart';
import 'package:test_app/features/home/cubit/home_state.dart';
import 'package:test_app/features/home/view/widget/button_app_widget.dart';
import 'package:test_app/features/home/view/widget/ttem_data_widget.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Test Exam',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HomeLoaded) {
            return Column(
              children: [
                Expanded(
                  child: GridView(
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    controller: context.read<HomeCubit>().scrollController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: state.changeList == 1 ? 2 : 1,
                      childAspectRatio: state.changeList == 1 ? .75 : 2.5,
                    ),
                    children: List.generate(state.listData!.length, (index) {
                      return ItemData(
                        avatar: '${state.listData![index].avatar}',
                        name:
                            '${state.listData![index].firstName} ${state.listData![index].lastName}',
                        email: '${state.listData![index].email}',
                      );
                    }),
                  ),
                ),
                const SizedBox(),
                ButtonAppWidget(
                  ontap: () {
                    if (state.changeList == 1) {
                      context
                          .read<HomeCubit>()
                          .changeListOrGrid(0, listData: state.listData);
                    } else {
                      context
                          .read<HomeCubit>()
                          .changeListOrGrid(1, listData: state.listData);
                    }
                  },
                )
              ],
            );
          }
          if (state is HomeLoadMore) {
            return Column(
              children: [
                Expanded(
                  child: GridView(
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    controller: context.read<HomeCubit>().scrollController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: state.changeList == 1 ? 2 : 1,
                      childAspectRatio: state.changeList == 1 ? .75 : 2.5,
                    ),
                    children: List.generate(state.listData!.length, (index) {
                      return ItemData(
                        avatar: '${state.listData![index].avatar}',
                        name:
                            '${state.listData![index].firstName} ${state.listData![index].lastName}',
                        email: '${state.listData![index].email}',
                      );
                    }),
                  ),
                ),
                const CircularProgressIndicator(),
                ButtonAppWidget(
                  ontap: () {
                    if (state.changeList == 1) {
                      context
                          .read<HomeCubit>()
                          .changeListOrGrid(0, listData: state.listData);
                    } else {
                      context
                          .read<HomeCubit>()
                          .changeListOrGrid(1, listData: state.listData);
                    }
                  },
                )
              ],
            );
          }

          return const Text('Something went wrong!');
        },
      ),
    );
  }
}
