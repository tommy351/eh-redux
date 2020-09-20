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
  String get homeTabTitleGallery {
    return Intl.message(
      'Gallery',
      name: 'homeTabTitleGallery',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get homeTabTitleFavorite {
    return Intl.message(
      'Favorite',
      name: 'homeTabTitleFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Download`
  String get homeTabTitleDownload {
    return Intl.message(
      'Download',
      name: 'homeTabTitleDownload',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get homeTabTitleHistory {
    return Intl.message(
      'History',
      name: 'homeTabTitleHistory',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get homeTabTitleSettings {
    return Intl.message(
      'Settings',
      name: 'homeTabTitleSettings',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get settingTabLogIn {
    return Intl.message(
      'Log in',
      name: 'settingTabLogIn',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get settingTabLogOut {
    return Intl.message(
      'Log out',
      name: 'settingTabLogOut',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingTabSettings {
    return Intl.message(
      'Settings',
      name: 'settingTabSettings',
      desc: '',
      args: [],
    );
  }

  /// `Project Page`
  String get settingTabProjectPage {
    return Intl.message(
      'Project Page',
      name: 'settingTabProjectPage',
      desc: '',
      args: [],
    );
  }

  /// `Licenses`
  String get settingTabLicenses {
    return Intl.message(
      'Licenses',
      name: 'settingTabLicenses',
      desc: '',
      args: [],
    );
  }

  /// `Check Updates`
  String get settingTabCheckUpdates {
    return Intl.message(
      'Check Updates',
      name: 'settingTabCheckUpdates',
      desc: '',
      args: [],
    );
  }

  /// `Version {version}`
  String settingTabVersion(Object version) {
    return Intl.message(
      'Version $version',
      name: 'settingTabVersion',
      desc: '',
      args: [version],
    );
  }

  /// `Log in`
  String get logInScreenTitle {
    return Intl.message(
      'Log in',
      name: 'logInScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingScreenTitle {
    return Intl.message(
      'Settings',
      name: 'settingScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get searchButtonTooltip {
    return Intl.message(
      'Search',
      name: 'searchButtonTooltip',
      desc: '',
      args: [],
    );
  }

  /// `No data`
  String get galleryListNoDataPlaceholderTitle {
    return Intl.message(
      'No data',
      name: 'galleryListNoDataPlaceholderTitle',
      desc: '',
      args: [],
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

  /// `Appearance`
  String get settingSectionAppearance {
    return Intl.message(
      'Appearance',
      name: 'settingSectionAppearance',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get settingSectionGallery {
    return Intl.message(
      'Gallery',
      name: 'settingSectionGallery',
      desc: '',
      args: [],
    );
  }

  /// `Image View`
  String get settingSectionImageView {
    return Intl.message(
      'Image View',
      name: 'settingSectionImageView',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get settingSectionSearch {
    return Intl.message(
      'Search',
      name: 'settingSectionSearch',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get settingTheme {
    return Intl.message(
      'Theme',
      name: 'settingTheme',
      desc: '',
      args: [],
    );
  }

  /// `Follow OS settings`
  String get settingThemeSystem {
    return Intl.message(
      'Follow OS settings',
      name: 'settingThemeSystem',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get settingThemeLight {
    return Intl.message(
      'Light',
      name: 'settingThemeLight',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get settingThemeDark {
    return Intl.message(
      'Dark',
      name: 'settingThemeDark',
      desc: '',
      args: [],
    );
  }

  /// `Black`
  String get settingThemeBlack {
    return Intl.message(
      'Black',
      name: 'settingThemeBlack',
      desc: '',
      args: [],
    );
  }

  /// `Display Japanese title if available`
  String get settingDisplayJapaneseTitle {
    return Intl.message(
      'Display Japanese title if available',
      name: 'settingDisplayJapaneseTitle',
      desc: '',
      args: [],
    );
  }

  /// `Clear reading history`
  String get settingClearReadingHistory {
    return Intl.message(
      'Clear reading history',
      name: 'settingClearReadingHistory',
      desc: '',
      args: [],
    );
  }

  /// `Screen orientation`
  String get settingScreenOrientation {
    return Intl.message(
      'Screen orientation',
      name: 'settingScreenOrientation',
      desc: '',
      args: [],
    );
  }

  /// `Auto`
  String get settingScreenOrientationAuto {
    return Intl.message(
      'Auto',
      name: 'settingScreenOrientationAuto',
      desc: '',
      args: [],
    );
  }

  /// `Portrait`
  String get settingScreenOrientationPortrait {
    return Intl.message(
      'Portrait',
      name: 'settingScreenOrientationPortrait',
      desc: '',
      args: [],
    );
  }

  /// `Landscape`
  String get settingScreenOrientationLandscape {
    return Intl.message(
      'Landscape',
      name: 'settingScreenOrientationLandscape',
      desc: '',
      args: [],
    );
  }

  /// `Turn pages using volume buttons`
  String get settingTurnPagesWithVolumeKeys {
    return Intl.message(
      'Turn pages using volume buttons',
      name: 'settingTurnPagesWithVolumeKeys',
      desc: '',
      args: [],
    );
  }

  /// `Clear search history`
  String get settingClearSearchHistory {
    return Intl.message(
      'Clear search history',
      name: 'settingClearSearchHistory',
      desc: '',
      args: [],
    );
  }

  /// `Display content warning`
  String get settingDisplayContentWarning {
    return Intl.message(
      'Display content warning',
      name: 'settingDisplayContentWarning',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancelButtonLabel {
    return Intl.message(
      'Cancel',
      name: 'cancelButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get clearButtonLabel {
    return Intl.message(
      'Clear',
      name: 'clearButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Clear reading history?`
  String get clearReadingHistoryDialogTitle {
    return Intl.message(
      'Clear reading history?',
      name: 'clearReadingHistoryDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `All reading history stored on this device will be deleted.`
  String get clearReadingHistoryDialogContent {
    return Intl.message(
      'All reading history stored on this device will be deleted.',
      name: 'clearReadingHistoryDialogContent',
      desc: '',
      args: [],
    );
  }

  /// `Reading history cleared successfully.`
  String get readingHistoryClearSuccess {
    return Intl.message(
      'Reading history cleared successfully.',
      name: 'readingHistoryClearSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Clear search history?`
  String get clearSearchHistoryDialogTitle {
    return Intl.message(
      'Clear search history?',
      name: 'clearSearchHistoryDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `All search history stored on this device will be deleted.`
  String get clearSearchHistoryDialogContent {
    return Intl.message(
      'All search history stored on this device will be deleted.',
      name: 'clearSearchHistoryDialogContent',
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

  /// `Share`
  String get shareButtonTooltip {
    return Intl.message(
      'Share',
      name: 'shareButtonTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Open in browser`
  String get galleryActionOpenInBrowser {
    return Intl.message(
      'Open in browser',
      name: 'galleryActionOpenInBrowser',
      desc: '',
      args: [],
    );
  }

  /// `Info`
  String get gallerySectionInfo {
    return Intl.message(
      'Info',
      name: 'gallerySectionInfo',
      desc: '',
      args: [],
    );
  }

  /// `Tags`
  String get gallerySectionTags {
    return Intl.message(
      'Tags',
      name: 'gallerySectionTags',
      desc: '',
      args: [],
    );
  }

  /// `No tags`
  String get galleryNoTagsPlaceholder {
    return Intl.message(
      'No tags',
      name: 'galleryNoTagsPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Posted`
  String get galleryInfoPostedTime {
    return Intl.message(
      'Posted',
      name: 'galleryInfoPostedTime',
      desc: '',
      args: [],
    );
  }

  /// `Uploader`
  String get galleryInfoUploader {
    return Intl.message(
      'Uploader',
      name: 'galleryInfoUploader',
      desc: '',
      args: [],
    );
  }

  /// `Length`
  String get galleryInfoLength {
    return Intl.message(
      'Length',
      name: 'galleryInfoLength',
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
  String get galleryInfoFileSize {
    return Intl.message(
      'File size',
      name: 'galleryInfoFileSize',
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

  /// `Download`
  String get downloadButtonLabel {
    return Intl.message(
      'Download',
      name: 'downloadButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get galleryErrorTitle {
    return Intl.message(
      'Error',
      name: 'galleryErrorTitle',
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

  /// `Not Found`
  String get galleryNotFoundTitle {
    return Intl.message(
      'Not Found',
      name: 'galleryNotFoundTitle',
      desc: '',
      args: [],
    );
  }

  /// `This gallery was deleted.`
  String get galleryNotFoundMessage {
    return Intl.message(
      'This gallery was deleted.',
      name: 'galleryNotFoundMessage',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retryButtonLabel {
    return Intl.message(
      'Retry',
      name: 'retryButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Hide`
  String get hideButtonLabel {
    return Intl.message(
      'Hide',
      name: 'hideButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get shareButtonLabel {
    return Intl.message(
      'Share',
      name: 'shareButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Add to favorites`
  String get favoriteAddButtonLabel {
    return Intl.message(
      'Add to favorites',
      name: 'favoriteAddButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Remove from favorites`
  String get favoriteDeleteButtonLabel {
    return Intl.message(
      'Remove from favorites',
      name: 'favoriteDeleteButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Favorite note`
  String get favoriteNotePlaceholder {
    return Intl.message(
      'Favorite note',
      name: 'favoriteNotePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Remove from favorites?`
  String get favoriteDeleteDialogTitle {
    return Intl.message(
      'Remove from favorites?',
      name: 'favoriteDeleteDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `This gallery will be remove from favorites.`
  String get favoriteDeleteDialogContent {
    return Intl.message(
      'This gallery will be remove from favorites.',
      name: 'favoriteDeleteDialogContent',
      desc: '',
      args: [],
    );
  }

  /// `Please log in first`
  String get logInRequiredHint {
    return Intl.message(
      'Please log in first',
      name: 'logInRequiredHint',
      desc: '',
      args: [],
    );
  }

  /// `Check updates`
  String get checkUpdateScreenTitle {
    return Intl.message(
      'Check updates',
      name: 'checkUpdateScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Download ({size})`
  String checkUpdateDownloadButtonLabel(Object size) {
    return Intl.message(
      'Download ($size)',
      name: 'checkUpdateDownloadButtonLabel',
      desc: '',
      args: [size],
    );
  }

  /// `Up to date`
  String get checkUpdateUpToDate {
    return Intl.message(
      'Up to date',
      name: 'checkUpdateUpToDate',
      desc: '',
      args: [],
    );
  }

  /// `Open in browser`
  String get checkUpdateActionOpenInBrowser {
    return Intl.message(
      'Open in browser',
      name: 'checkUpdateActionOpenInBrowser',
      desc: '',
      args: [],
    );
  }

  /// `Failed to check updates.`
  String get checkUpdateErrorMessage {
    return Intl.message(
      'Failed to check updates.',
      name: 'checkUpdateErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get searchTextFieldHint {
    return Intl.message(
      'Search',
      name: 'searchTextFieldHint',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get searchFilterTooltip {
    return Intl.message(
      'Filter',
      name: 'searchFilterTooltip',
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

  /// `Log out`
  String get logOutButtonLabel {
    return Intl.message(
      'Log out',
      name: 'logOutButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get searchCategoryButtonLabel {
    return Intl.message(
      'Category',
      name: 'searchCategoryButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get searchRatingButtonLabel {
    return Intl.message(
      'Rating',
      name: 'searchRatingButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Minimum rating`
  String get searchMinimumRatingTitle {
    return Intl.message(
      'Minimum rating',
      name: 'searchMinimumRatingTitle',
      desc: '',
      args: [],
    );
  }

  /// `Disabled`
  String get searchMinimumRatingDisabled {
    return Intl.message(
      'Disabled',
      name: 'searchMinimumRatingDisabled',
      desc: '',
      args: [],
    );
  }

  /// `{rating} stars`
  String searchMinimumRatingLabel(Object rating) {
    return Intl.message(
      '$rating stars',
      name: 'searchMinimumRatingLabel',
      desc: '',
      args: [rating],
    );
  }

  /// `Search gallery name`
  String get searchFilterSearchGalleryName {
    return Intl.message(
      'Search gallery name',
      name: 'searchFilterSearchGalleryName',
      desc: '',
      args: [],
    );
  }

  /// `Search gallery tags`
  String get searchFilterSearchGalleryTags {
    return Intl.message(
      'Search gallery tags',
      name: 'searchFilterSearchGalleryTags',
      desc: '',
      args: [],
    );
  }

  /// `Search gallery description`
  String get searchFilterSearchGalleryDescription {
    return Intl.message(
      'Search gallery description',
      name: 'searchFilterSearchGalleryDescription',
      desc: '',
      args: [],
    );
  }

  /// `Search torrent filenames`
  String get searchFilterSearchTorrentFilenames {
    return Intl.message(
      'Search torrent filenames',
      name: 'searchFilterSearchTorrentFilenames',
      desc: '',
      args: [],
    );
  }

  /// `Only show galleries with torrents`
  String get searchFilterOnlyShowGalleriesWithTorrents {
    return Intl.message(
      'Only show galleries with torrents',
      name: 'searchFilterOnlyShowGalleriesWithTorrents',
      desc: '',
      args: [],
    );
  }

  /// `Search low-power tags`
  String get searchFilterSearchLowPowerTags {
    return Intl.message(
      'Search low-power tags',
      name: 'searchFilterSearchLowPowerTags',
      desc: '',
      args: [],
    );
  }

  /// `Search downvoted tags`
  String get searchFilterSearchDownvotedTags {
    return Intl.message(
      'Search downvoted tags',
      name: 'searchFilterSearchDownvotedTags',
      desc: '',
      args: [],
    );
  }

  /// `Show expunged galleries`
  String get searchFilterShowExpungedGalleries {
    return Intl.message(
      'Show expunged galleries',
      name: 'searchFilterShowExpungedGalleries',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get removeButtonLabel {
    return Intl.message(
      'Remove',
      name: 'removeButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Open in browser`
  String get imageActionOpenInBrowser {
    return Intl.message(
      'Open in browser',
      name: 'imageActionOpenInBrowser',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get imageActionSettings {
    return Intl.message(
      'Settings',
      name: 'imageActionSettings',
      desc: '',
      args: [],
    );
  }

  /// `Load failed`
  String get imageErrorTitle {
    return Intl.message(
      'Load failed',
      name: 'imageErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get downloadTaskStatePending {
    return Intl.message(
      'Pending',
      name: 'downloadTaskStatePending',
      desc: '',
      args: [],
    );
  }

  /// `Downloading`
  String get downloadTaskStateDownloading {
    return Intl.message(
      'Downloading',
      name: 'downloadTaskStateDownloading',
      desc: '',
      args: [],
    );
  }

  /// `Paused`
  String get downloadTaskStatePaused {
    return Intl.message(
      'Paused',
      name: 'downloadTaskStatePaused',
      desc: '',
      args: [],
    );
  }

  /// `Failed`
  String get downloadTaskStateFailed {
    return Intl.message(
      'Failed',
      name: 'downloadTaskStateFailed',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get downloadTaskStateSucceeded {
    return Intl.message(
      'Done',
      name: 'downloadTaskStateSucceeded',
      desc: '',
      args: [],
    );
  }

  /// `Deleting`
  String get downloadTaskStateDeleting {
    return Intl.message(
      'Deleting',
      name: 'downloadTaskStateDeleting',
      desc: '',
      args: [],
    );
  }

  /// `Pause`
  String get downloadPauseButtonLabel {
    return Intl.message(
      'Pause',
      name: 'downloadPauseButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Resume`
  String get downloadResumeButtonLabel {
    return Intl.message(
      'Resume',
      name: 'downloadResumeButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get downloadRetryButtonLabel {
    return Intl.message(
      'Retry',
      name: 'downloadRetryButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get downloadDeleteButtonLabel {
    return Intl.message(
      'Delete',
      name: 'downloadDeleteButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Download ({fileCount} files, {size})`
  String downloadConfirmTitle(Object fileCount, Object size) {
    return Intl.message(
      'Download ($fileCount files, $size)',
      name: 'downloadConfirmTitle',
      desc: '',
      args: [fileCount, size],
    );
  }

  /// `Delete?`
  String get downloadDeleteDialogTitle {
    return Intl.message(
      'Delete?',
      name: 'downloadDeleteDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Downloaded images of this gallery will be deleted from the storage.`
  String get downloadDeleteDialogContent {
    return Intl.message(
      'Downloaded images of this gallery will be deleted from the storage.',
      name: 'downloadDeleteDialogContent',
      desc: '',
      args: [],
    );
  }

  /// `Resume all`
  String get downloadResumeAllButtonTooltip {
    return Intl.message(
      'Resume all',
      name: 'downloadResumeAllButtonTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Pause all`
  String get downloadPauseAllButtonTooltip {
    return Intl.message(
      'Pause all',
      name: 'downloadPauseAllButtonTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Download started`
  String get downloadStartedHint {
    return Intl.message(
      'Download started',
      name: 'downloadStartedHint',
      desc: '',
      args: [],
    );
  }

  /// `Download paused`
  String get downloadPausedHint {
    return Intl.message(
      'Download paused',
      name: 'downloadPausedHint',
      desc: '',
      args: [],
    );
  }

  /// `Download resumed`
  String get downloadResumedHint {
    return Intl.message(
      'Download resumed',
      name: 'downloadResumedHint',
      desc: '',
      args: [],
    );
  }

  /// `Download deleted`
  String get downloadDeletedHint {
    return Intl.message(
      'Download deleted',
      name: 'downloadDeletedHint',
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