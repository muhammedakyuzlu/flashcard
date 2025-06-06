// ignore_for_file: public_member_api_docs


import 'package:flashcard/product/service/interface/authentication_operation.dart';
import 'package:flashcard/product/service/manager/product_service_path.dart';
import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';

final class LoginService extends AuthenticationOperation {
  LoginService(INetworkManager<EmptyModel> networkManager)
    : _networkManager = networkManager;

  final INetworkManager<EmptyModel> _networkManager;

  @override
  Future<List<User>> users() async {
    final response = await _networkManager.send<User, List<User>>(
      ProductServicePath.posts.value,
      parseModel: User(),
      method: RequestType.GET,
    );

    return response.data ?? [];
  }
}
