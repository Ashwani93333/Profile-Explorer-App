import 'package:get/get.dart';
import '../../data/model/user_model.dart';
import '../../data/services/api_services.dart';
import '../view/profileDetail_screen.dart';
import '../widgets/home_card.dart';

class HomeViewModel extends GetxController {

  var isLoading = true.obs;
  var userList = <Results>[].obs;
  final ApiService apiService = ApiService();

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    try {
      isLoading(true);
      final userModel = await apiService.fetchUsers(); // fetch UserModel
      if (userModel.results != null) {
        userList.assignAll(userModel.results!);
      } else{
        userList.clear();

      }
    }catch (e){
      print("Error occured ${e}");
    }
    finally {
      isLoading(false);
    }
  }



  // final _repository = ApiService();
  //
  // Future<List<UserModel>> getUsers() async {
  // return await _repository.fetchUsers();
  //
  // }
  //
  // void navigate() {
  //   Get.to(ProfileDetailScreen());
  // }
}
