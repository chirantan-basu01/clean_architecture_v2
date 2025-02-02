import 'package:educare_erp/core/network/apiHelper/resource.dart';

abstract class TestUseCases {
  Future<Resource> getPostList({required Map<String, dynamic> requestData});
  Future<Resource> getAddressList({required Map<String, dynamic> requestData});
}
