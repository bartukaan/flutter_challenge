import 'package:flutter/material.dart';
import 'package:flutter_challenge/enums/view_state_enum.dart';
import 'package:flutter_challenge/models/feed_model.dart';
import 'package:flutter_challenge/utilities/constants.dart';
import 'package:flutter_challenge/view_models/feed_view_model.dart';
import 'package:flutter_challenge/widgets/user_list_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final int pageNumber;

  const HomeScreen({Key key, @required this.pageNumber}) : super(key: key);

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
        _feedViewModel.fetchList(widget.pageNumber);
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      case ViewState.Success:
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildUserList(_feedViewModel.feedElement),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlatButton.icon(
                    onPressed: () {},
                    label: Text('By Time',style: buttonTextStyle),
                    icon: Icon(Icons.history_toggle_off_sharp,size: 35,),
                  ),
                  FlatButton.icon(
                      onPressed: () {},
                      label: Text('Popularity',style: buttonTextStyle),
                      icon: Icon(Icons.face,size: 35,))
                ],
              )
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
