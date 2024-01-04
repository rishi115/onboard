import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
class Onboard extends StatelessWidget {
  Onboard({super.key});

  TextEditingController nameController = TextEditingController();

  _validatedata(){
    if(nameController.text.isNotEmpty){
      //validation
    }
    else{
      Get.snackbar("Oops!","Please Enter Your Name",snackPosition: SnackPosition.TOP,backgroundColor: Colors.red,duration: const Duration(seconds: 1),);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body:Stack(
          children: [
            const RiveAnimation.asset("assets/RiveAssets/white_bubble.riv"),
            Positioned(
              // height: 100,
              width: MediaQuery.of(context).size.width * 1.7,

              left: 100,
              child: Image.asset("assets/Backgrounds/Spline.png"),
            ),
            Positioned.fill(
              child: BackdropFilter(
                // Now it's looks perfect
                // See how easy
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              ),
            ),

            Positioned.fill(
              child: BackdropFilter(
                // Now it's looks perfect
                filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                child: const SizedBox(),
              ),
            ),

            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height *0.10,),
                      const Text(
                        "Welcome aboard! ",
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Poppins",
                          height: 1.2,
                          color: Colors.black,
                        ),
                      ),
                      Center(
                        child: Lottie.asset(
                          "animation/task.json",
                          height: 300,
                          width: 300,
                          repeat: true,
                          reverse: true,
                          fit: BoxFit.cover,
                        ),
                      ),


                      const Text(
                        "What's your name?",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Poppins",
                          height: 1.2,
                          color: Colors.black,
                        ),
                      ),
                      TextField(
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                        controller: nameController,


                      ),
                      SizedBox(height: size.height *0.05,),
                      AnimatedButton(
                        onPress: () {
                          _validatedata();

                        },
                        height: 60,
                        textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 22,
                        ),
                        width: double.infinity,
                        text: 'SUBMIT',
                        backgroundColor: Colors.blueAccent.withOpacity(0.4),
                        isReverse: true,
                        borderRadius: 20,
                        selectedTextColor: Colors.black,
                        transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                        borderColor: Colors.black,
                        borderWidth: 1,
                      ),

                    ],
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}
