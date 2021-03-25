import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_flutter_app/enums/view_state.dart';
import 'package:simple_flutter_app/widgets/blog_widget.dart';
import 'package:simple_flutter_app/providers/blog_list_provider.dart';
import 'package:simple_flutter_app/providers/user_provider.dart';

class BlogListView extends StatelessWidget {
  static const NAME = "/blog_list_view";


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BlogListProvider()
        ..getBlogs(
            Provider.of<UserProvider>(context, listen: false).user.token),
      builder: (context, __) => Scaffold(
        appBar: AppBar(
          title: Text("Blog list"),
        ),
        body: Provider.of<BlogListProvider>(context).viewState ==
                ViewState.Loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Provider.of<BlogListProvider>(context).errorMessage != null
                ? Center(
                    child: Text(
                        Provider.of<BlogListProvider>(context).errorMessage),
                  )
                : Container(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        child: ListView.separated(
                            separatorBuilder: (context, s) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: Container(
                                  height: 2,
                                  color: Colors.blueGrey,
                                ),
                              );
                            },
                            itemCount:
                                Provider.of<BlogListProvider>(context).blogs ==
                                        null
                                    ? 0
                                    : Provider.of<BlogListProvider>(context)
                                        .blogs
                                        .length,
                            itemBuilder: (context, index) {
                              return BlogWidget(
                                item: Provider.of<BlogListProvider>(context)
                                    .blogs[index],
                                isWidgetInList: true,
                              );
                            }),
                      ),
                    ),
                  ),
      ),
    );
  }
}
