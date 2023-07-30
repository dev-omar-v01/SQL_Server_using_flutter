import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sql/profile/data/repo.dart';
import 'package:sql/profile/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:sql/profile/presentation/add_data_screen.dart';

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

  delete(String id){
    String  url ="http://192.168.1.7/dashboard/myfolder/deletedata.php";
    http.post(Uri.parse(url),body: {
      "id": id,
    });
  }
  @override
  Widget build(BuildContext context) {
    print(GetPrile.length);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddDataScreen()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("My Server App"),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: GetPrile.length,
            itemBuilder:(context,index){
              return Column(
                children: [
                  Expanded(
                    child: ListTile(
                      trailing: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              delete(GetPrile[index]['id']);
                            },
                            child: Icon(Icons.edit),
                          ),
                          InkWell(
                            onTap: () {
                              delete(GetPrile[index]['id']);
                            },
                            child: Icon(Icons.delete),
                          ),
                        ],
                      ),
                      title: Text(GetPrile[index]['name']),
                      subtitle: Text(GetPrile[index]['mobile'] ?? "djk"),
                    ),
                  ),
                  // Other widgets can go here
                ],
              );
            }),
      ),
    );
  }
}
