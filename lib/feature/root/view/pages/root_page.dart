import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reqres/core/init/dependency_injection.dart';
import 'package:reqres/feature/root/controller/root_controller.dart';

import '../../../../product/_product_exports.dart';

class RootPage extends ConsumerStatefulWidget  {
  const RootPage({final Key? key}) : super(key: key);

  @override
  RootPageState createState() => RootPageState();
}

class RootPageState extends ConsumerState<RootPage> {

  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback(
      (final _) async {
        final DataState<Routes> dataState = await dependencyInjector<RootController>().onInit();
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacementNamed(dataState.data!.name);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
