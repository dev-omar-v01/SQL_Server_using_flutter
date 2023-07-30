import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sql/profile/data/repo.dart';
import 'package:sql/profile/models/user_model.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>>  GetPrile = [];
  bool loading = true;
  Future dataload() async {
    ApiService service = ApiService();
     var list = await service.getAllNews();

    setState(() {
      GetPrile = list;
      loading = false;
    });
  }

  void initState() {
    super.initState();
    dataload();
  }

  @override
  Widget build(BuildContext context) {
    print(GetPrile.length);
    return Scaffold(
      appBar: AppBar(
        title: Text("My Server App"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: GetPrile.length,
          itemBuilder:(context,index){
          return  ListTile(
            title: Text(GetPrile[index]['name']),
            subtitle: Text(GetPrile[index]['moblile']??"djk"),
          );
          }),
    );
  }
}
