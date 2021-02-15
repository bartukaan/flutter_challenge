import 'package:flutter/material.dart';
import 'package:flutter_challenge/models/feed_model.dart';
import 'package:flutter_challenge/utilities/constants.dart';

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
            flexibleSpace: Stack(
              children: [
                FlexibleSpaceBar(
                  centerTitle: true,
                  background: userModel.cover != null
                      ? Image.network(
                          userModel.cover,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          userModel.photo,
                          fit: BoxFit.cover,
                        ),
                ),
                _buildProfileImage(context),
              ],
            ),
          ),
          _buildUserName(),
          _buildFollowersCount(),
          _buildCreatedDate(),
        ],
      ),
    );
  }

  Container _buildProfileImage(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(
          (MediaQuery.of(context).size.width - radius * 2) * 0.5,
          MediaQuery.of(context).size.height * 0.34,
          0.0),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: radius,
        child: ClipOval(
          child: Image.network(userModel.photo, fit: BoxFit.cover),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildUserName() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: radius),
        child: Text(
          userModel.name,
          style: TextStyle(
              fontSize: constantSize * 2, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildFollowersCount() {
    return SliverToBoxAdapter(
      child: Padding(
        padding:  EdgeInsets.only(top: constantSize),
        child: Text(
          '${userModel.followerCount} Followers',
          style: TextStyle(fontSize: constantSize),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildCreatedDate() {
    return SliverToBoxAdapter(
      child: Text(
        userModel.createdAt,
        style: TextStyle(fontSize: constantSize),
        textAlign: TextAlign.center,
      ),
    );
  }
}
