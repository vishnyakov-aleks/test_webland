
import 'package:test_webland/repo/BaseRepoResponse.dart';

class RepoResultResponse<T> extends BaseRepoResponse {
  final T result;

  RepoResultResponse(this.result);
}