import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eh_redux/modules/download/widgets/tab.dart';
import 'package:eh_redux/modules/favorite/widgets/tab.dart';
import 'package:eh_redux/modules/gallery/widgets/tab.dart';
import 'package:eh_redux/modules/history/widgets/tab.dart';
import 'package:eh_redux/modules/setting/widgets/tab.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tabs.freezed.dart';

@freezed
abstract class Tab with _$Tab {
  const factory Tab({
    @required String name,
    @required IconData icon,
    @required String Function(BuildContext) title,
    @required Widget Function(BuildContext) widget,
  }) = _Tab;
}

final tabs = <Tab>[
  Tab(
    name: 'gallery',
    icon: Icons.photo_library,
    title: (context) => AppLocalizations.of(context).homeTabTitleGallery,
    widget: (context) => const GalleryTab(),
  ),
  Tab(
    name: 'favorite',
    icon: Icons.favorite,
    title: (context) => AppLocalizations.of(context).homeTabTitleFavorite,
    widget: (context) => const FavoriteTab(),
  ),
  Tab(
    name: 'download',
    icon: Icons.file_download,
    title: (context) => AppLocalizations.of(context).homeTabTitleDownload,
    widget: (context) => const DownloadTab(),
  ),
  Tab(
    name: 'history',
    icon: Icons.history,
    title: (context) => AppLocalizations.of(context).homeTabTitleHistory,
    widget: (context) => const HistoryTab(),
  ),
  Tab(
    name: 'settings',
    icon: Icons.settings,
    title: (context) => AppLocalizations.of(context).homeTabTitleSettings,
    widget: (context) => const SettingTab(),
  ),
];
