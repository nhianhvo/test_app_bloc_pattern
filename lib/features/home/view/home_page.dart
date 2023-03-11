import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/data_source/repository/home_repository.dart';
import 'package:test_app/features/home/cubit/home_cubit.dart';
import 'package:test_app/features/home/view/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          HomeCubit(homeRepository: GetIt.instance.get<HomeRepository>()),
      child: HomeView(),
    );
  }
}
