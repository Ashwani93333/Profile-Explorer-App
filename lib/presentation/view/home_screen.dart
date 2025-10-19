import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:profile_exploler/presentation/widgets/home_card.dart';

import '../viewModel/home_viewModel.dart';
import '../viewModel/user_ViewModel.dart';

class HomeScreen extends StatelessWidget {
  final HomeViewModel controller = Get.put(HomeViewModel());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.userList.isEmpty) {
          return Center(child: Text("No data "),);
        }

        return
          GridView.builder(

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            final user = controller.userList[index];
            return Padding(padding: EdgeInsetsGeometry.all(6), child: Container(
                height: 260,
                width: 213,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Stack(
                  children: [

                    Image.network(user.picture?.medium ?? "", height: 260,
                      width: 213,
                      fit: BoxFit.cover,),
                    Positioned(
                        left: 13,
                        bottom: 13,
                        right: 13,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(user.name?.first ?? "RAvan", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),),
                                SizedBox(height: 5,),
                                Text("location", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),),

                              ],
                            ),
                            IconButton(onPressed: () {},
                                icon: Icon(Icons.heart_broken_rounded))

                          ],
                        ))
                  ],
                )
            ),);
          },
        );
      }
      ),
    );
  }
}
