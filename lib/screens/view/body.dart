import 'package:ehreader/models/gallery.dart';
import 'package:ehreader/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:provider/provider.dart';

import 'image.dart';
import 'store.dart';

class ViewBody extends StatefulWidget {
  const ViewBody({Key key}) : super(key: key);

  @override
  _ViewBodyState createState() => _ViewBodyState();
}

class _ViewBodyState extends State<ViewBody> {
  PreloadPageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PreloadPageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gallery = Provider.of<Gallery>(context);
    final viewStore = Provider.of<ViewStore>(context);
    final width = MediaQuery.of(context).size.width;

    return StatefulWrapper(
      onInit: (context) {
        return reaction((_) => viewStore.currentPage, (int page) {
          _pageController.jumpToPage(page);
        });
      },
      builder: (context) {
        return GestureDetector(
          onTapUp: (details) {
            final dx = details.localPosition.dx;
            const duration = Duration(milliseconds: 500);
            const curve = Curves.easeOutCubic;

            if (dx < width / 3) {
              _pageController.previousPage(duration: duration, curve: curve);
            } else if (dx > width / 3 * 2) {
              _pageController.nextPage(duration: duration, curve: curve);
            } else {
              viewStore.toggleNav();
            }
          },
          child: PreloadPageView.builder(
            controller: _pageController,
            itemCount: gallery.fileCount,
            itemBuilder: (context, i) {
              return ViewImage(
                imagePage: i + 1,
              );
            },
            onPageChanged: viewStore.setPage,
          ),
        );
      },
    );
  }
}
