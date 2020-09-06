// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_TW locale. All the
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
  String get localeName => 'zh_TW';

  static m0(size) => "下載 (${size})";

  static m1(fileCount, size) => "下載 (${fileCount} 個檔案，${size})";

  static m2(reason) => "此相簿被標示為 ${reason}，因為其內容不應該被任何人瀏覽。";

  static m3(count) => "${count} 頁";

  static m4(rating) => "${rating} 星";

  static m5(version) => "版本 ${version}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "cancelButtonLabel" : MessageLookupByLibrary.simpleMessage("取消"),
    "categoryArtistCG" : MessageLookupByLibrary.simpleMessage("繪師 CG"),
    "categoryAsianPorn" : MessageLookupByLibrary.simpleMessage("亞洲色情"),
    "categoryCosplay" : MessageLookupByLibrary.simpleMessage("角色扮演"),
    "categoryDoujinshi" : MessageLookupByLibrary.simpleMessage("同人誌"),
    "categoryGameCG" : MessageLookupByLibrary.simpleMessage("遊戲 CG"),
    "categoryImageSet" : MessageLookupByLibrary.simpleMessage("圖集"),
    "categoryManga" : MessageLookupByLibrary.simpleMessage("漫畫"),
    "categoryMisc" : MessageLookupByLibrary.simpleMessage("其他"),
    "categoryNonH" : MessageLookupByLibrary.simpleMessage("一般向"),
    "categoryWestern" : MessageLookupByLibrary.simpleMessage("西方"),
    "checkUpdateActionOpenInBrowser" : MessageLookupByLibrary.simpleMessage("開啟於瀏覽器"),
    "checkUpdateDownloadButtonLabel" : m0,
    "checkUpdateErrorMessage" : MessageLookupByLibrary.simpleMessage("檢查更新失敗。"),
    "checkUpdateScreenTitle" : MessageLookupByLibrary.simpleMessage("檢查更新"),
    "checkUpdateUpToDate" : MessageLookupByLibrary.simpleMessage("已更新"),
    "clearButtonLabel" : MessageLookupByLibrary.simpleMessage("清除"),
    "clearReadingHistoryDialogContent" : MessageLookupByLibrary.simpleMessage("所有儲存在此裝置上的閱讀紀錄都會被刪除。"),
    "clearReadingHistoryDialogTitle" : MessageLookupByLibrary.simpleMessage("清除閱讀紀錄？"),
    "clearSearchHistoryDialogContent" : MessageLookupByLibrary.simpleMessage("所有儲存在此裝置上的搜尋紀錄都會被刪除。"),
    "clearSearchHistoryDialogTitle" : MessageLookupByLibrary.simpleMessage("清除搜尋紀錄？"),
    "downloadButtonLabel" : MessageLookupByLibrary.simpleMessage("下載"),
    "downloadConfirmTitle" : m1,
    "downloadDeleteButtonLabel" : MessageLookupByLibrary.simpleMessage("刪除"),
    "downloadDeleteDialogContent" : MessageLookupByLibrary.simpleMessage("儲存在此裝置上的已下載相簿圖片將會被刪除。"),
    "downloadDeleteDialogTitle" : MessageLookupByLibrary.simpleMessage("刪除？"),
    "downloadPauseButtonLabel" : MessageLookupByLibrary.simpleMessage("暫停"),
    "downloadResumeButtonLabel" : MessageLookupByLibrary.simpleMessage("繼續"),
    "downloadRetryButtonLabel" : MessageLookupByLibrary.simpleMessage("重試"),
    "downloadTaskStateDeleting" : MessageLookupByLibrary.simpleMessage("刪除中"),
    "downloadTaskStateDownloading" : MessageLookupByLibrary.simpleMessage("下載中"),
    "downloadTaskStateFailed" : MessageLookupByLibrary.simpleMessage("下載失敗"),
    "downloadTaskStatePaused" : MessageLookupByLibrary.simpleMessage("暫停"),
    "downloadTaskStatePending" : MessageLookupByLibrary.simpleMessage("等待下載"),
    "downloadTaskStateSucceeded" : MessageLookupByLibrary.simpleMessage("已完成"),
    "favoriteAddButtonLabel" : MessageLookupByLibrary.simpleMessage("新增到收藏"),
    "favoriteButtonLabel" : MessageLookupByLibrary.simpleMessage("收藏"),
    "favoriteDeleteButtonLabel" : MessageLookupByLibrary.simpleMessage("從收藏移除"),
    "favoriteDeleteDialogContent" : MessageLookupByLibrary.simpleMessage("此相簿會從收藏移除。"),
    "favoriteDeleteDialogTitle" : MessageLookupByLibrary.simpleMessage("從收藏移除？"),
    "favoriteNotePlaceholder" : MessageLookupByLibrary.simpleMessage("收藏註記"),
    "galleryActionOpenInBrowser" : MessageLookupByLibrary.simpleMessage("開啟於瀏覽器"),
    "galleryContentWarningMessage" : m2,
    "galleryContentWarningTitle" : MessageLookupByLibrary.simpleMessage("內容警告"),
    "galleryErrorTitle" : MessageLookupByLibrary.simpleMessage("錯誤"),
    "galleryInfoFileSize" : MessageLookupByLibrary.simpleMessage("檔案大小"),
    "galleryInfoLength" : MessageLookupByLibrary.simpleMessage("長度"),
    "galleryInfoPostedTime" : MessageLookupByLibrary.simpleMessage("上傳日期"),
    "galleryInfoUploader" : MessageLookupByLibrary.simpleMessage("上傳者"),
    "galleryListNoDataPlaceholderTitle" : MessageLookupByLibrary.simpleMessage("無資料"),
    "galleryNoTagsPlaceholder" : MessageLookupByLibrary.simpleMessage("無標籤"),
    "galleryNotFoundMessage" : MessageLookupByLibrary.simpleMessage("此相簿已被刪除。"),
    "galleryNotFoundTitle" : MessageLookupByLibrary.simpleMessage("找不到"),
    "galleryPageCount" : m3,
    "gallerySectionInfo" : MessageLookupByLibrary.simpleMessage("資訊"),
    "gallerySectionTags" : MessageLookupByLibrary.simpleMessage("標籤"),
    "hideButtonLabel" : MessageLookupByLibrary.simpleMessage("隱藏"),
    "homeTabTitleDownload" : MessageLookupByLibrary.simpleMessage("下載"),
    "homeTabTitleFavorite" : MessageLookupByLibrary.simpleMessage("收藏"),
    "homeTabTitleGallery" : MessageLookupByLibrary.simpleMessage("相簿"),
    "homeTabTitleHistory" : MessageLookupByLibrary.simpleMessage("紀錄"),
    "homeTabTitleSettings" : MessageLookupByLibrary.simpleMessage("設定"),
    "imageActionOpenInBrowser" : MessageLookupByLibrary.simpleMessage("開啟於瀏覽器"),
    "imageActionSettings" : MessageLookupByLibrary.simpleMessage("設定"),
    "imageErrorTitle" : MessageLookupByLibrary.simpleMessage("載入失敗"),
    "logInRequiredHint" : MessageLookupByLibrary.simpleMessage("請先登入"),
    "logInScreenTitle" : MessageLookupByLibrary.simpleMessage("登入"),
    "logOutButtonLabel" : MessageLookupByLibrary.simpleMessage("登出"),
    "logOutDialogContent" : MessageLookupByLibrary.simpleMessage("儲存在此裝置上的登入資訊將會被清除。"),
    "logOutDialogTitle" : MessageLookupByLibrary.simpleMessage("登出？"),
    "readButtonLabel" : MessageLookupByLibrary.simpleMessage("閱讀"),
    "readingHistoryClearSuccess" : MessageLookupByLibrary.simpleMessage("閱讀紀錄清除成功。"),
    "removeButtonLabel" : MessageLookupByLibrary.simpleMessage("移除"),
    "retryButtonLabel" : MessageLookupByLibrary.simpleMessage("重試"),
    "searchButtonTooltip" : MessageLookupByLibrary.simpleMessage("搜尋"),
    "searchCategoryButtonLabel" : MessageLookupByLibrary.simpleMessage("分類"),
    "searchFilterOnlyShowGalleriesWithTorrents" : MessageLookupByLibrary.simpleMessage("只顯示有種子的相簿"),
    "searchFilterSearchDownvotedTags" : MessageLookupByLibrary.simpleMessage("搜尋負評標籤"),
    "searchFilterSearchGalleryDescription" : MessageLookupByLibrary.simpleMessage("搜尋相簿描述"),
    "searchFilterSearchGalleryName" : MessageLookupByLibrary.simpleMessage("搜尋相簿名稱"),
    "searchFilterSearchGalleryTags" : MessageLookupByLibrary.simpleMessage("搜尋相簿標籤"),
    "searchFilterSearchLowPowerTags" : MessageLookupByLibrary.simpleMessage("搜尋低分標籤"),
    "searchFilterSearchTorrentFilenames" : MessageLookupByLibrary.simpleMessage("搜尋種子檔案名稱"),
    "searchFilterShowExpungedGalleries" : MessageLookupByLibrary.simpleMessage("顯示被清除的相簿"),
    "searchFilterTooltip" : MessageLookupByLibrary.simpleMessage("過濾"),
    "searchHistoryClearSuccess" : MessageLookupByLibrary.simpleMessage("搜尋紀錄清除成功。"),
    "searchMinimumRatingDisabled" : MessageLookupByLibrary.simpleMessage("關閉"),
    "searchMinimumRatingLabel" : m4,
    "searchMinimumRatingTitle" : MessageLookupByLibrary.simpleMessage("最低評分"),
    "searchRatingButtonLabel" : MessageLookupByLibrary.simpleMessage("評分"),
    "searchTextFieldHint" : MessageLookupByLibrary.simpleMessage("搜尋"),
    "settingClearReadingHistory" : MessageLookupByLibrary.simpleMessage("清除閱讀紀錄"),
    "settingClearSearchHistory" : MessageLookupByLibrary.simpleMessage("清除搜尋紀錄"),
    "settingDisplayJapaneseTitle" : MessageLookupByLibrary.simpleMessage("顯示日文標題"),
    "settingScreenOrientation" : MessageLookupByLibrary.simpleMessage("螢幕方向"),
    "settingScreenOrientationAuto" : MessageLookupByLibrary.simpleMessage("自動"),
    "settingScreenOrientationLandscape" : MessageLookupByLibrary.simpleMessage("橫向"),
    "settingScreenOrientationPortrait" : MessageLookupByLibrary.simpleMessage("直向"),
    "settingScreenTitle" : MessageLookupByLibrary.simpleMessage("設定"),
    "settingSectionAppearance" : MessageLookupByLibrary.simpleMessage("外觀"),
    "settingSectionGalleryList" : MessageLookupByLibrary.simpleMessage("相簿列表"),
    "settingSectionImageView" : MessageLookupByLibrary.simpleMessage("圖片瀏覽"),
    "settingSectionSearch" : MessageLookupByLibrary.simpleMessage("搜尋"),
    "settingTabCheckUpdates" : MessageLookupByLibrary.simpleMessage("檢查更新"),
    "settingTabLicenses" : MessageLookupByLibrary.simpleMessage("授權"),
    "settingTabLogIn" : MessageLookupByLibrary.simpleMessage("登入"),
    "settingTabLogOut" : MessageLookupByLibrary.simpleMessage("登出"),
    "settingTabProjectPage" : MessageLookupByLibrary.simpleMessage("專案頁面"),
    "settingTabSettings" : MessageLookupByLibrary.simpleMessage("設定"),
    "settingTabVersion" : m5,
    "settingTheme" : MessageLookupByLibrary.simpleMessage("主題"),
    "settingThemeBlack" : MessageLookupByLibrary.simpleMessage("黑色"),
    "settingThemeDark" : MessageLookupByLibrary.simpleMessage("暗色"),
    "settingThemeLight" : MessageLookupByLibrary.simpleMessage("亮色"),
    "settingThemeSystem" : MessageLookupByLibrary.simpleMessage("根據系統設定"),
    "settingTurnPagesWithVolumeKeys" : MessageLookupByLibrary.simpleMessage("使用音量鍵翻頁"),
    "shareButtonLabel" : MessageLookupByLibrary.simpleMessage("分享"),
    "shareButtonTooltip" : MessageLookupByLibrary.simpleMessage("分享")
  };
}
