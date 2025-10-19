

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:profile_exploler/data/services/api_services.dart';
import 'dart:convert';

import '../../data/model/user_model.dart';

class HomeViewmodel extends GetxController {
  var userList = <UserModel>[].obs;
  var isLoading = true.obs;
  var likedStatus = <bool>[].obs;




  @override
  void onInit() {
    likedStatus.addAll(List.generate(20, (_) => false));
    fetchUsers();
    super.onInit();

  }
  void toggleLike(int index) {
    likedStatus[index] = !likedStatus[index];
    likedStatus.refresh();  // Important to notify UI of change
  }

  // Future<void> fetchUsers() async {
  //   isLoading(true);
  //   // call your API here
  //   var users = await ApiService.fetchUsers(); // example API call
  //   userList.assignAll(users); // update observable list
  //   isLoading(false);
  // }

  void fetchUsers() async {
    isLoading(true);
    final response = await http.get(Uri.parse('https://randomuser.me/api/?results=20'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      userList.value = List<UserModel>.from(data['results'].map((user) => UserModel.fromJson(user)));
    }
    isLoading(false);
  }


}


// import 'package:get/get.dart';
// import '../../data/model/user_model.dart';
// import '../../data/services/api_services.dart';
// import '../view/profileDetail_screen.dart';
// import '../widgets/home_card.dart';
//
// class HomeViewModel extends GetxController {
//
//   var isLoading = true.obs;
//   var userList = <Results>[].obs;
//   final ApiService apiService = ApiService();
//
//   @override
//   void onInit() {
//     fetchUsers();
//     super.onInit();
//   }
//
//   void fetchUsers() async {
//     try {
//       isLoading(true);
//       final userModel = await apiService.fetchUsers(); // fetch UserModel
//       if (userModel.results != null) {
//         userList.assignAll(userModel.results!);
//       } else{
//         userList.clear();
//
//       }
//     }catch (e){
//       print("Error occured ${e}");
//     }
//     finally {
//       isLoading(false);
//     }
//   }
//
//
//
//   // final _repository = ApiService();
//   //
//   // Future<List<UserModel>> getUsers() async {
//   // return await _repository.fetchUsers();
//   //
//   // }
//   //
//   // void navigate() {
//   //   Get.to(ProfileDetailScreen());
//   // }
// }
