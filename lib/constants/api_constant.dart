  class ApiConstant {
  static const _baseUrl = 'https://nimbus-api-vtoz.onrender.com/api/v1';

  static const String logInApi = '$_baseUrl/auth/login';
  static const String registerApi = '$_baseUrl/auth/register';
  static const String rememberMeApi = '$_baseUrl/auth/me';
  static const String regionApi = '$_baseUrl/cities/regions';
  static const String cityApi = '$_baseUrl/cities';


  // static String cityApi (int page) {
  //   return '$_baseUrl/cities?page=$page&limit=8';
  // }
  }
