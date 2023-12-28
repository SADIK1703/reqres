import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reqres/core/init/dependency_injection.dart';
import 'package:reqres/feature/credential/_login_exports.dart';
import 'package:reqres/product/_product_exports.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({final Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(route: Routes.register),
      body: Padding(
        padding: EdgeInsets.only(
          left: 12,
          top: 12 + MediaQuery.of(context).padding.top,
          right: 12,
          bottom: 12 + MediaQuery.of(context).padding.bottom,
        ),
        child: Column(
          children: [
            const Spacer(),
            Text(
              'Login',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const Spacer(),
            const AppTextFormField(hintText: 'Email'),
            const SizedBox(height: 8),
            const AppTextFormField(hintText: 'Password'),
            const Spacer(flex: 3),
            ElevatedButton(
              onPressed: () {
                dependencyInjector<LoginController>().login(context);
              },
              child: const SizedBox(width: double.infinity, child: Center(child: Text('Login'))),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
