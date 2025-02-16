import 'package:flutter/cupertino.dart';
import 'package:flutter_news_app_kps_2025/data/remote/models/request/Register_request.dart';
import 'package:flutter_news_app_kps_2025/data/remote/repositories/impl/auth_repository_impl.dart';
import 'package:get/get.dart';

class RegisterViewModel extends GetxController {
  final authRepository = AuthRepositoryImpl();
  var isRegisterLoading = false.obs;
  var firstNameController = TextEditingController().obs;
  var lastNameController = TextEditingController().obs;
  var usernameController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var confirmPasswordController = TextEditingController().obs;
  var registerRequest = RegisterRequest().obs;

  @override
  void onInit() {
    super.onInit();
  }

  onRegister() async {
    if (firstNameController.value.text.isEmpty) {
      onMessageError("First name is empty");
    } else if (lastNameController.value.text.isEmpty) {
      onMessageError("Last name is empty");
    } else if (usernameController.value.text.isEmpty) {
      onMessageError("Username is empty");
    } else if (phoneController.value.text.isEmpty) {
      onMessageError("Phone is empty");
    } else if (emailController.value.text.isEmpty) {
      onMessageError("Email is empty");
    } else if (passwordController.value.text.isEmpty) {
      onMessageError("Password is empty");
    } else if (confirmPasswordController.value.text.isEmpty) {
      onMessageError("Confirm Password is empty");
    } else if (confirmPasswordController.value.text !=
        passwordController.value.text) {
      onMessageError("Confirm Password is not match!");
    } else {
      isRegisterLoading(true);
      registerRequest.value.firstName = firstNameController.value.text;
      registerRequest.value.lastName = lastNameController.value.text;
      registerRequest.value.username = usernameController.value.text;
      registerRequest.value.phoneNumber = phoneController.value.text;
      registerRequest.value.email = emailController.value.text;
      registerRequest.value.password = passwordController.value.text;
      registerRequest.value.confirmPassword =
          confirmPasswordController.value.text;
      registerRequest.value.profile = "NON";
      registerRequest.value.role = "USER";
      var response = await authRepository.register(registerRequest.value);
      if (response.code != "200") {
        onMessageError("${response.message}");
      } else {
        onMessageSuccess("${response.message}");
      }
      isRegisterLoading(false);
    }
  }

  onMessageError(message) {
    Get.snackbar("Error", message);
  }

  onMessageSuccess(message) {
    Get.snackbar("Succes", message);
  }
}
