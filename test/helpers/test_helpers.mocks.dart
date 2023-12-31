// Mocks generated by Mockito 5.4.2 from annotations
// in robinhood/test/helpers/test_helpers.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:convert' as _i13;
import 'dart:typed_data' as _i14;

import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:robinhood/data/datasource/remote_datasource.dart' as _i9;
import 'package:robinhood/data/failure.dart' as _i7;
import 'package:robinhood/data/model/todo_model.dart' as _i3;
import 'package:robinhood/domain/entities/task_entity.dart' as _i8;
import 'package:robinhood/domain/repositories/repository.dart' as _i4;
import 'package:robinhood/domain/usecases/doing_usecase.dart' as _i11;
import 'package:robinhood/domain/usecases/done_usecase.dart' as _i12;
import 'package:robinhood/domain/usecases/todo_usecase.dart' as _i10;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTodo_1 extends _i1.SmartFake implements _i3.Todo {
  _FakeTodo_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTaskRepository_2 extends _i1.SmartFake
    implements _i4.TaskRepository {
  _FakeTaskRepository_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_3 extends _i1.SmartFake implements _i5.Response {
  _FakeResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_4 extends _i1.SmartFake
    implements _i5.StreamedResponse {
  _FakeStreamedResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TaskRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTaskRepository extends _i1.Mock implements _i4.TaskRepository {
  MockTaskRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TaskEntity>?>> getTodo(
          int? offset) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTodo,
          [offset],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, List<_i8.TaskEntity>?>>.value(
                _FakeEither_0<_i7.Failure, List<_i8.TaskEntity>?>(
          this,
          Invocation.method(
            #getTodo,
            [offset],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TaskEntity>?>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TaskEntity>?>> getDoing(
          int? offset) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDoing,
          [offset],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, List<_i8.TaskEntity>?>>.value(
                _FakeEither_0<_i7.Failure, List<_i8.TaskEntity>?>(
          this,
          Invocation.method(
            #getDoing,
            [offset],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TaskEntity>?>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TaskEntity>?>> getDone(
          int? offset) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDone,
          [offset],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, List<_i8.TaskEntity>?>>.value(
                _FakeEither_0<_i7.Failure, List<_i8.TaskEntity>?>(
          this,
          Invocation.method(
            #getDone,
            [offset],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TaskEntity>?>>);
}

/// A class which mocks [RemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoteDataSource extends _i1.Mock implements _i9.RemoteDataSource {
  MockRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i3.Todo> getTodo(int? offset) => (super.noSuchMethod(
        Invocation.method(
          #getTodo,
          [offset],
        ),
        returnValue: _i6.Future<_i3.Todo>.value(_FakeTodo_1(
          this,
          Invocation.method(
            #getTodo,
            [offset],
          ),
        )),
      ) as _i6.Future<_i3.Todo>);

  @override
  _i6.Future<_i3.Todo> getDoing(int? offset) => (super.noSuchMethod(
        Invocation.method(
          #getDoing,
          [offset],
        ),
        returnValue: _i6.Future<_i3.Todo>.value(_FakeTodo_1(
          this,
          Invocation.method(
            #getDoing,
            [offset],
          ),
        )),
      ) as _i6.Future<_i3.Todo>);

  @override
  _i6.Future<_i3.Todo> getDone(int? offset) => (super.noSuchMethod(
        Invocation.method(
          #getDone,
          [offset],
        ),
        returnValue: _i6.Future<_i3.Todo>.value(_FakeTodo_1(
          this,
          Invocation.method(
            #getDone,
            [offset],
          ),
        )),
      ) as _i6.Future<_i3.Todo>);
}

/// A class which mocks [GetTodo].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTodo extends _i1.Mock implements _i10.GetTodo {
  MockGetTodo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.TaskRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTaskRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.TaskRepository);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TaskEntity>?>> execute(
          int? offset) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [offset],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, List<_i8.TaskEntity>?>>.value(
                _FakeEither_0<_i7.Failure, List<_i8.TaskEntity>?>(
          this,
          Invocation.method(
            #execute,
            [offset],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TaskEntity>?>>);
}

/// A class which mocks [GetDoing].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetDoing extends _i1.Mock implements _i11.GetDoing {
  MockGetDoing() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.TaskRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTaskRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.TaskRepository);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TaskEntity>?>> execute(
          int? offset) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [offset],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, List<_i8.TaskEntity>?>>.value(
                _FakeEither_0<_i7.Failure, List<_i8.TaskEntity>?>(
          this,
          Invocation.method(
            #execute,
            [offset],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TaskEntity>?>>);
}

/// A class which mocks [GetDone].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetDone extends _i1.Mock implements _i12.GetDone {
  MockGetDone() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.TaskRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTaskRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.TaskRepository);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TaskEntity>?>> execute(
          int? offset) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [offset],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, List<_i8.TaskEntity>?>>.value(
                _FakeEither_0<_i7.Failure, List<_i8.TaskEntity>?>(
          this,
          Invocation.method(
            #execute,
            [offset],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TaskEntity>?>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i5.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i5.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i5.Response>);

  @override
  _i6.Future<_i5.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i5.Response>);

  @override
  _i6.Future<_i5.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i13.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i5.Response>);

  @override
  _i6.Future<_i5.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i13.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i5.Response>);

  @override
  _i6.Future<_i5.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i13.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i5.Response>);

  @override
  _i6.Future<_i5.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i13.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i5.Response>);

  @override
  _i6.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);

  @override
  _i6.Future<_i14.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i14.Uint8List>.value(_i14.Uint8List(0)),
      ) as _i6.Future<_i14.Uint8List>);

  @override
  _i6.Future<_i5.StreamedResponse> send(_i5.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i6.Future<_i5.StreamedResponse>.value(_FakeStreamedResponse_4(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i6.Future<_i5.StreamedResponse>);

  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
