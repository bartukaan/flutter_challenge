import 'package:flutter_challenge/models/feed_model.dart';
import 'package:flutter_challenge/services/feed_base.dart';
import 'package:flutter_challenge/services/feed_services.dart';

import '../locator.dart';

class FeedRepository implements FeedBase{
  final FeedService _feedService = getIt<FeedService>();

  @override
  Future<List<FeedElement>> fetchList(int page) async{
   return await _feedService.fetchList(page);
  }

}