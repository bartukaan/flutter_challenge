import 'dart:convert';
import 'package:flutter_challenge/models/feed_model.dart';
import 'package:flutter_challenge/utilities/service_urls.dart';
import 'package:http/http.dart' as http;

import '../locator.dart';
import 'feed_base.dart';

class FeedService implements FeedBase {
  final Feed _feed = getIt<Feed>();

  @override
  Future<List<FeedElement>> fetchList(int page) async {
    final response = await http.get(ServiceUrls.fetchFeeds(page));

    if (response.body != null) {
      var result = jsonDecode(response.body);

      _feed.feedTotal = result['feedTotal'];
      var data = (result['feed'])
          .map<FeedElement>((p) => FeedElement.fromJson(p))
          .toList();

      return Future.value(data);
    } else {
      throw Exception('Service Error');
    }
  }
}
