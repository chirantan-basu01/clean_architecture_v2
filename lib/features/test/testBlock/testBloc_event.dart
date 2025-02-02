import 'package:equatable/equatable.dart';

abstract class TestEvent extends Equatable{

  @override
  List<Object?> get props =>[];
}

class FetchPosts extends TestEvent{}
