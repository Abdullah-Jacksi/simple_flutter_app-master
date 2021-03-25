import 'package:simple_flutter_app/enums/view_state.dart';
import 'package:simple_flutter_app/helper/locator.dart';
import 'package:simple_flutter_app/models/blog_model.dart';
import 'package:simple_flutter_app/network/apis.dart';
import 'package:simple_flutter_app/providers/view_state_provider.dart';

class BlogListProvider extends ViewStateProvider {
  List<BlogModel> _blogs;

  List<BlogModel> get blogs => _blogs;

  set blogs(List<BlogModel> list) {
    _blogs = list;
    notifyListeners();
  }

  Future getBlogs(String token) async {
    try {
      viewState = ViewState.Loading;
      blogs = await locator<Apis>().getBlogs(token);
    } catch (_) {
      errorMessage = "there is an error";
    }
    viewState = ViewState.Idle;
  }
}
