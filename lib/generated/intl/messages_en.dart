// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(size) => "Download (${size})";

  static m1(fileCount, size) => "Download (${fileCount} files, ${size})";

  static m2(reason) => "This gallery has been flagged as ${reason}. Due to its content, it should not be viewed by anyone.";

  static m3(count) => "${Intl.plural(count, one: '1 page', other: '${count} pages')}";

  static m4(rating) => "${rating} stars";

  static m5(version) => "Version ${version}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "cancelButtonLabel" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "categoryArtistCG" : MessageLookupByLibrary.simpleMessage("Artist CG"),
    "categoryAsianPorn" : MessageLookupByLibrary.simpleMessage("Asian Porn"),
    "categoryCosplay" : MessageLookupByLibrary.simpleMessage("Cosplay"),
    "categoryDoujinshi" : MessageLookupByLibrary.simpleMessage("Doujinshi"),
    "categoryGameCG" : MessageLookupByLibrary.simpleMessage("Game CG"),
    "categoryImageSet" : MessageLookupByLibrary.simpleMessage("Image Set"),
    "categoryManga" : MessageLookupByLibrary.simpleMessage("Manga"),
    "categoryMisc" : MessageLookupByLibrary.simpleMessage("Misc"),
    "categoryNonH" : MessageLookupByLibrary.simpleMessage("Non-H"),
    "categoryWestern" : MessageLookupByLibrary.simpleMessage("Western"),
    "checkUpdateActionOpenInBrowser" : MessageLookupByLibrary.simpleMessage("Open in browser"),
    "checkUpdateDownloadButtonLabel" : m0,
    "checkUpdateErrorMessage" : MessageLookupByLibrary.simpleMessage("Failed to check updates."),
    "checkUpdateScreenTitle" : MessageLookupByLibrary.simpleMessage("Check updates"),
    "checkUpdateUpToDate" : MessageLookupByLibrary.simpleMessage("Up to date"),
    "clearButtonLabel" : MessageLookupByLibrary.simpleMessage("Clear"),
    "clearReadingHistoryDialogContent" : MessageLookupByLibrary.simpleMessage("All reading history stored on this device will be deleted."),
    "clearReadingHistoryDialogTitle" : MessageLookupByLibrary.simpleMessage("Clear reading history?"),
    "clearSearchHistoryDialogContent" : MessageLookupByLibrary.simpleMessage("All search history stored on this device will be deleted."),
    "clearSearchHistoryDialogTitle" : MessageLookupByLibrary.simpleMessage("Clear search history?"),
    "downloadButtonLabel" : MessageLookupByLibrary.simpleMessage("Download"),
    "downloadConfirmTitle" : m1,
    "downloadDeleteButtonLabel" : MessageLookupByLibrary.simpleMessage("Delete"),
    "downloadDeleteDialogContent" : MessageLookupByLibrary.simpleMessage("Downloaded images of this gallery will be deleted from the storage."),
    "downloadDeleteDialogTitle" : MessageLookupByLibrary.simpleMessage("Delete?"),
    "downloadDeletedHint" : MessageLookupByLibrary.simpleMessage("Download deleted"),
    "downloadPauseAllButtonTooltip" : MessageLookupByLibrary.simpleMessage("Pause all"),
    "downloadPauseButtonLabel" : MessageLookupByLibrary.simpleMessage("Pause"),
    "downloadPausedHint" : MessageLookupByLibrary.simpleMessage("Download paused"),
    "downloadResumeAllButtonTooltip" : MessageLookupByLibrary.simpleMessage("Resume all"),
    "downloadResumeButtonLabel" : MessageLookupByLibrary.simpleMessage("Resume"),
    "downloadResumedHint" : MessageLookupByLibrary.simpleMessage("Download resumed"),
    "downloadRetryButtonLabel" : MessageLookupByLibrary.simpleMessage("Retry"),
    "downloadStartedHint" : MessageLookupByLibrary.simpleMessage("Download started"),
    "downloadTaskStateDeleting" : MessageLookupByLibrary.simpleMessage("Deleting"),
    "downloadTaskStateDownloading" : MessageLookupByLibrary.simpleMessage("Downloading"),
    "downloadTaskStateFailed" : MessageLookupByLibrary.simpleMessage("Failed"),
    "downloadTaskStatePaused" : MessageLookupByLibrary.simpleMessage("Paused"),
    "downloadTaskStatePending" : MessageLookupByLibrary.simpleMessage("Pending"),
    "downloadTaskStateSucceeded" : MessageLookupByLibrary.simpleMessage("Done"),
    "favoriteAddButtonLabel" : MessageLookupByLibrary.simpleMessage("Add to favorites"),
    "favoriteButtonLabel" : MessageLookupByLibrary.simpleMessage("Fav"),
    "favoriteDeleteButtonLabel" : MessageLookupByLibrary.simpleMessage("Remove from favorites"),
    "favoriteDeleteDialogContent" : MessageLookupByLibrary.simpleMessage("This gallery will be remove from favorites."),
    "favoriteDeleteDialogTitle" : MessageLookupByLibrary.simpleMessage("Remove from favorites?"),
    "favoriteNotePlaceholder" : MessageLookupByLibrary.simpleMessage("Favorite note"),
    "galleryActionOpenInBrowser" : MessageLookupByLibrary.simpleMessage("Open in browser"),
    "galleryContentWarningMessage" : m2,
    "galleryContentWarningTitle" : MessageLookupByLibrary.simpleMessage("Content Warning"),
    "galleryErrorTitle" : MessageLookupByLibrary.simpleMessage("Error"),
    "galleryInfoFileSize" : MessageLookupByLibrary.simpleMessage("File size"),
    "galleryInfoLength" : MessageLookupByLibrary.simpleMessage("Length"),
    "galleryInfoPostedTime" : MessageLookupByLibrary.simpleMessage("Posted"),
    "galleryInfoUploader" : MessageLookupByLibrary.simpleMessage("Uploader"),
    "galleryListNoDataPlaceholderTitle" : MessageLookupByLibrary.simpleMessage("No data"),
    "galleryNoTagsPlaceholder" : MessageLookupByLibrary.simpleMessage("No tags"),
    "galleryNotFoundMessage" : MessageLookupByLibrary.simpleMessage("This gallery was deleted."),
    "galleryNotFoundTitle" : MessageLookupByLibrary.simpleMessage("Not Found"),
    "galleryPageCount" : m3,
    "gallerySectionInfo" : MessageLookupByLibrary.simpleMessage("Info"),
    "gallerySectionTags" : MessageLookupByLibrary.simpleMessage("Tags"),
    "hideButtonLabel" : MessageLookupByLibrary.simpleMessage("Hide"),
    "homeTabTitleDownload" : MessageLookupByLibrary.simpleMessage("Download"),
    "homeTabTitleFavorite" : MessageLookupByLibrary.simpleMessage("Favorite"),
    "homeTabTitleGallery" : MessageLookupByLibrary.simpleMessage("Gallery"),
    "homeTabTitleHistory" : MessageLookupByLibrary.simpleMessage("History"),
    "homeTabTitleSettings" : MessageLookupByLibrary.simpleMessage("Settings"),
    "imageActionOpenInBrowser" : MessageLookupByLibrary.simpleMessage("Open in browser"),
    "imageActionSettings" : MessageLookupByLibrary.simpleMessage("Settings"),
    "imageErrorTitle" : MessageLookupByLibrary.simpleMessage("Load failed"),
    "logInRequiredHint" : MessageLookupByLibrary.simpleMessage("Please log in first"),
    "logInScreenTitle" : MessageLookupByLibrary.simpleMessage("Log in"),
    "logOutButtonLabel" : MessageLookupByLibrary.simpleMessage("Log out"),
    "logOutDialogContent" : MessageLookupByLibrary.simpleMessage("This will delete the session stored on this device."),
    "logOutDialogTitle" : MessageLookupByLibrary.simpleMessage("Log out?"),
    "readButtonLabel" : MessageLookupByLibrary.simpleMessage("Read"),
    "readingHistoryClearSuccess" : MessageLookupByLibrary.simpleMessage("Reading history cleared successfully."),
    "removeButtonLabel" : MessageLookupByLibrary.simpleMessage("Remove"),
    "retryButtonLabel" : MessageLookupByLibrary.simpleMessage("Retry"),
    "searchButtonTooltip" : MessageLookupByLibrary.simpleMessage("Search"),
    "searchCategoryButtonLabel" : MessageLookupByLibrary.simpleMessage("Category"),
    "searchFilterOnlyShowGalleriesWithTorrents" : MessageLookupByLibrary.simpleMessage("Only show galleries with torrents"),
    "searchFilterSearchDownvotedTags" : MessageLookupByLibrary.simpleMessage("Search downvoted tags"),
    "searchFilterSearchGalleryDescription" : MessageLookupByLibrary.simpleMessage("Search gallery description"),
    "searchFilterSearchGalleryName" : MessageLookupByLibrary.simpleMessage("Search gallery name"),
    "searchFilterSearchGalleryTags" : MessageLookupByLibrary.simpleMessage("Search gallery tags"),
    "searchFilterSearchLowPowerTags" : MessageLookupByLibrary.simpleMessage("Search low-power tags"),
    "searchFilterSearchTorrentFilenames" : MessageLookupByLibrary.simpleMessage("Search torrent filenames"),
    "searchFilterShowExpungedGalleries" : MessageLookupByLibrary.simpleMessage("Show expunged galleries"),
    "searchFilterTooltip" : MessageLookupByLibrary.simpleMessage("Filter"),
    "searchHistoryClearSuccess" : MessageLookupByLibrary.simpleMessage("Search history cleared successfully."),
    "searchMinimumRatingDisabled" : MessageLookupByLibrary.simpleMessage("Disabled"),
    "searchMinimumRatingLabel" : m4,
    "searchMinimumRatingTitle" : MessageLookupByLibrary.simpleMessage("Minimum rating"),
    "searchRatingButtonLabel" : MessageLookupByLibrary.simpleMessage("Rating"),
    "searchTextFieldHint" : MessageLookupByLibrary.simpleMessage("Search"),
    "settingClearReadingHistory" : MessageLookupByLibrary.simpleMessage("Clear reading history"),
    "settingClearSearchHistory" : MessageLookupByLibrary.simpleMessage("Clear search history"),
    "settingDisplayContentWarning" : MessageLookupByLibrary.simpleMessage("Display content warning"),
    "settingDisplayJapaneseTitle" : MessageLookupByLibrary.simpleMessage("Display Japanese title if available"),
    "settingScreenOrientation" : MessageLookupByLibrary.simpleMessage("Screen orientation"),
    "settingScreenOrientationAuto" : MessageLookupByLibrary.simpleMessage("Auto"),
    "settingScreenOrientationLandscape" : MessageLookupByLibrary.simpleMessage("Landscape"),
    "settingScreenOrientationPortrait" : MessageLookupByLibrary.simpleMessage("Portrait"),
    "settingScreenTitle" : MessageLookupByLibrary.simpleMessage("Settings"),
    "settingSectionAppearance" : MessageLookupByLibrary.simpleMessage("Appearance"),
    "settingSectionGallery" : MessageLookupByLibrary.simpleMessage("Gallery"),
    "settingSectionImageView" : MessageLookupByLibrary.simpleMessage("Image View"),
    "settingSectionSearch" : MessageLookupByLibrary.simpleMessage("Search"),
    "settingTabCheckUpdates" : MessageLookupByLibrary.simpleMessage("Check Updates"),
    "settingTabLicenses" : MessageLookupByLibrary.simpleMessage("Licenses"),
    "settingTabLogIn" : MessageLookupByLibrary.simpleMessage("Log in"),
    "settingTabLogOut" : MessageLookupByLibrary.simpleMessage("Log out"),
    "settingTabProjectPage" : MessageLookupByLibrary.simpleMessage("Project Page"),
    "settingTabSettings" : MessageLookupByLibrary.simpleMessage("Settings"),
    "settingTabVersion" : m5,
    "settingTheme" : MessageLookupByLibrary.simpleMessage("Theme"),
    "settingThemeBlack" : MessageLookupByLibrary.simpleMessage("Black"),
    "settingThemeDark" : MessageLookupByLibrary.simpleMessage("Dark"),
    "settingThemeLight" : MessageLookupByLibrary.simpleMessage("Light"),
    "settingThemeSystem" : MessageLookupByLibrary.simpleMessage("Follow OS settings"),
    "settingTurnPagesWithVolumeKeys" : MessageLookupByLibrary.simpleMessage("Turn pages using volume buttons"),
    "shareButtonLabel" : MessageLookupByLibrary.simpleMessage("Share"),
    "shareButtonTooltip" : MessageLookupByLibrary.simpleMessage("Share")
  };
}
