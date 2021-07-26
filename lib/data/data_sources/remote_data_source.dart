import 'dart:convert';

import 'package:githubapp/core/enviroment.dart';
import 'package:githubapp/core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:githubapp/domain/models/commit.dart';
import 'package:http/http.dart';

class RequestType {
  static const String get = 'get';
  static const String post = 'post';
  static const String patch = 'patch';
}

abstract class RemoteDataSource {
  Future<List<Commit>> getCommits();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl({
    required this.client,
  });

  final http.Client client;

  @override
  Future<List<Commit>> getCommits() async {
    final Response resp = await _apiRequest('/commits');
    if (resp.statusCode == 200) {
      final decodedData = json.decode(resp.body);
      final users = CommitMapper.fromJsonList(decodedData).items;
      return users;
    } else {
      throw ServerException();
    }
  }

  Future<dynamic> _apiRequest(String endpoint,
      {String type = RequestType.get}) async {
    final env = await Enviroment.instance.loadEnvFile();

    final headers = {
      'Content-Type': 'application/json',
    };

    final url = Uri.parse('${env['API_URL']}$endpoint');

    Response resp;

    switch (type) {
      case RequestType.get:
        resp = await http.get(url, headers: headers);
        return resp;
      default:
        resp = await http.get(url, headers: headers);
        return resp;
    }
  }
}
