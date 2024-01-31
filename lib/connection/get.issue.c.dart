import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:potential_task/modules/home/model/git.issue.m.dart';
import 'package:potential_task/utils/utils.dart';

Future<List<GitIssueModel>?> getIssues({int pageNo = 1, int perPage = 10}) async {
  try {
    var request = http.Request('GET', Uri.parse('$baseUrl/issues?per_page=$perPage&page=$pageNo'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final body = await response.stream.bytesToString();
      //debugPrint('GetProfileInfo XY: $body');
      final issueList = json.decode(body);

      return issueList == null ? [] : List<GitIssueModel>.from(issueList!.map((x) => GitIssueModel.fromJson(x)));
    } else {
      debugPrint(response.reasonPhrase.toString());
    }
  } on SocketException catch (_) {
    debugPrint('No Internet Connection');
  } catch (e) {
    debugPrint('Something went wrong ${e.toString()}');
  }
  return null;
}
