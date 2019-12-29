import 'dart:async';
import 'package:http/http.dart' show Client;
import 'package:kyankafe/BLOCS/State_Managment.dart';



class RegistrationApi {
  Client client = Client();
 

  Future postRegistrationData(name,password,phone,image) async {
    try {
      final response =
          await client.post("http://142.93.219.45:8080/KyanCafe/kyancafe/register?password=$password&firstName=$name&phone=$password", body: {
            "multipartfile":stateManagmentData.file
          });
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception("Failed to add data");
      }
    } catch (e) {}
    print("entered");
  }
}