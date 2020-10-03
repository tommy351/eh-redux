import 'package:collection/collection.dart';
import 'package:eh_redux/database/database.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eh_redux/modules/common/widgets/full_width.dart';
import 'package:eh_redux/modules/download/types.dart';
import 'package:eh_redux/modules/download/widgets/confirm_bottom_sheet.dart';
import 'package:eh_redux/modules/download/widgets/menu_bottom_sheet.dart';
import 'package:eh_redux/modules/favorite/widgets/bottom_sheet.dart';
import 'package:eh_redux/modules/gallery/stores/screen.dart';
import 'package:eh_redux/modules/gallery/types.dart';
import 'package:eh_redux/modules/gallery/widgets/thumbnail.dart';
import 'package:eh_redux/modules/image/widgets/screen.dart';
import 'package:eh_redux/modules/search/types.dart';
import 'package:eh_redux/modules/search/widgets/screen.dart';
import 'package:eh_redux/modules/session/store.dart';
import 'package:eh_redux/modules/setting/store.dart';
import 'package:eh_redux/services/ehentai.dart';
import 'package:eh_redux/utils/launch.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import 'category_icon.dart';
import 'category_label.dart';

part 'screen.g.dart';

const _safeAreaPadding = EdgeInsets.all(16);

enum _AppBarAction {
  openInBrowser,
}

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({
    Key key,
    @required this.gallery,
  })  : assert(gallery != null),
        super(key: key);

  static const route = '/gallery';

  final Gallery gallery;

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  GalleryScreenStore _store;

  @override
  void initState() {
    super.initState();

    final settingStore = Provider.of<SettingStore>(context, listen: false);
    _store = GalleryScreenStore(
      client: Provider.of<EHentaiClient>(context, listen: false),
      gallery: widget.gallery,
    );

    if (!settingStore.displayContentWarning.getValue()) {
      _store.disableContentWarning();
    }

    _store.load();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: _store,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const _AppBar(),
            const _Header(),
            const _Divider(),
            _SectionTitle(AppLocalizations.of(context).gallerySectionInfo),
            const _Info(),
            const _Divider(),
            _SectionTitle(AppLocalizations.of(context).gallerySectionTags),
            const _TagList(),
          ],
        ),
      ),
    );
  }
}

@swidget
Widget _appBar(BuildContext context) {
  final store = Provider.of<GalleryScreenStore>(context);

  return SliverAppBar(
    pinned: true,
    flexibleSpace: const _AppBarFlexibleSpace(),
    expandedHeight: 200,
    actions: [
      IconButton(
        icon: const Icon(Icons.share),
        tooltip: AppLocalizations.of(context).shareButtonTooltip,
        onPressed: () => store.share(),
      ),
      PopupMenuButton<_AppBarAction>(
        onSelected: (value) {
          tryLaunch(store.getUri().toString());
        },
        itemBuilder: (context) => [
          PopupMenuItem(
            value: _AppBarAction.openInBrowser,
            child:
                Text(AppLocalizations.of(context).galleryActionOpenInBrowser),
          ),
        ],
      ),
    ],
  );
}

@swidget
Widget _appBarFlexibleSpace(BuildContext context) {
  final store = Provider.of<GalleryScreenStore>(context);

  return Stack(
    children: [
      Positioned.fill(
        child: GalleryThumbnail(
          galleryId: store.gallery.id,
          fallbackUrl: store.gallery.thumbnail,
          fit: BoxFit.cover,
        ),
      ),
      Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Container(
          height: MediaQuery.of(context).padding.top + 56,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black.withOpacity(0.5), Colors.transparent],
            ),
          ),
        ),
      ),
    ],
  );
}

@swidget
Widget _divider(BuildContext context) {
  return const SliverToBoxAdapter(
    child: Divider(),
  );
}

@swidget
Widget _horizontalSafeArea(
  BuildContext context, {
  @required Widget sliver,
  EdgeInsets padding,
}) {
  return SliverSafeArea(
    top: false,
    bottom: false,
    sliver: SliverPadding(
      padding: padding ?? _safeAreaPadding,
      sliver: sliver,
    ),
  );
}

@swidget
Widget _header(BuildContext context) {
  final settingStore = Provider.of<SettingStore>(context);
  final store = Provider.of<GalleryScreenStore>(context);
  final gallery = store.gallery;
  final theme = Theme.of(context);

  return PreferenceBuilder<bool>(
    preference: settingStore.displayJapaneseTitle,
    builder: (context, displayJapaneseTitle) {
      String title, titleJpn;

      if (displayJapaneseTitle && gallery.titleJpn.isNotEmpty) {
        title = gallery.titleJpn;
        titleJpn = gallery.title;
      } else {
        title = gallery.title;
        titleJpn = gallery.titleJpn;
      }

      return _HorizontalSafeArea(
        sliver: SliverList(
          delegate: SliverChildListDelegate.fixed([
            _Category(gallery.category),
            const SizedBox(height: 16),
            Text(title, style: theme.textTheme.headline6),
            ...titleJpn.isNotEmpty
                ? [
                    const SizedBox(height: 8),
                    Text(
                      titleJpn,
                      style: theme.textTheme.bodyText2.copyWith(
                        color: theme.textTheme.caption.color,
                      ),
                    ),
                  ]
                : [],
            const SizedBox(height: 16),
            const _HeaderActions(),
          ]),
        ),
      );
    },
  );
}

@swidget
Widget _headerActions(BuildContext context) {
  final store = Provider.of<GalleryScreenStore>(context);

  return Observer(
    builder: (context) {
      if (store.loaded) {
        return Column(
          children: const [
            FullWidth(child: _ReadButton()),
            SizedBox(height: 8),
            _ButtonBar(),
          ],
        );
      }

      if (store.error != null) {
        return _ErrorCard(error: store.error);
      }

      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}

@swidget
Widget _category(BuildContext context, String category) {
  return Row(
    children: [
      IconTheme(
        data: const IconThemeData(size: 16),
        child: CategoryIcon(category: category),
      ),
      const SizedBox(width: 8),
      CategoryLabel(category: category),
    ],
  );
}

@swidget
Widget _sectionTitle(BuildContext context, String text) {
  final theme = Theme.of(context);

  return _HorizontalSafeArea(
    padding: _safeAreaPadding.copyWith(bottom: 0),
    sliver: SliverToBoxAdapter(
      child: Text(
        text,
        style:
            theme.textTheme.headline6.copyWith(fontWeight: FontWeight.normal),
      ),
    ),
  );
}

@swidget
Widget _readButton(BuildContext context) {
  final store = Provider.of<GalleryScreenStore>(context);

  return ElevatedButton.icon(
    onPressed: () {
      Navigator.pushNamed(
        context,
        ImageScreen.route,
        arguments: store.gallery,
      );
    },
    icon: const Icon(Icons.play_arrow),
    label: Text(AppLocalizations.of(context).readButtonLabel),
  );
}

@swidget
Widget _buttonBar(BuildContext context) {
  final store = Provider.of<GalleryScreenStore>(context);

  return Observer(
    builder: (context) {
      final rating = store.gallery.rating;
      final ratingCount = store.ratingCount;

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ActionButton(
            icon: const Icon(Icons.star),
            label: Text(
                ratingCount != null ? '$rating ($ratingCount)' : '$rating'),
          ),
          const _FavButton(),
          const _DownloadButton(),
          _ActionButton(
            onPressed: () => store.share(),
            icon: const Icon(Icons.share),
            label: Text(AppLocalizations.of(context).shareButtonLabel),
          ),
        ],
      );
    },
  );
}

@swidget
Widget _actionButton(
  BuildContext context, {
  @required Widget icon,
  @required Widget label,
  void Function() onPressed,
}) {
  final theme = Theme.of(context);

  return RawMaterialButton(
    onPressed: onPressed,
    padding: const EdgeInsets.all(8),
    shape: const CircleBorder(),
    child: Column(
      children: [
        IconTheme(
          data: IconThemeData(
            color: theme.hintColor,
          ),
          child: icon,
        ),
        const SizedBox(height: 8),
        DefaultTextStyle(
          style: theme.textTheme.caption,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          child: label,
        ),
      ],
    ),
  );
}

@swidget
Widget _favButton(BuildContext context) {
  final store = Provider.of<GalleryScreenStore>(context);
  final sessionStore = Provider.of<SessionStore>(context);

  // TODO: Show current favorite color/name
  return _ActionButton(
    onPressed: () {
      if (sessionStore.loginStatus != LoginStatus.loggedIn) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(AppLocalizations.of(context).logInRequiredHint),
        ));
        return;
      }

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return FavoriteBottomSheet(gallery: store.gallery);
        },
      );
    },
    icon: const Icon(Icons.favorite_border),
    label: Text(AppLocalizations.of(context).favoriteButtonLabel),
  );
}

@swidget
Widget _downloadButton(BuildContext context) {
  final store = Provider.of<GalleryScreenStore>(context);
  final database = Provider.of<Database>(context);

  return StreamProvider(
    create: (_) => database.downloadTasksDao.watchSingle(store.gallery.id),
    child: const _DownloadButtonContent(),
  );
}

@swidget
Widget _downloadButtonContent(BuildContext context) {
  final store = Provider.of<GalleryScreenStore>(context);
  final task = Provider.of<DownloadTask>(context);

  return _ActionButton(
    onPressed: () {
      if (task == null) {
        showDownloadConfirmBottomSheet(
          context: context,
          gallery: store.gallery,
        );
      } else {
        showDownloadMenuBottomSheet(
          context: context,
          task: task,
        );
      }
    },
    icon: const _DownloadButtonIcon(),
    label: Text(AppLocalizations.of(context).downloadButtonLabel),
  );
}

@swidget
Widget _downloadButtonIcon(BuildContext context) {
  final task = Provider.of<DownloadTask>(context);
  final iconTheme = IconTheme.of(context);
  final theme = Theme.of(context);

  if (task == null) {
    return const Icon(Icons.file_download);
  }

  switch (task.state) {
    case DownloadTaskState.succeeded:
      return const Icon(Icons.check, color: Colors.green);

    case DownloadTaskState.failed:
      return Icon(Icons.error, color: theme.errorColor);

    case DownloadTaskState.paused:
      return const Icon(Icons.pause);

    default:
  }

  return SizedBox(
    width: iconTheme.size,
    height: iconTheme.size,
    child: CircularProgressIndicator(
      strokeWidth: 2,
      value: task.downloadedCount > 0
          ? task.downloadedCount / task.totalCount
          : null,
    ),
  );
}

@swidget
Widget _errorCard(BuildContext context, {@required GalleryError error}) {
  final theme = Theme.of(context);
  final store = Provider.of<GalleryScreenStore>(context);

  final title = error.map<String>(
    (_) => AppLocalizations.of(context).galleryErrorTitle,
    contentWarning: (_) =>
        AppLocalizations.of(context).galleryContentWarningTitle,
    notFound: (_) => AppLocalizations.of(context).galleryNotFoundTitle,
  );

  final subtitle = error.map<String>(
    (e) => e.message,
    contentWarning: (e) =>
        AppLocalizations.of(context).galleryContentWarningMessage(e.reason),
    notFound: (_) => AppLocalizations.of(context).galleryNotFoundMessage,
  );

  final actions = error.maybeMap<List<Widget>>(
    (_) => [
      TextButton.icon(
        onPressed: () {
          store.load();
        },
        icon: const Icon(Icons.refresh),
        label: Text(AppLocalizations.of(context).retryButtonLabel),
      ),
    ],
    contentWarning: (_) => [
      TextButton.icon(
        onPressed: () {
          store.disableContentWarning();
          store.load();
        },
        icon: const Icon(Icons.close),
        label: Text(AppLocalizations.of(context).hideButtonLabel),
      ),
    ],
    orElse: () => [],
  );

  return Card(
    color: theme.errorColor,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.warning),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: theme.textTheme.subtitle1),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodyText2.copyWith(
                        color: theme.textTheme.caption.color,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ...actions.isNotEmpty
            ? [
                TextButtonTheme(
                  data: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      primary: theme.textTheme.bodyText1.color,
                    ),
                  ),
                  child: ButtonBar(
                    children: actions,
                  ),
                ),
              ]
            : [],
      ],
    ),
  );
}

@swidget
Widget _info(BuildContext context) {
  final store = Provider.of<GalleryScreenStore>(context);

  return _HorizontalSafeArea(
    padding: _safeAreaPadding.copyWith(left: 0, right: 0),
    sliver: SliverList(
      delegate: SliverChildListDelegate.fixed([
        _InfoTile(
          title: Text(AppLocalizations.of(context).galleryInfoPostedTime),
          trailing:
              Text(DateFormat.yMMMd().add_Hm().format(store.gallery.posted)),
        ),
        _InfoTile(
          title: Text(AppLocalizations.of(context).galleryInfoUploader),
          trailing: Text(store.gallery.uploader),
          onTap: () {
            Navigator.pushNamed(
              context,
              SearchScreen.route,
              arguments:
                  SearchArguments(query: 'uploader:${store.gallery.uploader}'),
            );
          },
        ),
        _InfoTile(
          title: Text(AppLocalizations.of(context).galleryInfoLength),
          trailing: Text(AppLocalizations.of(context)
              .galleryPageCount(store.gallery.fileCount)),
        ),
        _InfoTile(
          title: Text(AppLocalizations.of(context).galleryInfoFileSize),
          trailing: Text(filesize(store.gallery.fileSize)),
        ),
      ]),
    ),
  );
}

@swidget
Widget _infoTile(
  BuildContext context, {
  Widget title,
  Widget trailing,
  void Function() onTap,
}) {
  final theme = Theme.of(context);

  return ListTile(
    dense: true,
    title: DefaultTextStyle(
      style: theme.textTheme.bodyText2
          .copyWith(color: theme.textTheme.caption.color),
      child: title,
    ),
    trailing: trailing,
    onTap: onTap,
  );
}

@swidget
Widget _tagList(BuildContext context) {
  final store = Provider.of<GalleryScreenStore>(context);
  final groups = groupBy<GalleryTag, String>(store.gallery.tags,
      (tag) => tag.namespace.isEmpty ? 'misc' : tag.namespace);

  if (groups.isEmpty) {
    return _HorizontalSafeArea(
      sliver: SliverToBoxAdapter(
        child: Text(AppLocalizations.of(context).galleryNoTagsPlaceholder),
      ),
    );
  }

  return _HorizontalSafeArea(
    padding: _safeAreaPadding.copyWith(right: 0),
    sliver: SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final entry = groups.entries.elementAt(index);

        return Row(
          children: [
            Text(entry.key),
            const SizedBox(width: 8),
            Expanded(
              child: SizedBox(
                height: 44,
                child: ListView.separated(
                  padding: EdgeInsets.only(right: _safeAreaPadding.right),
                  scrollDirection: Axis.horizontal,
                  itemCount: entry.value.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final tag = entry.value[index];

                    return ActionChip(
                      onPressed: () {
                        Navigator.of(context).pushNamed(SearchScreen.route,
                            arguments: SearchArguments(query: tag.fullTag));
                      },
                      label: Text(tag.tag),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      }, childCount: groups.length),
    ),
  );
}
