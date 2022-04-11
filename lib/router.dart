import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'main.dart';
import 'user.dart';

// My favorite approach.
// There's room for improvement, but it works fine.
// Other approaches can be found in the /others folder

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    // Keep this to `true` if want to know what's going on under the hood
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
    refreshListenable: RouterNotifier(ref),
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

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  /// Creates a Notifier to be used in GoRouter
  ///
  /// GoRouter's refreshListenable only accepts a `Listenable` object:
  /// therefore, `ChangeNotifier` is used here; since `StateNotifier` is not
  /// a `Listenable`, this choice is forced. While there are other options, my
  /// personal preference is to use this approach. Please check out the others/
  /// folder for more implementation options.
  ///
  /// Please recall that `ChangeNotifier` is to be avoided anywhere else.
  /// https://riverpod.dev/docs/concepts/providers/#different-types-of-providers
  ///
  /// This implementation exploits `ref.listen()` to add a callback which
  /// simply calls `notifyListeners()` whenever there's change onto a state.
  RouterNotifier(this._ref) {
    _ref.listen<User?>(
      userProvider,
      (_, __) => notifyListeners(),
    );
  }
}
