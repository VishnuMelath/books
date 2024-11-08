class ApiEndpoints {
  //base url
  static const String baseUrl = 'https://assessment.eltglobal.in/api';

  //end points
  static const String getUserRegisterEndPoint = "$baseUrl/auth/register";
  static String getFeatureById(int id) => "$baseUrl/feature/$id";
}
