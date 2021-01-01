import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:Foodgraphic/helper/demo_values.dart';
import 'package:Foodgraphic/model/post_model.dart';
import 'package:Foodgraphic/view/widgets/inherited_widgets/inherited_post_model.dart';
import 'package:Foodgraphic/view/widgets/post_time_stamp.dart';

void main() {
  final PostModel _postData = DemoValues.posts[0];
  final Widget testWidget = MaterialApp(
    home: InheritedPostModel(postData: _postData, child: PostTimeStamp()),
  );

  group("Testing PostTimeStamp widget", () {
    testWidgets("Exactly one Text", (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      expect(find.byType(Text), findsOneWidget);
    });

    testWidgets("Exactly one Container", (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets("Formatted Date Time", (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      expect(find.text(_postData.postTimeFormatted), findsOneWidget);
    });
  });
}
