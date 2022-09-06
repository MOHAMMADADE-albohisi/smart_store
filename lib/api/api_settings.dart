class ApiSettings {
  static const String _baseUrl = "https://smart-store.mr-dev.tech/api/";
  static const String login = '${_baseUrl}auth/login';
  static const String register = '${_baseUrl}auth/register';
  static const String STORE_API_KEY = 'a6c2edcb-9738-425a-be8c-a94bff9a68d0';
  static const String logout = '${_baseUrl}auth/logout';
  static const String cities = '${_baseUrl}cities';
  static const String activate = '${_baseUrl}auth/activate';
  static const String categories = '${_baseUrl}categories';
  static const String home = '${_baseUrl}home';
  static const String sub_categories = '${_baseUrl}categories/{id}';
  static const String products = '${_baseUrl}sub-categories/{id}';
}
