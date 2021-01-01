import 'package:flutter/material.dart';
import 'package:Foodgraphic/model/user_model.dart';
import 'package:Foodgraphic/view/widgets/user_details.dart';

class UserDetailsWithFollowKeys {
  static final ValueKey userDetails = ValueKey("UserDetails");
  static final ValueKey follow = ValueKey("follow");
}

class UserDetailsWithFollow extends StatefulWidget {
  final UserModel userData;

  const UserDetailsWithFollow({Key key, @required this.userData})
      : super(key: key);
  @override
  _UserDetailsWithFollowState createState() =>
      _UserDetailsWithFollowState(userData);
}

class _UserDetailsWithFollowState extends State<UserDetailsWithFollow> {
  final UserModel userData;
  IconData icon = Icons.group_add;

  _UserDetailsWithFollowState(this.userData);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: UserDetails(
            key: UserDetailsWithFollowKeys.userDetails,
            userData: userData,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            key: UserDetailsWithFollowKeys.follow,
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(icon),
              onPressed: () {
                setState(() {
                  if (icon == Icons.group_add) {
                    icon = Icons.how_to_reg;
                  } else {
                    icon = Icons.group_add;
                  }
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
