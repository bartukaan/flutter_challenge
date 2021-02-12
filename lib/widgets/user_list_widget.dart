import 'package:flutter/material.dart';
import 'package:flutter_challenge/models/feed_model.dart';
import 'package:flutter_challenge/screens/user_detail_screen.dart';
import 'package:jiffy/jiffy.dart';

class UserList extends StatelessWidget {
  final FeedElement userModel;

  const UserList({Key key,@required this.userModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()  => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserDetail(userModel: userModel,))),
      child: ListTile(
        leading: Image.network(userModel.photo),
        title: Text(userModel.name, style:TextStyle(fontSize: 25.0)),
        subtitle: Text('${userModel.followerCount} FOLLOWERS' ),
        trailing: Text('${Jiffy(userModel.createdAt, "yyyy-MM-dd").fromNow()}',style: TextStyle(color: Colors.blue),),
      ),
    );;
  }
}
