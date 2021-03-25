import 'package:dio/dio.dart';
import 'package:simple_flutter_app/models/blog_model.dart';
import 'package:simple_flutter_app/models/user_model.dart';

class Apis {
  Dio _dio = new Dio();
  Apis() {
    _dio.options = BaseOptions(
        baseUrl: "https://60585b2ec3f49200173adcec.mockapi.io/api/v1/",
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        });
  }

  Future<UserModel> login(String email, String password) async {
    var response = await _dio.post(
      "login",
      data: {"email": email, "password": password},
    );
    if (response.statusCode == 201) {
      UserModel user = UserModel.fromMap(response.data);
      return user;
    } else
      throw Exception();
  }

  Future<List<BlogModel>> getBlogs(String token) async {
    Response response = await _dio.get(
      "blogs",
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    );
    if (response.statusCode == 200) {
      return List<BlogModel>.from(
          response.data.map((x) => BlogModel.fromMap(x)));
    } else
      throw Exception();
  }

  getBlogEntry(String token, id) async {
    Response response = await _dio.get(
      "blogs/$id",
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    );
    if (response.statusCode == 200) {
      return BlogModel.fromMap(response.data);
    } else
      throw Exception();
  }
}
