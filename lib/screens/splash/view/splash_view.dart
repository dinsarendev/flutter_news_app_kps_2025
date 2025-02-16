import 'package:flutter/material.dart';
import 'package:flutter_news_app_kps_2025/app/routes.dart';
import 'package:flutter_news_app_kps_2025/screens/auth/register/view/register_view.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_button_widget.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 35),
            child: Text(
              "Welcome to News Mobile App",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24
              ),
            ),
          ),
          CustomButtonWidget(
            onTab: (){

            },
            isLoading: isLoading,
            title: "Login",
          ),
          SizedBox(height: 35,),
          CustomButtonWidget(
            onTab: (){
             Get.toNamed(RouteName.registerView);
             //  Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterView()));
            },
            title: "Register",
          ),
        ],
      ),
    );
  }
}
