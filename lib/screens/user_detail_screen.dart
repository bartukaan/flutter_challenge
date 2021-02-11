import 'package:flutter/material.dart';
import 'package:flutter_challenge/models/feed_model.dart';

class UserDetail extends StatelessWidget {
  final FeedElement userModel;

  const UserDetail({Key key, @required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            floating: false,
            pinned: true,
            snap: false,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Image.network(
                userModel.cover,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Positioned(
              top: MediaQuery.of(context).size.height * 0.05,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 70,
                child: ClipOval(
                  child: Image.network(
                    userModel.photo,fit: BoxFit.cover
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              userModel.name,
              style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top:18.0),
              child: Text(
                '${userModel.followerCount} Followers',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              userModel.createdAt,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
/*

Text(
           userModel.name,
           style: TextStyle(fontSize: 18),
           textAlign: TextAlign.center,
         ),
 */
