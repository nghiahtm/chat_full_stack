import 'package:chat_app/utils/core/pop_up.dart';
import 'package:chat_app/utils/error/app_error.dart';
import 'package:logger/logger.dart';

Future<void> blocCatching({
  required Future Function() execute,
  Future Function(AppError)? onError,
  bool isShowpopUp = true,
}) async {
  try {
    await execute();
  } on AppError catch (e) {
    // Handle the error here, e.g., log it or show a message to the user
    Logger().e('Error: $e');
    onError?.call(e);
    if (isShowpopUp) {
      popUpResult(content: e.message);
    }
  }
}
