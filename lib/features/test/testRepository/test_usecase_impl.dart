import 'package:educare_erp/core/network/apiClientRepository/api_client.dart';
import 'package:educare_erp/core/network/apiHelper/api_endpoint.dart';
import 'package:educare_erp/core/network/apiHelper/locator.dart';
import 'package:educare_erp/core/network/apiHelper/resource.dart';
import 'package:educare_erp/features/test/testRepository/test_usecase.dart';

class TestUseCaseImplementation extends TestUseCases{

  final ApiClient _apiClient = getIt<ApiClient>();

  @override
  Future<Resource> getPostList({required Map<String, dynamic> requestData}) async {

    // String token = await _pref.getUserAuthToken();
    String token = "Bearer 28|AvCjFi06f9cftcT4o1DxfsX5Lhp3XZs7gjNWocOP338d1a84";
    Map<String, String> header = {
       //"Authorization": token ,
    };
    Resource resource =
        await _apiClient.getRequest(url:ApiEndPoint.test,header: header, requestData:requestData );
    if (resource.status == "true") {
      return resource;

    } else {
      return resource;
    }

  }

  @override
  Future<Resource> getAddressList({required Map<String, dynamic> requestData}) async {
    String token = "Bearer 28|AvCjFi06f9cftcT4o1DxfsX5Lhp3XZs7gjNWocOP338d1a84";
    Map<String, String> header = {
      //"Authorization": token ,
    };
    Resource resource =
        await _apiClient.getRequest(url:ApiEndPoint.test1,header: header, requestData:requestData );
    if (resource.status == "true") {
      return resource;

    } else {
      return resource;
    }
  }


}