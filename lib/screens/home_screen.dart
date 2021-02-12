import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_challenge/enums/view_state_enum.dart';
import 'package:flutter_challenge/models/feed_model.dart';
import 'package:flutter_challenge/utilities/constants.dart';
import 'package:flutter_challenge/view_models/feed_view_model.dart';
import 'package:flutter_challenge/widgets/user_list_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageNumber;
  final _scrollController = ScrollController();

  @override
  void initState() {
    pageNumber = 1;
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _feedViewModel = Provider.of<FeedViewModel>(context);
    switch (_feedViewModel.fetchState) {
      case ViewState.Initial:
        _feedViewModel.fetchList(pageNumber);
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      case ViewState.Success:
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildUserList(_feedViewModel.feedElement),
              _buildButtonBar(_feedViewModel.feedElement),
              Text(
                'Total User: ${_feedViewModel.totalFeedCount.toString()}',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        );
      case ViewState.Error:
        return Scaffold(
          body: Center(
            child: Text('Oops.. Something went wrong...'),
          ),
        );
    }
    return Scaffold();
  }

  ButtonBar _buildButtonBar(List<FeedElement> feedElement) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        FlatButton.icon(
          onPressed: () {
            feedElement.sort((a, b) => (b.createdAt).compareTo((a.createdAt)));
            setState(() {});
          },
          label: Text('By Time', style: buttonTextStyle),
          icon: Icon(
            Icons.history_toggle_off_sharp,
            size: 35,
            color: Colors.black,
          ),
        ),
        FlatButton.icon(
          onPressed: () {
            feedElement.sort((a, b) => int.parse(b.followerCount)
                .compareTo(int.parse((a.followerCount))));
            setState(() {});
          },
          label: Text('Popularity', style: buttonTextStyle),
          icon: Icon(
            Icons.face,
            size: 35,
            color: Colors.black,
          ),
        )
      ],
    );
  }

  Widget _buildUserList(List<FeedElement> feedElement) {
    debugPrint(feedElement.toString());
    return NotificationListener(
      child: ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        controller: _scrollController,
        shrinkWrap: true,
        itemCount: feedElement.length,
        itemBuilder: (context, index) => UserList(
          userModel: feedElement[index],
        ),
      ),
      onNotification: (scroll) {
        if (scroll is ScrollEndNotification) {
          _loadMoreUser();
        }
      },
    );
  }

  Future _loadMoreUser() async {
    final _feedViewModel = Provider.of<FeedViewModel>(context, listen: false);
    if (pageNumber <= (_feedViewModel.totalFeedCount / 10)) {
      pageNumber += 1;

      return await _feedViewModel.fetchList(pageNumber);
    }
  }
}
