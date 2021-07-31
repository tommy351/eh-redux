import 'package:eh_redux/modules/gallery/stores/network_list.dart';
import 'package:eh_redux/modules/gallery/widgets/network_list.dart';
import 'package:eh_redux/modules/home/widgets/body.dart';
import 'package:eh_redux/modules/search/types.dart';
import 'package:eh_redux/modules/search/widgets/screen.dart';
import 'package:eh_redux/services/ehentai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class GalleryTab extends StatefulWidget {
  const GalleryTab({Key? key}) : super(key: key);

  @override
  _GalleryTabState createState() => _GalleryTabState();
}

class _GalleryTabState extends State<GalleryTab>
    with AutomaticKeepAliveClientMixin<GalleryTab> {
  late NetworkGalleryListStore _store;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _store = NetworkGalleryListStore(
      client: Provider.of<EHentaiClient>(context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Provider.value(
      value: _store,
      child: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          SliverAppBar(
            title: Text(AppLocalizations.of(context)!.homeTabTitleGallery),
            pinned: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                tooltip: AppLocalizations.of(context)!.searchButtonTooltip,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    SearchScreen.route,
                    arguments: const SearchArguments(),
                  );
                },
              ),
            ],
          ),
        ],
        body: const HomeBody(
          child: NetworkGalleryList(),
        ),
      ),
    );
  }
}
