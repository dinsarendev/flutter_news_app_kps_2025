import 'package:flutter/material.dart';
import 'package:flutter_news_app_kps_2025/screens/home/view_model/home_view_model.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var viewModel = Get.put(HomeViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("News", style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(onPressed: (){
            viewModel.logout();
          }, icon: const  Icon(Icons.logout))
        ],
      ),
    );
  }
}
