import 'package:flutter/material.dart';
import 'package:flutter_news_app_kps_2025/screens/auth/register/view_models/register_view_model.dart';
import 'package:flutter_news_app_kps_2025/widgets/custom_button_widget.dart';
import 'package:get/get.dart';

import '../../../../widgets/custom_text_field_widget.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  var viewModel = Get.put(RegisterViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.indigo,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.indigo,
        title: Text(
          "Register",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Obx((){
        return Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 600),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    child: Text(
                      "Register new an account",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24, color: Colors.black54),
                    ),
                  ),
                  CustomTextFieldWidget(
                    controller: viewModel.firstNameController.value,
                    title: "First name",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldWidget(
                    controller: viewModel.lastNameController.value,
                    title: "Last name",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldWidget(
                    controller: viewModel.usernameController.value,
                    title: "Username",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldWidget(
                    controller: viewModel.phoneController.value,
                    title: "Phone",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldWidget(
                    controller: viewModel.emailController.value,
                    title: "Email",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldWidget(
                    controller: viewModel.passwordController.value,
                    title: "Password",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldWidget(
                    controller: viewModel.confirmPasswordController.value,
                    title: "Confirm Password",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButtonWidget(
                    onTab: () {
                      viewModel.onRegister();
                    },
                    title: "Register",
                    backgroundColor: Colors.indigo,
                    isLoading: viewModel.isRegisterLoading.value,
                  )
                ],
              ),
            ),
          ),
        );
      })
    );
  }
}
