import 'package:flutter/material.dart';
import 'package:flutter_news_app_kps_2025/widgets/custom_button_widget.dart';

import '../../../../widgets/custom_text_field_widget.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: double.infinity,
            child: Text(
              "Register",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
          ),
          CustomTextFieldWidget(
            title: "First name",
          ),
          SizedBox(height: 10,),
          CustomTextFieldWidget(
            title: "Last name",
          ),
          SizedBox(height: 10,),
          CustomTextFieldWidget(
            title: "Username",
          ),
          SizedBox(height: 10,),
          CustomTextFieldWidget(
            title: "Phone",
          ),
          SizedBox(height: 10,),
          CustomTextFieldWidget(
            title: "Email",
          ),
          SizedBox(height: 10,),
          CustomTextFieldWidget(
            title: "Password",
          ),
          SizedBox(height: 10,),
          CustomButtonWidget(onTab: (){},title: "Register",)
        ],
      ),
    );
  }
}
