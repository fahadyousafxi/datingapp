import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../constants/app_urls.dart';
import '../repository/upload_photos_repository.dart';
import '../utils/utils.dart';

class UploadPhotosViewModel with ChangeNotifier {
  final _myRepo = UploadPhotosRepository();

  /// for loading
  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  /// For uploadProfilePhoto Api Call

  /// error 403
  Future<void> addImage(File imageFile) async {
    var url = Uri.parse(
        AppUrl.uploadProfileImageEndPoint); // Replace with your API endpoint

    // Create a multipart request
    var request = http.MultipartRequest('POST', url);

    // Attach the file to the request
    var image = await http.MultipartFile.fromPath('image', imageFile.path);
    request.files.add(image);

    try {
      // Send the request
      var response = await request.send();

      if (response.statusCode == 200) {
        print('Image uploaded successfully');
      } else {
        print('Image upload failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Image upload failed: $e');
    }
  }

  /// error 413
  // Future<void> addImage(File imageFile) async {
  //   var url = Uri.parse(
  //       AppUrl.uploadProfileImageEndPoint); // Replace with your API endpoint
  //
  //   // Read the file as bytes
  //   List<int> imageBytes = await imageFile.readAsBytes();
  //
  //   // Encode the bytes as Base64
  //   String base64Image = base64Encode(imageBytes);
  //
  //   // Create the request body
  //   var requestBody = {'image': base64Image};
  //
  //   try {
  //     // Send the request
  //     var response = await http.post(url, body: requestBody);
  //
  //     if (response.statusCode == 200) {
  //       print('Image uploaded successfully');
  //     } else {
  //       print('Image upload failed with status code: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Image upload failed: $e');
  //   }
  // }

  /// old 2
  // addImage({File? filepath}) async {
  //   var request = http.MultipartRequest(
  //       'POST', Uri.parse(AppUrl.uploadProfileImageEndPoint));
  //   // request.fields.addAll({'nmc_pin': '$number', 'Expiry_date': '$date'});
  //   request.files.add(await http.MultipartFile.fromBytes(
  //     'image',
  //     filepath!.path as List<int>,
  //   ));
  //
  //   // request.headers.addAll(headers);
  //
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 201 || response.statusCode == 200) {
  //     debugPrint(jsonDecode(await response.stream.bytesToString()).toString() +
  //         ' **** Response ****');
  //     return jsonDecode(await response.stream.bytesToString())['message'];
  //     return true;
  //   } else {
  //     debugPrint(jsonDecode(await response.stream.bytesToString()).toString() +
  //         ' **** Error Response ****' +
  //         response.statusCode.toString());
  //     return false;
  //   }
  //   return;
  // }

  /// old
  // Future<bool> addImage(/*Map<String, String> body,*/ String filepath) async {
  //   Map<String, String> headers = {
  //     'Content-Type': 'multipart/form-data',
  //   };
  //   var request = http.MultipartRequest(
  //       'POST', Uri.parse(AppUrl.uploadProfileImageEndPoint))
  //     ..fields.addAll({})
  //     ..headers.addAll(headers)
  //     ..files.add(await http.MultipartFile.fromPath('image', filepath));
  //   var response = await request.send();
  //   if (response.statusCode == 201 || response.statusCode == 200) {
  //     debugPrint(response.toString() + ' **** Response ****');
  //     return true;
  //   } else {
  //     debugPrint(response.toString() +
  //         ' **** Error Response ****' +
  //         response.statusCode.toString());
  //     return false;
  //   }
  // }

  /// For uploadProfilePhoto Api Call
  Future<void> uploadProfilePhotoApi(BuildContext context,
      {required dynamic data}) async {
    setLoading(true);
    _myRepo.uploadProfilePhotoApi(data).then((value) {
      // code
      setLoading(false);
      debugPrint('&&&&&&&&&&&&&&' + value.toString() + '&&&&&&&&&&&&&&');
      Utils.flutterToast(value.toString());
      Utils.flutterToast('Uploaded');
      // userViewModel.saveUser(value['token'].toString());
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => Bottom()));
    }).onError((error, stackTrace) {
      // onError code
      setLoading(false);

      debugPrint('*********' + error.toString() + '*********');
      Utils.flutterToast(error.toString());
    });
  }
}
