import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_flutter_app/enums/view_state.dart';
import 'package:simple_flutter_app/providers/blog_entry_provider.dart';
import 'package:simple_flutter_app/providers/user_provider.dart';
import 'package:simple_flutter_app/widgets/blog_widget.dart';

class BlogEntryView extends StatelessWidget {
  final id;

  const BlogEntryView({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BlogEntryProvider()
        ..getBlog(
            Provider.of<UserProvider>(context, listen: false).user.token, id),
      builder: (context, __) => Scaffold(
        appBar: AppBar(
          title: Text("Blog Entry"),
        ),
        body: Provider.of<BlogEntryProvider>(context).viewState ==
                ViewState.Loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Provider.of<BlogEntryProvider>(context).errorMessage != null
                ? Center(
                    child: Text(
                        Provider.of<BlogEntryProvider>(context).errorMessage),
                  )
                : Container(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        child: BlogWidget(
                          item: Provider.of<BlogEntryProvider>(context).blog,
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
