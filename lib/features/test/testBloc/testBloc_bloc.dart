import 'package:educare_erp/core/network/apiHelper/resource.dart';
import 'package:educare_erp/core/network/apiHelper/status.dart';
import 'package:educare_erp/features/test/models/post_model.dart';
import 'package:educare_erp/features/test/testBloc/testBloc_event.dart';
import 'package:educare_erp/features/test/testBloc/testBloc_state.dart';
import 'package:educare_erp/features/test/testRepository/test_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  final TestUseCases _testUseCases;
  TestBloc(this._testUseCases) : super(TestInitial()) {
    on<FetchPosts>(_onFetchPosts);
  }

  Future<void> _onFetchPosts(FetchPosts event, Emitter<TestState> emit) async {
    emit(TestLoading());

    try {
      Map<String, dynamic> requestData = {};
      Resource resource =
          await _testUseCases.getPostList(requestData: requestData);

      if (resource.status == STATUS.SUCCESS) {
        List<PostModel> postList =
            (resource.data as List).map((x) => PostModel.fromJson(x)).toList();
        emit(TestLoaded(posts: postList));
      } else {
        emit(TestError(message: resource.message ?? "Failed to fetch data"));
      }
    } catch (e) {
      emit(TestError(message: e.toString()));
    }
  }
}
