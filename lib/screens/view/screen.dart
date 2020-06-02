import 'package:cached_network_image/cached_network_image.dart';
import 'package:ehreader/models/gallery.dart';
import 'package:ehreader/screens/view/args.dart';
import 'package:ehreader/stores/gallery.dart';
import 'package:ehreader/stores/image.dart';
import 'package:ehreader/widgets/center_progress_indicator.dart';
import 'package:ehreader/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ViewScreen extends StatelessWidget {
  static String routeName = '/view';

  const ViewScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as ViewScreenArguments;
    final galleryStore = Provider.of<GalleryStore>(context);

    return Observer(
      builder: (context) {
        final gallery = galleryStore.data[args.id];

        if (gallery == null) {
          return const CenterProgressIndicator();
        }

        return Provider.value(
          value: gallery,
          child: _ViewScreenContent(),
        );
      },
    );
  }
}

class _ViewScreenContent extends StatefulWidget {
  @override
  _ViewScreenContentState createState() => _ViewScreenContentState();
}

class _ViewScreenContentState extends State<_ViewScreenContent> {
  PageController _pageController;
  double _sliderValue = 0;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gallery = Provider.of<Gallery>(context);
    final navBarBackground = Colors.black.withOpacity(0.5);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: navBarBackground,
        title: Text('${_currentPage + 1} / ${gallery.fileCount}'),
        elevation: 0,
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, i) {
          return _ViewImage(
            imagePage: i + 1,
          );
        },
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
            _sliderValue = page.toDouble();
          });
        },
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: navBarBackground,
        child: Slider(
          min: 0,
          max: gallery.fileCount.toDouble() - 1,
          value: _sliderValue,
          divisions: gallery.fileCount,
          onChanged: (double value) {
            setState(() {
              _sliderValue = value;
            });
          },
          onChangeEnd: (double value) {
            _pageController.jumpToPage(value.toInt());
          },
        ),
      ),
    );
  }
}

class _ViewImage extends StatelessWidget {
  final int imagePage;

  const _ViewImage({
    Key key,
    @required this.imagePage,
  })  : assert(imagePage != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final gallery = Provider.of<Gallery>(context);
    final imageStore = Provider.of<ImageStore>(context);
    final page = GalleryIdWithPage((b) => b
      ..galleryId = gallery.id.toBuilder()
      ..page = imagePage);

    return StatefulWrapper(
      onInit: (context) {
        imageStore.loadImage(gallery.id, imagePage);
      },
      builder: (context) {
        return Observer(
          builder: (context) {
            final image = imageStore.data[imageStore.index[page]];

            if (image == null) {
              return const CenterProgressIndicator();
            }

            return CachedNetworkImage(
              imageUrl: image.url,
              progressIndicatorBuilder: (context, _, downloadProgress) {
                return CenterProgressIndicator(
                  value: downloadProgress.progress,
                );
              },
            );
          },
        );
      },
    );
  }
}
