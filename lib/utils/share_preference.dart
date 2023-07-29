import 'package:homesaloon_admin/modal/profilemodal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sharepre {
  Future<void> set_personaldata(Profilemodal modal) async {
    SharedPreferences share = await SharedPreferences.getInstance();
    share.setString("name", "${modal.name}");
    share.setString("address", "${modal.address}");
    share.setString("number", "${modal.number}");
    share.setString("date", "${modal.date}");
    share.setString("date", "${modal.date}");
    share.setBool("status", true);
  }

  Future<Map<String, dynamic>> getdata() async {
    SharedPreferences share = await SharedPreferences.getInstance();
    String? name = share.getString("name");
    String? address = share.getString("address");
    String? number = share.getString("number");
    String? date = share.getString("date");
    bool? status = share.getBool("status");
    return {
      "name": name,
      "address": address,
      "number": number,
      "date": date,
      "status": status
    };
  }
}
