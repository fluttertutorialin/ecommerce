/*
   DEVELOPED BY: KAMLESH LAKHANI
   USE: CONTROLLER WITHOUT INSTANCE CREATE AND USE CONTROLLER FOR ACCESS
*/

import 'package:get/get.dart';

class GetInstanceAccess {
  const GetInstanceAccess._();

  //ACCESS
  get getInstanceAccess => GetInstanceAccess;

  static void lazyPut<S>(InstanceBuilderCallback<S>? builder,
      {String? tag, bool? fenix, bool permanent = false}) {
    return GetInstance()
        .lazyPut<S>(builder!, tag: tag!, fenix: fenix!, permanent: permanent);
  }

  static Future<S> putAsync<S>(AsyncInstanceBuilderCallback<S> builder,
          {String? tag, bool permanent = false}) async =>
      GetInstance().putAsync<S>(builder, tag: tag, permanent: permanent);

  static S find<S>({String? tag}) => GetInstance().find<S>(tag: tag!);

  static S put<S>(S dependency,
          {String? tag,
          bool permanent = false,
          bool overrideAbstract = false,
          InstanceBuilderCallback<S>? builder}) =>
      GetInstance().put<S>(dependency,
          tag: tag, permanent: permanent, builder: builder!);

  static bool reset(
          {bool clearFactory = true, bool clearRouteBindings = true}) =>
      GetInstance().reset(
          clearFactory: clearFactory, clearRouteBindings: clearRouteBindings);

  static Future<bool> delete<S>({String? tag, required String key}) async =>
      GetInstance().delete<S>(tag: tag!, key: key);

  static bool isRegistered<S>({String? tag}) =>
      GetInstance().isRegistered<S>(tag: tag!);

  static S putOrFind<S>(S Function() dep, {required String tag}) {
    if (GetInstance().isRegistered<S>(tag: tag) ||
        GetInstance().isPrepared<S>(tag: tag)) {
      return find<S>(tag: tag);
    } else {
      return put(dep(), tag: tag);
    }
  }
}
