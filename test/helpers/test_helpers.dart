import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:robinhood/data/datasource/remote_datasource.dart';
import 'package:robinhood/domain/repositories/repository.dart';
import 'package:robinhood/domain/usecases/doing_usecase.dart';
import 'package:robinhood/domain/usecases/done_usecase.dart';
import 'package:robinhood/domain/usecases/todo_usecase.dart';

@GenerateMocks(
  [TaskRepository, RemoteDataSource, GetTodo, GetDoing, GetDone],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
