import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:profile_exploler/data/model/user_model.dart';
import 'package:profile_exploler/data/services/api_services.dart';
import 'package:profile_exploler/presentation/view/profileDetail_screen.dart';
import '../viewModel/home_viewModel.dart';

class HomeScreen extends StatelessWidget {
  final HomeViewmodel controller = Get.put(HomeViewmodel());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.userList.isEmpty) {
          return Center(child: Text("No data "));
        }

        return RefreshIndicator(onRefresh: ()async{await UserModel;}, child: Padding(
            padding: EdgeInsetsGeometry.all(7),
        child: GridView.builder(
        itemCount: controller.userList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        ),
        itemBuilder: (context, index) {
        final user = controller.userList[index];

        return GestureDetector(
        onTap: () {
        Get.to(
        () => ProfileDetailScreen(),
        arguments: controller.userList[index],
        );
        },
        child: Stack(
        children: [
        ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Hero(
        tag: user.firstName,
        child: Image.network(
        user.imageMedium,
        height: 260,
        width: 213,
        fit: BoxFit.cover,
        ),
        ),
        ),
        Positioned(
        left: 10,
        bottom: 13,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(
        user.firstName,
        style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w800,
        fontSize: 25,
        ),
        ),
        SizedBox(height: 5),
        Text(
        user.city,
        style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 21,
        ),
        ),
        ],
        ),
        ),
        Positioned(
        right: 15,
        bottom: 13,
        child: GestureDetector(
        onTap: (){controller.toggleLike(index);},
        child: Image.asset(
        "assets/images/heart.png",
        height: 30,
        width: 30,
        color:
        controller.likedStatus[index] == true ? Colors.red : Colors.white
        ),
        )

        )
        ],
        ),);
        },
        )
        ,
        )
        ,
        );
      },)


      ,

    );
  }
}
