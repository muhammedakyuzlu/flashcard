import 'package:core/core.dart';
import 'package:flashcard/product/cache/model/user_cache_model.dart';

/// [ProductCache] is a cache manager for the product module.
final class ProductCache {
  /// Creates a new instance of [ProductCache].
  ProductCache({required CacheManager cacheManager})
    : _cacheManager = cacheManager;

  final CacheManager _cacheManager;

  Future<void> init() async {
    await _cacheManager.init(items: [UserCacheModel.empty()]);
  }

  late final HiveCacheOperation<UserCacheModel> userCacheOperation =
      HiveCacheOperation<UserCacheModel>();
}
