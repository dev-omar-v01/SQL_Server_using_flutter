

import 'dart:convert';

import 'package:http/http.dart';
import 'package:sql/profile/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:sql/profile/network/endpoint.dart';

class ApiService{


  // Future<List<UserModels>> getAllNews() async {
  //   try {
  //     Response response = await get(Uri.parse('http://192.168.1.7/dashboard/myfolder/getdata.php'));
  //     print(await response.body);
  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> json = jsonDecode(response.body);
  //       List<dynamic> body = json['']; // Pass the key of the JSON list here
  //       List<UserModels> uerProfile = body.map((dynamic item) => UserModels.fromJson(item)).toList();
  //       print(uerProfile);
  //       return uerProfile;
  //     } else {
  //       throw ("No profile data found");
  //     }
  //   } catch (e) {
  //     throw (e.toString());
  //   }
  // }
  Future<List<Map<String, String>>> getAllNews() async {
    final response =
    await http.get(Uri.parse('http://192.168.1.7/dashboard/myfolder/getdata.php'));
    if (response.statusCode == 200) {
      // Decode the JSON data
      final jsonData = json.decode(response.body);

      // Ensure that jsonData is a List<dynamic>
      if (jsonData is List) {
        List<Map<String, String>> newsList = [];

        // Iterate through each item in jsonData
        for (var item in jsonData) {
          // Ensure that each item is a Map<String, dynamic>
          if (item is Map<String, dynamic>) {
            // Extract the values and ensure they are strings
            final id = item['id'].toString();
            final name = item['name'].toString();
            final mobile = item['mobile'].toString();

            // Create a map for each item and add it to the newsList
            newsList.add({
              'id': id,
              'name': name,
              'mobile': mobile,
            });
          } else {
            // Handle the case when the item is not in the expected format
            throw FormatException("Data format error");
          }
        }

        // If all items are correctly formatted, return the newsList
        return newsList;
      } else {
        // Handle the case when the data is not in the expected format
        throw FormatException("Data format error");
      }
    } else {
      // Handle the case when the API call fails
      throw Exception('Failed to load news');
    }
  }



}