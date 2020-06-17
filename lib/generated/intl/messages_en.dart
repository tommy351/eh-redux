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

  static m1(count) => "${Intl.plural(count, one: '1 page', other: '${count} pages')}";

  static m2(rating) => "Rating (${rating})";

  static m3(rating) => "${Intl.plural(rating, one: '1 star', other: '${rating} stars')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "add" : MessageLookupByLibrary.simpleMessage("Add"),
    "addToFavorites" : MessageLookupByLibrary.simpleMessage("Add to favorites"),
    "advancedOptions" : MessageLookupByLibrary.simpleMessage("Advanced options"),
    "appearance" : MessageLookupByLibrary.simpleMessage("Appearance"),
    "categories" : MessageLookupByLibrary.simpleMessage("Categories"),
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
    "checkUpdateError" : MessageLookupByLibrary.simpleMessage("Failed to check updates."),
    "checkUpdates" : MessageLookupByLibrary.simpleMessage("Check updates"),
    "displayJapaneseTitle" : MessageLookupByLibrary.simpleMessage("Display Japanese title if available"),
    "downloadButtonLabel" : m0,
    "favoriteButtonLabel" : MessageLookupByLibrary.simpleMessage("Fav"),
    "favoritedCaption" : MessageLookupByLibrary.simpleMessage("Favorited"),
    "favorites" : MessageLookupByLibrary.simpleMessage("Favorites"),
    "fileSize" : MessageLookupByLibrary.simpleMessage("File size"),
    "filter" : MessageLookupByLibrary.simpleMessage("Filter"),
    "gallery" : MessageLookupByLibrary.simpleMessage("Gallery"),
    "galleryLength" : MessageLookupByLibrary.simpleMessage("Length"),
    "galleryList" : MessageLookupByLibrary.simpleMessage("Gallery list"),
    "galleryListEmpty" : MessageLookupByLibrary.simpleMessage("No data"),
    "galleryPageCount" : m1,
    "imageView" : MessageLookupByLibrary.simpleMessage("Image view"),
    "info" : MessageLookupByLibrary.simpleMessage("Info"),
    "licenses" : MessageLookupByLibrary.simpleMessage("Licenses"),
    "logIn" : MessageLookupByLibrary.simpleMessage("Log in"),
    "logInRequired" : MessageLookupByLibrary.simpleMessage("Please log in first"),
    "logOut" : MessageLookupByLibrary.simpleMessage("Log out"),
    "logOutDialogContent" : MessageLookupByLibrary.simpleMessage("This will delete the session stored on this device."),
    "logOutDialogTitle" : MessageLookupByLibrary.simpleMessage("Log out?"),
    "minimumRating" : MessageLookupByLibrary.simpleMessage("Minimum rating"),
    "onlyShowGalleriesWithTorrents" : MessageLookupByLibrary.simpleMessage("Only show galleries with torrents"),
    "openInBrowser" : MessageLookupByLibrary.simpleMessage("Open in browser"),
    "orientationAuto" : MessageLookupByLibrary.simpleMessage("Auto"),
    "orientationLandscape" : MessageLookupByLibrary.simpleMessage("Landscape"),
    "orientationPortrait" : MessageLookupByLibrary.simpleMessage("Portrait"),
    "postedTime" : MessageLookupByLibrary.simpleMessage("Posted"),
    "projectPage" : MessageLookupByLibrary.simpleMessage("Project page"),
    "ratingCaption" : m2,
    "ratingFilterDisabled" : MessageLookupByLibrary.simpleMessage("No filter"),
    "ratingFilterLabel" : m3,
    "readButtonLabel" : MessageLookupByLibrary.simpleMessage("Read"),
    "screenOrientation" : MessageLookupByLibrary.simpleMessage("Screen orientation"),
    "search" : MessageLookupByLibrary.simpleMessage("Search"),
    "searchDownvotedTags" : MessageLookupByLibrary.simpleMessage("Search downvoted tags"),
    "searchGalleryDescription" : MessageLookupByLibrary.simpleMessage("Search gallery description"),
    "searchGalleryName" : MessageLookupByLibrary.simpleMessage("Search gallery name"),
    "searchGalleryTags" : MessageLookupByLibrary.simpleMessage("Search gallery tags"),
    "searchLowPowerTags" : MessageLookupByLibrary.simpleMessage("Search low-power tags"),
    "searchTorrentFilenames" : MessageLookupByLibrary.simpleMessage("Search torrent filenames"),
    "settings" : MessageLookupByLibrary.simpleMessage("Settings"),
    "share" : MessageLookupByLibrary.simpleMessage("Share"),
    "showExpungedGalleries" : MessageLookupByLibrary.simpleMessage("Show expunged galleries"),
    "tagListEmpty" : MessageLookupByLibrary.simpleMessage("No tags"),
    "tags" : MessageLookupByLibrary.simpleMessage("Tags"),
    "theme" : MessageLookupByLibrary.simpleMessage("Theme"),
    "themeBlack" : MessageLookupByLibrary.simpleMessage("Black"),
    "themeDark" : MessageLookupByLibrary.simpleMessage("Dark"),
    "themeLight" : MessageLookupByLibrary.simpleMessage("Light"),
    "themeSystem" : MessageLookupByLibrary.simpleMessage("System default"),
    "turnPagesWithVolumeKeys" : MessageLookupByLibrary.simpleMessage("Turn pages using volume buttons"),
    "upToDate" : MessageLookupByLibrary.simpleMessage("Up to date"),
    "uploader" : MessageLookupByLibrary.simpleMessage("Uploader")
  };
}
