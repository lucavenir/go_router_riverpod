import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../main.dart';
import '../user.dart';

// Yet another possible approach.
// In here we build a `Listenable` object through `ValueNotifier`, which is
// just a simple `ChangeNotifier` that calls `notifyListeners` when the value
// changes, and that allows us to implement our custom logic.
// This implementation is a shorthand version of the first example, while still
// maintaining some easy-to-introduce customizations. However, it has a less
// readable implementation: here ValueNotifier exposes a useless value, which is
// not actually being used. Furthermore, we are forced to overwrite its value to
// trigger `notifyListeners`, even though such instruction makes no sense.
// Simply put - this is not clean code (it works because of side effects).
final router3Provider = Provider<GoRouter>((ref) {
  final listenable = ValueNotifier<bool>(true);

  ref.listen<User?>(userProvider, (oldUser, next) {
    // This is just to trigger `notifyListeners` within the `ValueNotifier`
    listenable.value = !listenable.value;
  });

  return GoRouter(
    debugLogDiagnostics: true,
    redirect: (state) {
      // We want to READ the state, here.
      // GoRouter is already aware of state changes through `refreshListenable`
      // We don't want to trigger a rebuild of this provider.
      final user = ref.read(userProvider);

      // From here we can use the state and implement our custom logic
      final areWeLoggingIn = state.location == '/login';

      if (user == null) {
        // We're not logged in
        // So, IF we aren't in the login page, go there.
        return areWeLoggingIn ? null : '/login';
      }
      // We're logged in

      // At this point, IF we're in the login page, go to the home page
      if (areWeLoggingIn) return '/';

      // There's no need for a redirect at this point.
      return null;
    },
    // This is crucial to make the router work with Riverpod.
    refreshListenable: listenable,
    routes: [
      GoRoute(
        name: "home",
        path: '/',
        builder: (context, _) => const HomePage(),
      ),
      GoRoute(
        name: "login",
        path: '/login',
        builder: (context, _) => const LoginPage(),
      ),
    ],
  );
});
