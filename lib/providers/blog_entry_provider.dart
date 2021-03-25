import 'package:simple_flutter_app/enums/view_state.dart';
import 'package:simple_flutter_app/helper/locator.dart';
import 'package:simple_flutter_app/models/blog_model.dart';
import 'package:simple_flutter_app/network/apis.dart';
import 'package:simple_flutter_app/providers/view_state_provider.dart';

class BlogEntryProvider extends ViewStateProvider {
  BlogModel _blog;

  BlogModel get blog => _blog;

  set blog(BlogModel blog) {
    _blog = blog;
    notifyListeners();
  }

  Future getBlog(String token, id) async {
    try {
      viewState = ViewState.Loading;

      blog = await locator<Apis>().getBlogEntry(token, id);
    } catch (_) {
      errorMessage = "there is an error";
    }
    viewState = ViewState.Idle;
  }
}
