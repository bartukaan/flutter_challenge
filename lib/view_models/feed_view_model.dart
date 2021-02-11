import 'package:flutter/material.dart';
import 'package:flutter_challenge/enums/view_state_enum.dart';
import 'package:flutter_challenge/models/feed_model.dart';
import 'package:flutter_challenge/repositories/feed_repository.dart';
import 'package:flutter_challenge/services/feed_base.dart';

import '../enums/view_state_enum.dart';
import '../locator.dart';
import '../models/feed_model.dart';

class FeedViewModel with ChangeNotifier implements FeedBase {
  final FeedRepository _feedRepository = getIt<FeedRepository>();

  List<FeedElement> _feedElement;

  List<FeedElement> get feedElement => _feedElement;

  ViewState _fetchState;

  ViewState get fetchState => _fetchState;

  set fetchState(ViewState value) {
    _fetchState = value;
    notifyListeners();
  }


  FeedViewModel() {
    fetchState = ViewState.Initial;
    _feedElement = List<FeedElement>();
  }

  @override
  Future<List<FeedElement>> fetchList(int page) async {
    try {
      _feedElement = await _feedRepository.fetchList(page);
    } catch (e) {
     fetchState = ViewState.Error;
    } finally {
      fetchState = ViewState.Success;
    }
    return _feedElement;
  }



}
