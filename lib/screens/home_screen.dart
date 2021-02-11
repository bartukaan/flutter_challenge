import 'package:flutter/material.dart';
import 'package:flutter_challenge/enums/view_state_enum.dart';
import 'package:flutter_challenge/models/feed_model.dart';
import 'package:flutter_challenge/view_models/feed_view_model.dart';
import 'package:flutter_challenge/widgets/user_list_widget.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  final int page = 1;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _feedViewModel = Provider.of<FeedViewModel>(context);
    switch (_feedViewModel.fetchState) {
      case ViewState.Initial:
        _feedViewModel.fetchList(widget.page);
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      case ViewState.Success:
        return Scaffold(body: _buildUserList(_feedViewModel.feedElement));
      case ViewState.Error:
        return Scaffold(
          body: Center(
            child: Text('Ooppss.. Something went wrong...'),
          ),
        );
    }
    return Scaffold();
  }

  Widget _buildUserList(List<FeedElement> feedElement) {
    debugPrint(feedElement.toString());
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: feedElement.length, //10
      itemBuilder: (context, index) => UserList(
        userModel: feedElement[index],
      ),
    );
  }



}
