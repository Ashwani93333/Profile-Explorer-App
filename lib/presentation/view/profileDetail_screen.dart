import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_exploler/data/model/user_model.dart';
import 'package:profile_exploler/presentation/viewModel/profileDetails_viewModel.dart';

class ProfileDetailScreen extends StatelessWidget {
  ProfileDetailScreen({super.key});

  final PDViewmodel controller = Get.put(PDViewmodel());

  @override
  Widget build(BuildContext context) {
    var user = Get.arguments as UserModel;
    return Stack(
      children: [
        Hero(tag: user.firstName, child: Image.network(
          user.imageLarge,
          fit: BoxFit.cover,
          height: 890,
          width: double.infinity,
        )),
        Positioned(
          bottom: 0,
          left: 0.0,
          right: 0,
          child: Card(
            elevation: 7,
            child: Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  vertical: 30,
                  horizontal: 15,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${user.firstName}, ${user.age}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 29,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Location",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 21,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "${user.city}, ${user.country}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/images/heartb.png",
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
