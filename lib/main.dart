import 'package:flutter/material.dart';
import 'package:intercom_flutter/intercom_flutter.dart';
import 'package:holedo/layouts/page_scaffold.dart';
import 'package:holedo/layouts/pages/content_page.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/presentation/providers/profile_provider.dart';
import 'package:holedo/presentation/theme/light_theme.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:routemaster/routemaster.dart';
import 'includes/url_strategy.dart';

void main() async {
  usePathUrlStrategy();

  await Get.put(HoledoDatabase()).init();
  WidgetsFlutterBinding.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();

  await Intercom.instance.initialize('c6v4qg56',
      iosApiKey: 'ios_sdk-3a9bbf8f38e388199f2031358d7f8c350c2a4e39',
      androidApiKey: 'android_sdk-3c65cc36ee07675515866bac0090c30e84d03da6');

  runApp(HoledoApp());
}

bool _isValidCategory(String? category) {
  return Get.put(HoledoDatabase()).articleCategories.any(
        (e) => e.slug == category,
      );
}

bool _isValidPage(String? slug) {
  return Get.put(HoledoDatabase()).pages.any(
        (e) => e.slug == slug,
      );
}

bool _isValidCompany(String? slug) {
  return Get.put(HoledoDatabase()).companies.any(
        (e) => e.slug == slug,
      );
}

bool _isValidBookId(String? id) {
  return true;
  //holedoDatabase.books.any((book) => book.id == id);
}

final holedoDatabase = Get.put(HoledoDatabase());
var dataModel = holedoDatabase.getModel();

// ignore: prefer_expression_function_bodies
RouteMap _buildRouteMap(BuildContext context) {
  return RouteMap(
    // ignore: prefer_expression_function_bodies
    onUnknownRoute: (path) {
      return NoAnimationPage(
        child: PageScaffold(
          title: 'Page not found',
          body: Center(
            child: Text(
              "Couldn't find page '$path'",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ),
      );
    },
    routes: {
      '/': (route) => NoAnimationPage(child: HomePage()),
      '/home': (route) => NoAnimationPage(child: HomePage()),
      '/help': (route) => NoAnimationPage(child: HomePage()),
      '/pages/:slug': (route) => _isValidPage(route.pathParameters['slug'])
          ? NoAnimationPage(
              child: ContentPage(slug: route.pathParameters['slug']!))
          : NotFound(),

      '/:slug': (route) => _isValidPage(route.pathParameters['slug'])
          ? NoAnimationPage(
              child: ContentPage(slug: route.pathParameters['slug']!))
          : Redirect('/'),
      '/login': (route) => NoAnimationPage(
            child: LoginPage(
              redirectTo: route.queryParameters['redirectTo'],
            ),
          ),
      '/logout': (route) {
        final appState = Provider.of<AppState>(context, listen: false);
        if (appState.isLoggedIn) {
          appState.username = null;
          appState.profile = null;
        }
        return Redirect('/login', queryParameters: {'redirectTo': route.path});
      },
      '/recruitments': (route) => NoAnimationPage(child: RecruitmentPage()),
      '/recruitments/:id': (route) =>
          NoAnimationPage(child: ProfilePage(id: route.pathParameters['id']!)),
      '/news': (route) => TabPage(
            child: NewsfrontPage(),
            paths: Get.put(HoledoDatabase()).articlePaths,
            pageBuilder: (child) => NoAnimationPage(child: child),
          ),
      /*'/news/all': (route) => NoAnimationPage(
            child: NewsfrontListPage(mode: 'all'),
          ),
      '/news/featured': (route) => NoAnimationPage(
            child: NewsfrontListPage(mode: 'featured'),
          ),*/
      '/news/:category': (route) =>
          _isValidCategory(route.pathParameters['category'])
              ? NoAnimationPage(
                  child: NewsfrontListPage(
                      mode: route.pathParameters['category'] as String,
                      category: Get.put(HoledoDatabase())
                          .articleCategories
                          .firstWhere(
                            (e) => e.slug == route.pathParameters['category'],
                          )))
              : NotFound(),
      '/category/:category': (route) =>
          _isValidCategory(route.pathParameters['category'])
              ? NoAnimationPage(
                  child: CategoryPage(
                    category:
                        Get.put(HoledoDatabase()).articleCategories.firstWhere(
                              (e) => e.slug == route.pathParameters['category'],
                            ),
                  ),
                )
              : NotFound(),
      '/testpage': (route) => NoAnimationPage(
          child: NewsPageASD(slug: route.pathParameters['slug'])),
      '/testpage/:slug': (route) => NoAnimationPage(
          child: NewsPageASD(slug: route.pathParameters['slug'])),
      '/article/:category/:slug': (route) =>
          NoAnimationPage(child: NewsPage(slug: route.pathParameters['slug'])),
      '/news2/:category/:id': (route) => _isValidCategory(
              route.pathParameters['category'])
          ? NoAnimationPage(child: NewsPage(id: route.pathParameters['id']!))
          : NotFound(),
      '/jobs': (route) => TabPage(
            child: JobsfrontPage(),
            paths: ['all', 'premium'],
            pageBuilder: (child) => NoAnimationPage(child: child),
          ),
      '/jobs/all': (route) => NoAnimationPage(
            child: JobsfrontListPage(mode: 'all'),
          ),
      '/jobs/premium': (route) => NoAnimationPage(
            child: JobsfrontListPage(mode: 'premium'),
          ),
      '/jobs/all/:slug': (route) =>
          _isValidCompany(route.pathParameters['slug'])
              ? NoAnimationPage(
                  child: JobsfrontListPage(
                    mode: 'all',
                    company: Get.put(HoledoDatabase()).companies.firstWhere(
                          (e) => e.slug == route.pathParameters['slug'],
                        ),
                  ),
                )
              : NotFound(),
      '/jobs/premium/:slug': (route) =>
          _isValidCompany(route.pathParameters['slug'])
              ? NoAnimationPage(
                  child: JobsfrontListPage(
                    mode: 'premium',
                    company: Get.put(HoledoDatabase()).companies.firstWhere(
                          (e) => e.slug == route.pathParameters['slug'],
                        ),
                  ),
                )
              : NotFound(),
      '/job/:id': (route) =>
          NoAnimationPage(child: JobsPage(slug: route.pathParameters['id'])),
      '/search': (route) => NoAnimationPage(
              child: SearchPage(
            query: route.queryParameters['query'] ?? '',
            sortOrder: SortOrder.values.firstWhere(
              (e) => e.queryParam == route.queryParameters['sort'],
              orElse: () => SortOrder.name,
            ),
          )),
      '/profile': (route) {
        final appState = Provider.of<AppState>(context, listen: false);
        if (appState.isLoggedIn) {
          return Redirect('/profile/${appState.profile?.slug}');
        }
        return Redirect('/login', queryParameters: {'redirectTo': route.path});
      },
      '/profile/:id': (route) =>
          NoAnimationPage(child: ProfilePage(slug: route.pathParameters['id'])),
      //'/profile/add': (route) => AddProfilePage(),
      '/interactive/:id': (route) {
        final appState = Provider.of<AppState>(context, listen: false);

        if (appState.isLoggedIn) {
          return NoAnimationPage(
            child: ProfilePage(id: route.pathParameters['id']),
          );
        }

        return Redirect('/login', queryParameters: {'redirectTo': route.path});
      },
    },
  );
}

final loggedOutRouteMap = RouteMap(
  routes: {
    '/': (route) => NoAnimationPage(child: LoginPage()),
  },
);

class NoAnimationPage<T> extends TransitionPage<T> {
  NoAnimationPage({required Widget child})
      : super(
          child: child,
          pushTransition: PageTransition.none,
          popTransition: PageTransition.none,
        );
}

class HoledoApp extends StatelessWidget {
  final String? username;
  final bool siteBlockedWithoutLogin;
  final RouteInformationProvider? routeInformationProvider;

  HoledoApp({
    Key? key,
    this.username,
    this.siteBlockedWithoutLogin = false,
    this.routeInformationProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AppState(
              username: Get.put(HoledoDatabase()).getModel().user?.fullName,
              profile: Get.put(HoledoDatabase()).getModel().user),
        ),
      ],
      child: MaterialApp.router(
        title: 'Holedo',
        builder: (context, child) => ResponsiveWrapper.builder(
          child,
          breakpoints: [
            ResponsiveBreakpoint.resize(650, name: MOBILE),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ],
        ),
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        // theme: ThemeData(
        //   primaryColor: Color(0xFF131921),
        //   elevatedButtonTheme: ElevatedButtonThemeData(
        //     style: ElevatedButton.styleFrom(
        //       primary: Color(0xfffebd68),
        //       onPrimary: Color(0xff333333),
        //     ),
        //   ),
        //   platform: TargetPlatform.macOS,
        // ),
        routeInformationParser: RoutemasterParser(),
        routeInformationProvider: routeInformationProvider,
        routerDelegate: RoutemasterDelegate(
          routesBuilder: (context) {
            final state = Provider.of<AppState>(context);
            // Provider.of<AppState>(context).profile = Get.put(HoledoDatabase()).getModel().user ?? null;
            return siteBlockedWithoutLogin && !state.isLoggedIn
                ? loggedOutRouteMap
                : _buildRouteMap(context);
          },
        ),
      ),
    );
  }

  //.profile = Get.put(HoledoDatabase()).getModel().user ?? null
}
