abstract class BaseApiServices {
  // For Get request
  Future<dynamic> getGetApiResponse(String url);

  // For Post Api Response
  Future<dynamic> getPostApiResponse(String url, dynamic data);
}
