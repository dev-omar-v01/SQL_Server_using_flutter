
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
class EditDataScreen extends StatefulWidget {
  String id;
  String name;
  String mobile;
   EditDataScreen({Key? key,required this.id,required this.name,required this.mobile}) : super(key: key);

  @override
  State<EditDataScreen> createState() => _EditDataScreenState();
}

class _EditDataScreenState extends State<EditDataScreen> {
  TextEditingController controller1 =TextEditingController();
  TextEditingController controller2=TextEditingController();
  @override
  adddata(){
    String  url ="http://192.168.1.7/dashboard/myfolder/editdata.php";
    http.post(Uri.parse(url),body: {
      "id": widget.id,
      "name": controller1.text,
      "mobile": controller2.text
    });
  }

  void initState() {
    super.initState();
   controller1 = TextEditingController(text:widget.name );
   controller2 = TextEditingController(text:widget.mobile );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Insert data in SQL Database"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: controller1,
              decoration: InputDecoration(
                  hintText: "Enter your Name "
              ),
            ),
            TextFormField(
              controller: controller2,
              decoration: InputDecoration(
                  hintText: "Enter your Mobile "
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: ()async{
                await adddata();
                print("succesfully");
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.indigo
                ),
                child: Text("Submit",style: TextStyle(fontSize: 20,color: Colors.white),),
              ),
            )

          ],
        ),
      ),
    );
  }
}
