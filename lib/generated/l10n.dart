// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `No data`
  String get galleryListEmpty {
    return Intl.message(
      'No data',
      name: 'galleryListEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Please log in first`
  String get logInRequired {
    return Intl.message(
      'Please log in first',
      name: 'logInRequired',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Project page`
  String get projectPage {
    return Intl.message(
      'Project page',
      name: 'projectPage',
      desc: '',
      args: [],
    );
  }

  /// `Licenses`
  String get licenses {
    return Intl.message(
      'Licenses',
      name: 'licenses',
      desc: '',
      args: [],
    );
  }

  /// `Check updates`
  String get checkUpdates {
    return Intl.message(
      'Check updates',
      name: 'checkUpdates',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logOut {
    return Intl.message(
      'Log out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get logIn {
    return Intl.message(
      'Log in',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `Log out?`
  String get logOutDialogTitle {
    return Intl.message(
      'Log out?',
      name: 'logOutDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `This will delete the session stored on this device.`
  String get logOutDialogContent {
    return Intl.message(
      'This will delete the session stored on this device.',
      name: 'logOutDialogContent',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Advanced options`
  String get advancedOptions {
    return Intl.message(
      'Advanced options',
      name: 'advancedOptions',
      desc: '',
      args: [],
    );
  }

  /// `Search gallery name`
  String get searchGalleryName {
    return Intl.message(
      'Search gallery name',
      name: 'searchGalleryName',
      desc: '',
      args: [],
    );
  }

  /// `Search gallery tags`
  String get searchGalleryTags {
    return Intl.message(
      'Search gallery tags',
      name: 'searchGalleryTags',
      desc: '',
      args: [],
    );
  }

  /// `Search gallery description`
  String get searchGalleryDescription {
    return Intl.message(
      'Search gallery description',
      name: 'searchGalleryDescription',
      desc: '',
      args: [],
    );
  }

  /// `Search torrent filenames`
  String get searchTorrentFilenames {
    return Intl.message(
      'Search torrent filenames',
      name: 'searchTorrentFilenames',
      desc: '',
      args: [],
    );
  }

  /// `Only show galleries with torrents`
  String get onlyShowGalleriesWithTorrents {
    return Intl.message(
      'Only show galleries with torrents',
      name: 'onlyShowGalleriesWithTorrents',
      desc: '',
      args: [],
    );
  }

  /// `Search low-power tags`
  String get searchLowPowerTags {
    return Intl.message(
      'Search low-power tags',
      name: 'searchLowPowerTags',
      desc: '',
      args: [],
    );
  }

  /// `Search downvoted tags`
  String get searchDownvotedTags {
    return Intl.message(
      'Search downvoted tags',
      name: 'searchDownvotedTags',
      desc: '',
      args: [],
    );
  }

  /// `Show expunged galleries`
  String get showExpungedGalleries {
    return Intl.message(
      'Show expunged galleries',
      name: 'showExpungedGalleries',
      desc: '',
      args: [],
    );
  }

  /// `Tags`
  String get tags {
    return Intl.message(
      'Tags',
      name: 'tags',
      desc: '',
      args: [],
    );
  }

  /// `No tags`
  String get tagListEmpty {
    return Intl.message(
      'No tags',
      name: 'tagListEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Rating ({rating})`
  String ratingCaption(Object rating) {
    return Intl.message(
      'Rating ($rating)',
      name: 'ratingCaption',
      desc: '',
      args: [rating],
    );
  }

  /// `Favorited`
  String get favoritedCaption {
    return Intl.message(
      'Favorited',
      name: 'favoritedCaption',
      desc: '',
      args: [],
    );
  }

  /// `Info`
  String get info {
    return Intl.message(
      'Info',
      name: 'info',
      desc: '',
      args: [],
    );
  }

  /// `Posted`
  String get postedTime {
    return Intl.message(
      'Posted',
      name: 'postedTime',
      desc: '',
      args: [],
    );
  }

  /// `Uploader`
  String get uploader {
    return Intl.message(
      'Uploader',
      name: 'uploader',
      desc: '',
      args: [],
    );
  }

  /// `Length`
  String get galleryLength {
    return Intl.message(
      'Length',
      name: 'galleryLength',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, one{1 page} other{{count} pages}}`
  String galleryPageCount(num count) {
    return Intl.plural(
      count,
      one: '1 page',
      other: '$count pages',
      name: 'galleryPageCount',
      desc: '',
      args: [count],
    );
  }

  /// `File size`
  String get fileSize {
    return Intl.message(
      'File size',
      name: 'fileSize',
      desc: '',
      args: [],
    );
  }

  /// `Add to favorites`
  String get addToFavorites {
    return Intl.message(
      'Add to favorites',
      name: 'addToFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Open in browser`
  String get openInBrowser {
    return Intl.message(
      'Open in browser',
      name: 'openInBrowser',
      desc: '',
      args: [],
    );
  }

  /// `Read`
  String get readButtonLabel {
    return Intl.message(
      'Read',
      name: 'readButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Fav`
  String get favoriteButtonLabel {
    return Intl.message(
      'Fav',
      name: 'favoriteButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Failed to check updates.`
  String get checkUpdateError {
    return Intl.message(
      'Failed to check updates.',
      name: 'checkUpdateError',
      desc: '',
      args: [],
    );
  }

  /// `Up to date`
  String get upToDate {
    return Intl.message(
      'Up to date',
      name: 'upToDate',
      desc: '',
      args: [],
    );
  }

  /// `Download ({size})`
  String downloadButtonLabel(Object size) {
    return Intl.message(
      'Download ($size)',
      name: 'downloadButtonLabel',
      desc: '',
      args: [size],
    );
  }

  /// `Doujinshi`
  String get categoryDoujinshi {
    return Intl.message(
      'Doujinshi',
      name: 'categoryDoujinshi',
      desc: '',
      args: [],
    );
  }

  /// `Manga`
  String get categoryManga {
    return Intl.message(
      'Manga',
      name: 'categoryManga',
      desc: '',
      args: [],
    );
  }

  /// `Artist CG`
  String get categoryArtistCG {
    return Intl.message(
      'Artist CG',
      name: 'categoryArtistCG',
      desc: '',
      args: [],
    );
  }

  /// `Game CG`
  String get categoryGameCG {
    return Intl.message(
      'Game CG',
      name: 'categoryGameCG',
      desc: '',
      args: [],
    );
  }

  /// `Western`
  String get categoryWestern {
    return Intl.message(
      'Western',
      name: 'categoryWestern',
      desc: '',
      args: [],
    );
  }

  /// `Non-H`
  String get categoryNonH {
    return Intl.message(
      'Non-H',
      name: 'categoryNonH',
      desc: '',
      args: [],
    );
  }

  /// `Image Set`
  String get categoryImageSet {
    return Intl.message(
      'Image Set',
      name: 'categoryImageSet',
      desc: '',
      args: [],
    );
  }

  /// `Cosplay`
  String get categoryCosplay {
    return Intl.message(
      'Cosplay',
      name: 'categoryCosplay',
      desc: '',
      args: [],
    );
  }

  /// `Asian Porn`
  String get categoryAsianPorn {
    return Intl.message(
      'Asian Porn',
      name: 'categoryAsianPorn',
      desc: '',
      args: [],
    );
  }

  /// `Misc`
  String get categoryMisc {
    return Intl.message(
      'Misc',
      name: 'categoryMisc',
      desc: '',
      args: [],
    );
  }

  /// `Minimum rating`
  String get minimumRating {
    return Intl.message(
      'Minimum rating',
      name: 'minimumRating',
      desc: '',
      args: [],
    );
  }

  /// `{rating, plural, one{1 star} other{{rating} stars}}`
  String ratingFilterLabel(num rating) {
    return Intl.plural(
      rating,
      one: '1 star',
      other: '$rating stars',
      name: 'ratingFilterLabel',
      desc: '',
      args: [rating],
    );
  }

  /// `No filter`
  String get ratingFilterDisabled {
    return Intl.message(
      'No filter',
      name: 'ratingFilterDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get appearance {
    return Intl.message(
      'Appearance',
      name: 'appearance',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `System default`
  String get themeSystem {
    return Intl.message(
      'System default',
      name: 'themeSystem',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get themeLight {
    return Intl.message(
      'Light',
      name: 'themeLight',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get themeDark {
    return Intl.message(
      'Dark',
      name: 'themeDark',
      desc: '',
      args: [],
    );
  }

  /// `Black`
  String get themeBlack {
    return Intl.message(
      'Black',
      name: 'themeBlack',
      desc: '',
      args: [],
    );
  }

  /// `Gallery list`
  String get galleryList {
    return Intl.message(
      'Gallery list',
      name: 'galleryList',
      desc: '',
      args: [],
    );
  }

  /// `Display Japanese title if available`
  String get displayJapaneseTitle {
    return Intl.message(
      'Display Japanese title if available',
      name: 'displayJapaneseTitle',
      desc: '',
      args: [],
    );
  }

  /// `Image view`
  String get imageView {
    return Intl.message(
      'Image view',
      name: 'imageView',
      desc: '',
      args: [],
    );
  }

  /// `Screen orientation`
  String get screenOrientation {
    return Intl.message(
      'Screen orientation',
      name: 'screenOrientation',
      desc: '',
      args: [],
    );
  }

  /// `Auto`
  String get orientationAuto {
    return Intl.message(
      'Auto',
      name: 'orientationAuto',
      desc: '',
      args: [],
    );
  }

  /// `Portrait`
  String get orientationPortrait {
    return Intl.message(
      'Portrait',
      name: 'orientationPortrait',
      desc: '',
      args: [],
    );
  }

  /// `Landscape`
  String get orientationLandscape {
    return Intl.message(
      'Landscape',
      name: 'orientationLandscape',
      desc: '',
      args: [],
    );
  }

  /// `Turn pages using volume buttons`
  String get turnPagesWithVolumeKeys {
    return Intl.message(
      'Turn pages using volume buttons',
      name: 'turnPagesWithVolumeKeys',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get galleryGenericErrorTitle {
    return Intl.message(
      'Error',
      name: 'galleryGenericErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Content Warning`
  String get galleryContentWarningTitle {
    return Intl.message(
      'Content Warning',
      name: 'galleryContentWarningTitle',
      desc: '',
      args: [],
    );
  }

  /// `This gallery has been flagged as {reason}. Due to its content, it should not be viewed by anyone.`
  String galleryContentWarningMessage(Object reason) {
    return Intl.message(
      'This gallery has been flagged as $reason. Due to its content, it should not be viewed by anyone.',
      name: 'galleryContentWarningMessage',
      desc: '',
      args: [reason],
    );
  }

  /// `Hide warning`
  String get galleryHideContentWarning {
    return Intl.message(
      'Hide warning',
      name: 'galleryHideContentWarning',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Clear search history`
  String get clearSearchHistory {
    return Intl.message(
      'Clear search history',
      name: 'clearSearchHistory',
      desc: '',
      args: [],
    );
  }

  /// `Search history cleared successfully.`
  String get searchHistoryClearSuccess {
    return Intl.message(
      'Search history cleared successfully.',
      name: 'searchHistoryClearSuccess',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}