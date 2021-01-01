import 'package:flutter/material.dart';
import 'package:Foodgraphic/model/post_model.dart';
import 'package:Foodgraphic/view/widgets/inherited_widgets/inherited_post_model.dart';

class PostStats extends StatelessWidget {
  const PostStats({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PostModel postData = InheritedPostModel.of(context).postData;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ShowStat(
          icon: Icons.favorite_border_outlined,
          number: postData.reacts,
          color: Colors.red,
        ),
        ShowStat(
          icon: Icons.remove_red_eye,
          number: postData.views,
          color: Colors.green[900],
        ),
      ],
    );
  }
}

class ShowStat extends StatefulWidget {
  final IconData icon;
  final int number;
  final Color color;

  const ShowStat({
    Key key,
    @required this.icon,
    @required this.number,
    @required this.color,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ShowStatState(icon, number, color);
  }
}

class ShowStatState extends State<ShowStat> {
  IconData icon;
  int number;
  final Color color;

  ShowStatState(this.icon, this.number, this.color);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
            onTap: () {
              setState(() {
                if (icon != Icons.remove_red_eye &&
                    icon == Icons.favorite_border_outlined) {
                  icon = Icons.favorite;
                  number += 1;
                } else if (icon != Icons.remove_red_eye &&
                    icon == Icons.favorite) {
                  icon = Icons.favorite_border_outlined;
                  number--;
                }
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 2.0),
              child: Icon(icon, color: color),
            )),
        Text(number.toString()),
      ],
    );
  }
}
