
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/routes.dart';
import 'package:ulearning_app/common/utils/app_styles.dart';
import 'package:ulearning_app/global.dart';


Future<void> main() async {
  await Global.init();
  runApp(const ProviderScope(child: MyApp()));
}

final GlobalKey<NavigatorState> navKey =  GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child)=>MaterialApp(
        navigatorKey: navKey,
        theme: AppTheme.appThemeData,
        onGenerateRoute: AppPages.generateRouteSettings,
      ),
    );
  }
}


// final appCount = StateProvider<int>((ref) => 1);
//
// class MyHomePage extends ConsumerWidget {
//   const MyHomePage({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final counter = ref.watch(appCount);
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: const Text("RiverPod App"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               counter.toString(),
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         // mainAxisSize: MainAxisSize.min,
//         children: [
//           FloatingActionButton(
//             heroTag: "one",
//             onPressed: () {
//               Navigator.of(context).push(MaterialPageRoute(
//                   builder: (BuildContext context) => const SecondPage()));
//             },
//             tooltip: 'Increment',
//             child: const Icon(Icons.arrow_forward),
//           ),
//           FloatingActionButton(
//             heroTag: "two",
//             onPressed: () => ref.read(appCount.notifier).state++,
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class SecondPage extends ConsumerWidget {
//   const SecondPage({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     int count = ref.watch(appCount);
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Text("$count"),
//       ),
//     );
//   }
// }
