class ApiEndpoints {
  //base url
  static const String baseUrl = 'https://assessment.eltglobal.in/api';

  //end points
  static const String getUserRegisterEndPoint = "$baseUrl/auth/register";
  static String getBookEndPoint = "$baseUrl/books?page=1&limit=100";
  static String getAuthorsListEndPoint = "$baseUrl/authors";
  static String addRatingEndPoint(String bookID) =>
      "$baseUrl/books/$bookID?ratings:add";
  static String getBookByIDEndPoint(String bookID) => "$baseUrl/books/$bookID";
}
