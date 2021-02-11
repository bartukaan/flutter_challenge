import 'dart:convert';
import 'package:flutter_challenge/models/feed_model.dart';
import 'package:flutter_challenge/utilities/service_urls.dart';
import 'package:http/http.dart' as http;

import 'feed_base.dart';

class FeedService implements FeedBase {
  @override
  Future<List<FeedElement>> fetchList(int page) async {
    final response = await http.get(ServiceUrls.fetchFeeds(page));

    if (response.body != null) {
      var result = jsonDecode(response.body);
      // debugPrint('Feed service response' +  result.toString());

      var data = (result['feed'])
          .map<FeedElement>((p) => FeedElement.fromJson(p))
          .toList();

      return Future.value(data);
    } else {
      throw Exception('Service Error');
    }
  }
}
