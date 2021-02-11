import 'package:flutter_challenge/models/feed_model.dart';

abstract class FeedBase {

  Future<List<FeedElement>> fetchList(int page);

}
