import 'package:get_it/get_it.dart';
import 'package:simple_flutter_app/helper/prefs.dart';
import 'package:simple_flutter_app/network/apis.dart';

final locator = GetIt.instance;

Future setupLocator() async {
  locator.registerSingleton<Apis>(Apis());
  locator.registerSingleton<Prefs>(Prefs());
  await locator<Prefs>().setSharedPreferences();
}
