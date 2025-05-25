import 'package:core/src/cache/core/cache_manager.dart';
import 'package:core/src/cache/core/cache_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

/// The HiveCacheManager class is an implementation of the CacheManager class.

final class HiveCacheManager extends CacheManager {

  HiveCacheManager({super.path});

  @override
  Future<void> init() async {
    final documentPath =
        path ?? (await getApplicationDocumentsDirectory()).path;
    // Directory(documentPath).createSync(recursive: true);
    Hive.defaultDirectory = documentPath;

    // for (final item in items) {
    //   Hive.registerAdapter('${item.runtimeType}', item.fromDynamicJson);
    // }
  }

    @override
  void registerCacheModel<T extends CacheModel>(T modelSample) {
    Hive.registerAdapter<T>(
      // => Pass the generic type T to register all unique cache model classes
      modelSample.runtimeType.toString(),
      (json) => modelSample.fromDynamicJson(json) as T,
    );
  }

  @override
  void remove() {
    Hive.deleteAllBoxesFromDisk();
  }
  
}
