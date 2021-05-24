import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testes_unitarios/controller/home_controller.dart';
import 'package:flutter_testes_unitarios/view/home_page.dart';
import 'package:mockito/mockito.dart';

class HomeControllerMock extends Mock implements IHomeController {}

void main() {
  IHomeController controller;
  setUp(() async {
    controller = HomeControllerMock();

    when(controller.currentIndex).thenAnswer((_) => Future.value(0));
    when(controller.setCurrentIndex(any))
        .thenAnswer((realInvocation) => Future.value());
  });

  testWidgets('Should validate basic widgets', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: HomePage(controller: controller),
    ));

    final title = find.text('Website Update');
    expect(title, findsOneWidget);

    final appBar = find.byType(AppBar);
    expect(appBar, findsOneWidget);

    final appBarWidget = tester.widget<AppBar>(appBar);
    expect(appBarWidget.actions.length, 2);

    final listViewCopy = find.byKey(const Key('list-view-copy'));
    expect(listViewCopy, findsOneWidget);

    final bottomNavigationbar = find.byType(BottomNavigationBar);
    expect(bottomNavigationbar, findsOneWidget);
  });

  testWidgets('Should validate basic widgets', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: HomePage(controller: controller),
    ));

    final bottomNavigationbar = find.byType(BottomNavigationBar);
    final bottomWidget =
        tester.widget<BottomNavigationBar>(bottomNavigationbar);

    expect(bottomWidget.currentIndex, 0);

    final item2 = find.text('Item 2');
    expect(item2, findsOneWidget);

    await tester.tap(item2);
    await tester.pump();

    verify(controller.setCurrentIndex(any)).called(1);
  });
}
