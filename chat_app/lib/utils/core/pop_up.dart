import 'package:chat_app/app/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

Future<void> popUpResult<T>({
  String? message,
  String? content,
  Future Function(T? res)? onResult,
  Future<void> Function()? onTap,
}) async {
  final router = GetIt.instance.get<AppRouter>();

  final data = await showDialog(
    context: router.navigatorKey.currentContext!,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      title: Text(message ?? 'Alert'),
      content: Text(content ?? ''),
      actions: [
        TextButton(
          onPressed: () async {
            await onTap?.call();
            router.pop(true);
          },
          child: const Text('Confirm'),
        ),
        TextButton(
          onPressed: () => router.pop(false),
          child: const Text('Cancel'),
        ),
      ],
    ),
  );
  onResult?.call(data);
}
