class Strings {
  const Strings._();

  static const String checkInternet = "تأكد من اتصالك بالانترنيت";
  static const String unexpectedError = "حدث خطأ غير متوقع";
  // static const String unknownError = "حدث خطأ غير معروف";

  static String unknownError({required int statusCode, required String body}) =>
      {
        "statusCode": statusCode,
        "body": body.substring(0, body.length > 200 ? 200 : body.length - 1),
      }.toString();
}
