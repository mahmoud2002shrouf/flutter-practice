import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePref extends GetxService{
  late SharedPreferences sharePref;
  Future<SharePref> init ()async{
    sharePref=await SharedPreferences.getInstance();
    return this;
  }
}