import 'package:smart_store/model_api/api_response.dart';

mixin ApiHelper {
  ApiResponse get errorResponse =>
      ApiResponse('Something went wrong,try again!', false);
}
