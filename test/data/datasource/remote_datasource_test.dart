import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:robinhood/data/datasource/remote_datasource.dart';
import 'package:robinhood/data/exception.dart';
import 'package:robinhood/data/model/todo_model.dart';
import '../../helpers/json_reader.dart';
import '../../helpers/test_helpers.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late RemoteDataSourceImpl remoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    remoteDataSourceImpl = RemoteDataSourceImpl(client: mockHttpClient);
  });

  const offset = 0;

  group('get todo', () {
    test('should return todo model when the response code is 200', () async {
      //arrange
      when(mockHttpClient.get(Uri.parse(
              "https://todo-list-api-mfchjooefq-as.a.run.app/todo-list?offset=$offset&limit=10&sortBy=createdAt&isAsc=true&status=TODO")))
          .thenAnswer((_) async => http.Response(
              readJson('helpers/dummy_data/dummy_todo_response.json'), 200));

      //act
      final result = await remoteDataSourceImpl.getTodo(offset);

      //assert
      expect(result, isA<Todo>());
    });

    test(
      'should throw a server exception when the response code is 404 or other',
      () async {
        //arrange
        when(
          mockHttpClient.get(Uri.parse(
              "https://todo-list-api-mfchjooefq-as.a.run.app/todo-list?offset=$offset&limit=10&sortBy=createdAt&isAsc=true&status=TODO")),
        ).thenAnswer((_) async => http.Response('Not found', 404));

        //act
        final result = remoteDataSourceImpl.getTodo(offset);

        //assert
        expect(result, throwsA(isA<ServerException>()));
      },
    );
  });

  group('get doing', () {
    test('should return todo model when the response code is 200', () async {
      //arrange
      when(mockHttpClient.get(Uri.parse(
              "https://todo-list-api-mfchjooefq-as.a.run.app/todo-list?offset=$offset&limit=10&sortBy=createdAt&isAsc=true&status=DOING")))
          .thenAnswer((_) async => http.Response(
              readJson('helpers/dummy_data/dummy_doing_response.json'), 200));

      //act
      final result = await remoteDataSourceImpl.getDoing(offset);

      //assert
      expect(result, isA<Todo>());
    });

    test(
      'should throw a server exception when the response code is 404 or other',
      () async {
        //arrange
        when(
          mockHttpClient.get(Uri.parse(
              "https://todo-list-api-mfchjooefq-as.a.run.app/todo-list?offset=$offset&limit=10&sortBy=createdAt&isAsc=true&status=DOING")),
        ).thenAnswer((_) async => http.Response('Not found', 404));

        //act
        final result = remoteDataSourceImpl.getDoing(offset);

        //assert
        expect(result, throwsA(isA<ServerException>()));
      },
    );
  });

  group('get done', () {
    test('should return todo model when the response code is 200', () async {
      //arrange
      when(mockHttpClient.get(Uri.parse(
              "https://todo-list-api-mfchjooefq-as.a.run.app/todo-list?offset=$offset&limit=10&sortBy=createdAt&isAsc=true&status=DONE")))
          .thenAnswer((_) async => http.Response(
              readJson('helpers/dummy_data/dummy_doing_response.json'), 200));

      //act
      final result = await remoteDataSourceImpl.getDone(offset);

      //assert
      expect(result, isA<Todo>());
    });

    test(
      'should throw a server exception when the response code is 404 or other',
      () async {
        //arrange
        when(
          mockHttpClient.get(Uri.parse(
              "https://todo-list-api-mfchjooefq-as.a.run.app/todo-list?offset=$offset&limit=10&sortBy=createdAt&isAsc=true&status=DONE")),
        ).thenAnswer((_) async => http.Response('Not found', 404));

        //act
        final result = remoteDataSourceImpl.getDone(offset);

        //assert
        expect(result, throwsA(isA<ServerException>()));
      },
    );
  });
}
