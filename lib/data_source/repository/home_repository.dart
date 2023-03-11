import 'package:injectable/injectable.dart';
import 'package:test_app/data_source/remote/api_client.dart';
import 'package:test_app/models/home_model.dart';

@injectable
class HomeRepository {
  final ApiClient apiClient;
  HomeRepository(this.apiClient);

  Future<HomeModel> loadData(int page) async {
    final res = await apiClient.get(
        path:
            '${ApiEndpoint.END_POINT}${ApiEndpoint.API_PREFIX}/users?page=$page');

    return HomeModel.fromJson(res.data);
  }
}
