
import 'package:test_webland/repo/BaseRepoResponse.dart';
import 'package:test_webland/repo/RepoError.dart';

class RepoErrorResponse extends BaseRepoResponse {
  final RepoError error;

  RepoErrorResponse(this.error);

}