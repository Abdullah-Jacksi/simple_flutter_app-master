import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:simple_flutter_app/models/blog_model.dart';
import 'package:simple_flutter_app/views/blog_entry_view/blog_entry_view.dart';

class BlogWidget extends StatelessWidget {
  const BlogWidget({Key key, this.item, this.isWidgetInList = false})
      : super(key: key);
  final BlogModel item;
  final bool isWidgetInList;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: isWidgetInList
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlogEntryView(
                      id: item.id,
                    ),
                  ),
                );
              }
            : null,
        child: Column(
          children: [
            Text(item.title),
            SizedBox(
              height: 5,
            ),
            Text(
              formatDate(item.createdAt,
                  ["yyyy", "-", "mm", "-", "dd", "  ", "HH", ":", "nn"]),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 200,
              width: 200,
              child: CachedNetworkImage(
                imageUrl: item.imageUrl,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
