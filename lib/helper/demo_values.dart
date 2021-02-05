import 'package:Foodgraphic/model/comment_model.dart';
import 'package:Foodgraphic/model/post_model.dart';
import 'package:Foodgraphic/model/user_model.dart';

class DemoValues {
  static final List<UserModel> users = [
    UserModel(
      id: "1",
      name: "Aleyxx",
      email: "weine-business@gmx.at",
      image: "assets/images/user.png",
      followers: 123,
      joined: DateTime.now(),
      posts: 12,
    ),
    UserModel(
      id: "2",
      name: "Dennis Sima",
      email: "SIM18354@spengergasse.com",
      image: "assets/images/user.png",
      followers: 456,
      joined: DateTime(2018, 5, 30),
      posts: 13,
    ),
    UserModel(
      id: "3",
      name: "Shakleen",
      email: "shakleen@gmail.com",
      image: "assets/images/frau.jpg",
      followers: 789,
      joined: DateTime(2017, 6, 30),
      posts: 14,
    ),
    UserModel(
      id: "4",
      name: "Christian Waller",
      email: "christian@gmail.com",
      image: "assets/images/mann.jpg",
      followers: 789,
      joined: DateTime(2017, 6, 30),
      posts: 14,
    ),
  ];

  static final String _body =
      """Frisches Baguette bestrichen mit selbstgemachter Mayonnaise!

Als nächstes werden die Gurken in das Baguette gelegt. Eingelegte und feingeschnittene Karotten werden gleichmäßig im Baguette verteilt. 

Im nächsten Schritt wird das Fleisch, Wahlweise Huhn, Bauchfleisch oder Tofu, hinzugefügt. Nun folgt ein wenig Rotkraut und als Topping obendrauf können geriebene Erdnüsse und Röstzwiebel draufgelegt werden. 

Die wichtigste Zutat, der Koriander darf natürlich nicht fehlen!""";

  static final List<CommentModel> _comments = <CommentModel>[
    CommentModel(
      comment: "Wow, sieht richtig lecker aus!",
      user: users[2],
      time: DateTime(2019, 4, 30),
    ),
    CommentModel(
      comment: "Muss ich umbedingt auch mal zubereiten ;)",
      user: users[1],
      time: DateTime(2018, 5, 30),
    ),
    CommentModel(
      comment: "Healthy healthy kann ich nur sagen...",
      user: users[3],
      time: DateTime(2017, 6, 30),
    ),
    CommentModel(
      comment: "Bist du deppat ist das gut",
      user: users[1],
      time: DateTime(2019, 4, 30),
    ),
    CommentModel(
      comment:
          "Kannst du sagen, wie lang du ungefähr gebraucht hast? Möchte das am Wochenende auch machen...",
      user: users[2],
      time: DateTime(2018, 5, 30),
    ),
    CommentModel(
      comment: "Hoffentlich hast du nicht zu viele davon verdrückt - hahaha",
      user: users[3],
      time: DateTime(2017, 6, 30),
    ),
  ];

  static final List<PostModel> posts = [
    PostModel(
      id: "1",
      author: users[0],
      title: "Bahn mi",
      summary: "Fresh and Homemade",
      body: _body,
      imageURL: "assets/images/bahnmi.png",
      postTime: DateTime.now(),
      reacts: 123,
      views: 456,
      comments: _comments,
    ),
    PostModel(
      id: "2",
      author: users[2],
      title: "Veganer Burger",
      summary: "Preaching about oak trees",
      body: _body,
      imageURL: "assets/images/burger.jpg",
      postTime: DateTime(2019, 4, 13),
      reacts: 321,
      views: 654,
      comments: _comments,
    ),
    PostModel(
      id: "3",
      author: users[3],
      title: 'Leckerer Fisch',
      summary:
          "Fischer's Fritz fischt frische Fische. Frische Fische fischen Fischer's Fritz.",
      body: _body * 2,
      imageURL: "assets/images/fisch.jpg",
      postTime: DateTime(2019, 1, 12),
      reacts: 213,
      views: 546,
      comments: _comments,
    ),
    PostModel(
      id: "3",
      author: users[2],
      title: "Power Food",
      summary: "After Workout Snack!!!",
      body: _body * 2,
      imageURL: "assets/images/omlett.jpg",
      postTime: DateTime(2019, 1, 12),
      reacts: 213,
      views: 546,
      comments: _comments,
    ),
    PostModel(
      id: "4",
      author: users[3],
      title: "Zuckersüß",
      summary: "Achtung Kalorienbombe :D",
      body: _body * 2,
      imageURL: "assets/images/tiramesu.jpg",
      postTime: DateTime(2019, 1, 12),
      reacts: 213,
      views: 546,
      comments: _comments,
    ),
  ];
}
