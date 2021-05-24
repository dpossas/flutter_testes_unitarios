import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testes_unitarios/controller/home_controller.dart';
import 'package:flutter_testes_unitarios/repository/home_repository.dart';
import 'package:mockito/mockito.dart';

class HomeRepositoryMock extends Mock implements IHomeRepository {}

void main() {
  IHomeController controller;
  IHomeRepository repository;

  setUp(() async {
    repository = HomeRepositoryMock();
    controller = HomeController(repository);
  });

  testWidgets('Should validate controller methods', (tester) async {
    when(repository.readCurrentIndex()).thenAnswer((_) => Future.value(0));
    expect(await controller.currentIndex, 0);
    verify(repository.readCurrentIndex()).called(1);

    await controller.setCurrentIndex(1);
    verify(repository.saveCurrentIndex(any)).called(1);
  });
}
