abstract class HomeRepository {
  Future<void> getHomeData();
}

class DioRepository implements HomeRepository {
  @override
  Future<void> getHomeData() async {
    //faz alguma coisa;
  }
}
