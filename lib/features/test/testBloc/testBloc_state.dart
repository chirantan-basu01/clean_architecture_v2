import 'package:educare_erp/features/test/models/post_model.dart';
import 'package:equatable/equatable.dart';

abstract class TestState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TestInitial extends TestState {}

class TestLoading extends TestState {}

class TestLoaded extends TestState {
  final List<PostModel> posts;
  TestLoaded({required this.posts});

  @override
  List<Object?> get props => [posts];
}

class TestError extends TestState {
  final String message;
  TestError({required this.message});

  @override
  List<Object?> get props => [message];
}
