import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:imagify/app/core/logger/provider_observer.dart';
import 'package:imagify/app/features/lander/view/lander.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

void main() async {
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };
  runApp(ProviderScope(
    observers: [
      AppObserver(),
    ],
    child: const Imagify(),
  ));
}

class Imagify extends HookConsumerWidget {
  const Imagify({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Lander());
  }
}
