import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  var isPhoneUnique = false.obs;
  var phoneNumber = ''.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  final String apiUrl =
      'https://jcjqmhkgkjfmvfmlgzen.supabase.co/functions/v1/isPhoneNumberUnique';
  final String authToken =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpjanFtaGtna2pmbXZmbWxnemVuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTIwMzY0NjMsImV4cCI6MjA2NzYxMjQ2M30.UjlaS2cu2htulX74Slq41aWeJ-AEyOC24BF9DCPaiWw';

  Future<void> checkPhoneUnique(String mobilePhone) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': authToken,
        },
        body: jsonEncode({'mobile_phone': mobilePhone}),
      );

      if (response.statusCode == 200) {
        log(response.body);
        final data = jsonDecode(response.body);
        isPhoneUnique.value = data['unique'] ?? false;
      } else {
        errorMessage.value = 'Server error: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
