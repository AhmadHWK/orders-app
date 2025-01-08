import 'package:dio/dio.dart';

class ServerException implements Exception {
  final String errMessage;

  ServerException({required this.errMessage});
}

class DioExceptionHandler {
  static void handleDioException(Object error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          throw ServerException(
              errMessage: " خطأ الاتصال يرجى المحاولة مرة أخرى");
        case DioExceptionType.sendTimeout:
          throw ServerException(
              errMessage: "انتهت مهلة الطلب , يرجى المحاولة مرة أخرى");
        case DioExceptionType.receiveTimeout:
          throw ServerException(
              errMessage: "انتهت مهلة الاستجابة , يرجى المحاولة مرة أخرى");
        case DioExceptionType.badResponse:
          if (error.response != null) {
            switch (error.response!.statusCode) {
              case 401:
                throw ServerException(
                    errMessage: "طلب غير صالح , يرجى التحقق من المدخلات");
              case 400:
                throw ServerException(
                    errMessage: "غير مصرح , يرجى تسجيل الدخول مجددًا");
              case 403:
                throw ServerException(errMessage: "رقم الهاتف موجود بالفعل");
              case 404:
                throw ServerException(errMessage: "المورد غير موجود");
              case 500:
                throw ServerException(
                    errMessage: "خطأ في الخادم , يرجى المحاولة لاحقًا");
              default:
                throw ServerException(
                    errMessage: "حدث خطأ غير متوقع , يرجى المحاولة مجددًا");
            }
          }
          throw ServerException(errMessage: "استجابة غير صالحة");
        case DioExceptionType.cancel:
          throw ServerException(errMessage: "تم إلغاء الطلب");
        case DioExceptionType.unknown:
          throw ServerException(
              errMessage: "حدث خطأ غير متوقع , يرجى المحاولة مجددًا");
        case DioExceptionType.badCertificate:
          throw ServerException(
              errMessage: "فشل التحقق من الشهادة , تأكد من صحة الشهادة");
        case DioExceptionType.connectionError:
          throw ServerException(
              errMessage: "خطأ في الاتصال , يرجى التحقق من اتصالك بالإنترنت");
      }
    }
    throw ServerException(
        errMessage: "حدث خطأ غير متوقع , يرجى المحاولة مجددًا");
  }
}
