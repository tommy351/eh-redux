// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class GalleryEntry extends DataClass implements Insertable<GalleryEntry> {
  final int id;
  final String token;
  final String title;
  final String titleJpn;
  final String category;
  final String thumbnail;
  final String uploader;
  final int fileCount;
  final int fileSize;
  final bool expunged;
  final double rating;
  final DateTime posted;
  final List<String> tags;
  final DateTime? lastReadAt;
  final int? lastReadPage;
  GalleryEntry(
      {required this.id,
      required this.token,
      required this.title,
      required this.titleJpn,
      required this.category,
      required this.thumbnail,
      required this.uploader,
      required this.fileCount,
      required this.fileSize,
      required this.expunged,
      required this.rating,
      required this.posted,
      required this.tags,
      this.lastReadAt,
      this.lastReadPage});
  factory GalleryEntry.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return GalleryEntry(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      token: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}token'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      titleJpn: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title_jpn'])!,
      category: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category'])!,
      thumbnail: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}thumbnail'])!,
      uploader: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uploader'])!,
      fileCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}file_count'])!,
      fileSize: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}file_size'])!,
      expunged: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}expunged'])!,
      rating: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rating'])!,
      posted: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}posted'])!,
      tags: $GalleriesTable.$converter0.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tags']))!,
      lastReadAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_read_at']),
      lastReadPage: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_read_page']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['token'] = Variable<String>(token);
    map['title'] = Variable<String>(title);
    map['title_jpn'] = Variable<String>(titleJpn);
    map['category'] = Variable<String>(category);
    map['thumbnail'] = Variable<String>(thumbnail);
    map['uploader'] = Variable<String>(uploader);
    map['file_count'] = Variable<int>(fileCount);
    map['file_size'] = Variable<int>(fileSize);
    map['expunged'] = Variable<bool>(expunged);
    map['rating'] = Variable<double>(rating);
    map['posted'] = Variable<DateTime>(posted);
    {
      final converter = $GalleriesTable.$converter0;
      map['tags'] = Variable<String>(converter.mapToSql(tags)!);
    }
    if (!nullToAbsent || lastReadAt != null) {
      map['last_read_at'] = Variable<DateTime?>(lastReadAt);
    }
    if (!nullToAbsent || lastReadPage != null) {
      map['last_read_page'] = Variable<int?>(lastReadPage);
    }
    return map;
  }

  GalleriesCompanion toCompanion(bool nullToAbsent) {
    return GalleriesCompanion(
      id: Value(id),
      token: Value(token),
      title: Value(title),
      titleJpn: Value(titleJpn),
      category: Value(category),
      thumbnail: Value(thumbnail),
      uploader: Value(uploader),
      fileCount: Value(fileCount),
      fileSize: Value(fileSize),
      expunged: Value(expunged),
      rating: Value(rating),
      posted: Value(posted),
      tags: Value(tags),
      lastReadAt: lastReadAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReadAt),
      lastReadPage: lastReadPage == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReadPage),
    );
  }

  factory GalleryEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return GalleryEntry(
      id: serializer.fromJson<int>(json['id']),
      token: serializer.fromJson<String>(json['token']),
      title: serializer.fromJson<String>(json['title']),
      titleJpn: serializer.fromJson<String>(json['titleJpn']),
      category: serializer.fromJson<String>(json['category']),
      thumbnail: serializer.fromJson<String>(json['thumbnail']),
      uploader: serializer.fromJson<String>(json['uploader']),
      fileCount: serializer.fromJson<int>(json['fileCount']),
      fileSize: serializer.fromJson<int>(json['fileSize']),
      expunged: serializer.fromJson<bool>(json['expunged']),
      rating: serializer.fromJson<double>(json['rating']),
      posted: serializer.fromJson<DateTime>(json['posted']),
      tags: serializer.fromJson<List<String>>(json['tags']),
      lastReadAt: serializer.fromJson<DateTime?>(json['lastReadAt']),
      lastReadPage: serializer.fromJson<int?>(json['lastReadPage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'token': serializer.toJson<String>(token),
      'title': serializer.toJson<String>(title),
      'titleJpn': serializer.toJson<String>(titleJpn),
      'category': serializer.toJson<String>(category),
      'thumbnail': serializer.toJson<String>(thumbnail),
      'uploader': serializer.toJson<String>(uploader),
      'fileCount': serializer.toJson<int>(fileCount),
      'fileSize': serializer.toJson<int>(fileSize),
      'expunged': serializer.toJson<bool>(expunged),
      'rating': serializer.toJson<double>(rating),
      'posted': serializer.toJson<DateTime>(posted),
      'tags': serializer.toJson<List<String>>(tags),
      'lastReadAt': serializer.toJson<DateTime?>(lastReadAt),
      'lastReadPage': serializer.toJson<int?>(lastReadPage),
    };
  }

  GalleryEntry copyWith(
          {int? id,
          String? token,
          String? title,
          String? titleJpn,
          String? category,
          String? thumbnail,
          String? uploader,
          int? fileCount,
          int? fileSize,
          bool? expunged,
          double? rating,
          DateTime? posted,
          List<String>? tags,
          DateTime? lastReadAt,
          int? lastReadPage}) =>
      GalleryEntry(
        id: id ?? this.id,
        token: token ?? this.token,
        title: title ?? this.title,
        titleJpn: titleJpn ?? this.titleJpn,
        category: category ?? this.category,
        thumbnail: thumbnail ?? this.thumbnail,
        uploader: uploader ?? this.uploader,
        fileCount: fileCount ?? this.fileCount,
        fileSize: fileSize ?? this.fileSize,
        expunged: expunged ?? this.expunged,
        rating: rating ?? this.rating,
        posted: posted ?? this.posted,
        tags: tags ?? this.tags,
        lastReadAt: lastReadAt ?? this.lastReadAt,
        lastReadPage: lastReadPage ?? this.lastReadPage,
      );
  @override
  String toString() {
    return (StringBuffer('GalleryEntry(')
          ..write('id: $id, ')
          ..write('token: $token, ')
          ..write('title: $title, ')
          ..write('titleJpn: $titleJpn, ')
          ..write('category: $category, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('uploader: $uploader, ')
          ..write('fileCount: $fileCount, ')
          ..write('fileSize: $fileSize, ')
          ..write('expunged: $expunged, ')
          ..write('rating: $rating, ')
          ..write('posted: $posted, ')
          ..write('tags: $tags, ')
          ..write('lastReadAt: $lastReadAt, ')
          ..write('lastReadPage: $lastReadPage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          token.hashCode,
          $mrjc(
              title.hashCode,
              $mrjc(
                  titleJpn.hashCode,
                  $mrjc(
                      category.hashCode,
                      $mrjc(
                          thumbnail.hashCode,
                          $mrjc(
                              uploader.hashCode,
                              $mrjc(
                                  fileCount.hashCode,
                                  $mrjc(
                                      fileSize.hashCode,
                                      $mrjc(
                                          expunged.hashCode,
                                          $mrjc(
                                              rating.hashCode,
                                              $mrjc(
                                                  posted.hashCode,
                                                  $mrjc(
                                                      tags.hashCode,
                                                      $mrjc(
                                                          lastReadAt.hashCode,
                                                          lastReadPage
                                                              .hashCode)))))))))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GalleryEntry &&
          other.id == this.id &&
          other.token == this.token &&
          other.title == this.title &&
          other.titleJpn == this.titleJpn &&
          other.category == this.category &&
          other.thumbnail == this.thumbnail &&
          other.uploader == this.uploader &&
          other.fileCount == this.fileCount &&
          other.fileSize == this.fileSize &&
          other.expunged == this.expunged &&
          other.rating == this.rating &&
          other.posted == this.posted &&
          other.tags == this.tags &&
          other.lastReadAt == this.lastReadAt &&
          other.lastReadPage == this.lastReadPage);
}

class GalleriesCompanion extends UpdateCompanion<GalleryEntry> {
  final Value<int> id;
  final Value<String> token;
  final Value<String> title;
  final Value<String> titleJpn;
  final Value<String> category;
  final Value<String> thumbnail;
  final Value<String> uploader;
  final Value<int> fileCount;
  final Value<int> fileSize;
  final Value<bool> expunged;
  final Value<double> rating;
  final Value<DateTime> posted;
  final Value<List<String>> tags;
  final Value<DateTime?> lastReadAt;
  final Value<int?> lastReadPage;
  const GalleriesCompanion({
    this.id = const Value.absent(),
    this.token = const Value.absent(),
    this.title = const Value.absent(),
    this.titleJpn = const Value.absent(),
    this.category = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.uploader = const Value.absent(),
    this.fileCount = const Value.absent(),
    this.fileSize = const Value.absent(),
    this.expunged = const Value.absent(),
    this.rating = const Value.absent(),
    this.posted = const Value.absent(),
    this.tags = const Value.absent(),
    this.lastReadAt = const Value.absent(),
    this.lastReadPage = const Value.absent(),
  });
  GalleriesCompanion.insert({
    this.id = const Value.absent(),
    required String token,
    required String title,
    required String titleJpn,
    required String category,
    required String thumbnail,
    required String uploader,
    required int fileCount,
    required int fileSize,
    required bool expunged,
    required double rating,
    required DateTime posted,
    required List<String> tags,
    this.lastReadAt = const Value.absent(),
    this.lastReadPage = const Value.absent(),
  })  : token = Value(token),
        title = Value(title),
        titleJpn = Value(titleJpn),
        category = Value(category),
        thumbnail = Value(thumbnail),
        uploader = Value(uploader),
        fileCount = Value(fileCount),
        fileSize = Value(fileSize),
        expunged = Value(expunged),
        rating = Value(rating),
        posted = Value(posted),
        tags = Value(tags);
  static Insertable<GalleryEntry> custom({
    Expression<int>? id,
    Expression<String>? token,
    Expression<String>? title,
    Expression<String>? titleJpn,
    Expression<String>? category,
    Expression<String>? thumbnail,
    Expression<String>? uploader,
    Expression<int>? fileCount,
    Expression<int>? fileSize,
    Expression<bool>? expunged,
    Expression<double>? rating,
    Expression<DateTime>? posted,
    Expression<List<String>>? tags,
    Expression<DateTime?>? lastReadAt,
    Expression<int?>? lastReadPage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (token != null) 'token': token,
      if (title != null) 'title': title,
      if (titleJpn != null) 'title_jpn': titleJpn,
      if (category != null) 'category': category,
      if (thumbnail != null) 'thumbnail': thumbnail,
      if (uploader != null) 'uploader': uploader,
      if (fileCount != null) 'file_count': fileCount,
      if (fileSize != null) 'file_size': fileSize,
      if (expunged != null) 'expunged': expunged,
      if (rating != null) 'rating': rating,
      if (posted != null) 'posted': posted,
      if (tags != null) 'tags': tags,
      if (lastReadAt != null) 'last_read_at': lastReadAt,
      if (lastReadPage != null) 'last_read_page': lastReadPage,
    });
  }

  GalleriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? token,
      Value<String>? title,
      Value<String>? titleJpn,
      Value<String>? category,
      Value<String>? thumbnail,
      Value<String>? uploader,
      Value<int>? fileCount,
      Value<int>? fileSize,
      Value<bool>? expunged,
      Value<double>? rating,
      Value<DateTime>? posted,
      Value<List<String>>? tags,
      Value<DateTime?>? lastReadAt,
      Value<int?>? lastReadPage}) {
    return GalleriesCompanion(
      id: id ?? this.id,
      token: token ?? this.token,
      title: title ?? this.title,
      titleJpn: titleJpn ?? this.titleJpn,
      category: category ?? this.category,
      thumbnail: thumbnail ?? this.thumbnail,
      uploader: uploader ?? this.uploader,
      fileCount: fileCount ?? this.fileCount,
      fileSize: fileSize ?? this.fileSize,
      expunged: expunged ?? this.expunged,
      rating: rating ?? this.rating,
      posted: posted ?? this.posted,
      tags: tags ?? this.tags,
      lastReadAt: lastReadAt ?? this.lastReadAt,
      lastReadPage: lastReadPage ?? this.lastReadPage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (titleJpn.present) {
      map['title_jpn'] = Variable<String>(titleJpn.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<String>(thumbnail.value);
    }
    if (uploader.present) {
      map['uploader'] = Variable<String>(uploader.value);
    }
    if (fileCount.present) {
      map['file_count'] = Variable<int>(fileCount.value);
    }
    if (fileSize.present) {
      map['file_size'] = Variable<int>(fileSize.value);
    }
    if (expunged.present) {
      map['expunged'] = Variable<bool>(expunged.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (posted.present) {
      map['posted'] = Variable<DateTime>(posted.value);
    }
    if (tags.present) {
      final converter = $GalleriesTable.$converter0;
      map['tags'] = Variable<String>(converter.mapToSql(tags.value)!);
    }
    if (lastReadAt.present) {
      map['last_read_at'] = Variable<DateTime?>(lastReadAt.value);
    }
    if (lastReadPage.present) {
      map['last_read_page'] = Variable<int?>(lastReadPage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GalleriesCompanion(')
          ..write('id: $id, ')
          ..write('token: $token, ')
          ..write('title: $title, ')
          ..write('titleJpn: $titleJpn, ')
          ..write('category: $category, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('uploader: $uploader, ')
          ..write('fileCount: $fileCount, ')
          ..write('fileSize: $fileSize, ')
          ..write('expunged: $expunged, ')
          ..write('rating: $rating, ')
          ..write('posted: $posted, ')
          ..write('tags: $tags, ')
          ..write('lastReadAt: $lastReadAt, ')
          ..write('lastReadPage: $lastReadPage')
          ..write(')'))
        .toString();
  }
}

class $GalleriesTable extends Galleries
    with TableInfo<$GalleriesTable, GalleryEntry> {
  final GeneratedDatabase _db;
  final String? _alias;
  $GalleriesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _tokenMeta = const VerificationMeta('token');
  late final GeneratedColumn<String?> token = GeneratedColumn<String?>(
      'token', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _titleJpnMeta = const VerificationMeta('titleJpn');
  late final GeneratedColumn<String?> titleJpn = GeneratedColumn<String?>(
      'title_jpn', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  late final GeneratedColumn<String?> category = GeneratedColumn<String?>(
      'category', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _thumbnailMeta = const VerificationMeta('thumbnail');
  late final GeneratedColumn<String?> thumbnail = GeneratedColumn<String?>(
      'thumbnail', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _uploaderMeta = const VerificationMeta('uploader');
  late final GeneratedColumn<String?> uploader = GeneratedColumn<String?>(
      'uploader', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _fileCountMeta = const VerificationMeta('fileCount');
  late final GeneratedColumn<int?> fileCount = GeneratedColumn<int?>(
      'file_count', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _fileSizeMeta = const VerificationMeta('fileSize');
  late final GeneratedColumn<int?> fileSize = GeneratedColumn<int?>(
      'file_size', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _expungedMeta = const VerificationMeta('expunged');
  late final GeneratedColumn<bool?> expunged = GeneratedColumn<bool?>(
      'expunged', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (expunged IN (0, 1))');
  final VerificationMeta _ratingMeta = const VerificationMeta('rating');
  late final GeneratedColumn<double?> rating = GeneratedColumn<double?>(
      'rating', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _postedMeta = const VerificationMeta('posted');
  late final GeneratedColumn<DateTime?> posted = GeneratedColumn<DateTime?>(
      'posted', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _tagsMeta = const VerificationMeta('tags');
  late final GeneratedColumnWithTypeConverter<List<String>, String?> tags =
      GeneratedColumn<String?>('tags', aliasedName, false,
              typeName: 'TEXT', requiredDuringInsert: true)
          .withConverter<List<String>>($GalleriesTable.$converter0);
  final VerificationMeta _lastReadAtMeta = const VerificationMeta('lastReadAt');
  late final GeneratedColumn<DateTime?> lastReadAt = GeneratedColumn<DateTime?>(
      'last_read_at', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _lastReadPageMeta =
      const VerificationMeta('lastReadPage');
  late final GeneratedColumn<int?> lastReadPage = GeneratedColumn<int?>(
      'last_read_page', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        token,
        title,
        titleJpn,
        category,
        thumbnail,
        uploader,
        fileCount,
        fileSize,
        expunged,
        rating,
        posted,
        tags,
        lastReadAt,
        lastReadPage
      ];
  @override
  String get aliasedName => _alias ?? 'galleries';
  @override
  String get actualTableName => 'galleries';
  @override
  VerificationContext validateIntegrity(Insertable<GalleryEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('token')) {
      context.handle(
          _tokenMeta, token.isAcceptableOrUnknown(data['token']!, _tokenMeta));
    } else if (isInserting) {
      context.missing(_tokenMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('title_jpn')) {
      context.handle(_titleJpnMeta,
          titleJpn.isAcceptableOrUnknown(data['title_jpn']!, _titleJpnMeta));
    } else if (isInserting) {
      context.missing(_titleJpnMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('thumbnail')) {
      context.handle(_thumbnailMeta,
          thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta));
    } else if (isInserting) {
      context.missing(_thumbnailMeta);
    }
    if (data.containsKey('uploader')) {
      context.handle(_uploaderMeta,
          uploader.isAcceptableOrUnknown(data['uploader']!, _uploaderMeta));
    } else if (isInserting) {
      context.missing(_uploaderMeta);
    }
    if (data.containsKey('file_count')) {
      context.handle(_fileCountMeta,
          fileCount.isAcceptableOrUnknown(data['file_count']!, _fileCountMeta));
    } else if (isInserting) {
      context.missing(_fileCountMeta);
    }
    if (data.containsKey('file_size')) {
      context.handle(_fileSizeMeta,
          fileSize.isAcceptableOrUnknown(data['file_size']!, _fileSizeMeta));
    } else if (isInserting) {
      context.missing(_fileSizeMeta);
    }
    if (data.containsKey('expunged')) {
      context.handle(_expungedMeta,
          expunged.isAcceptableOrUnknown(data['expunged']!, _expungedMeta));
    } else if (isInserting) {
      context.missing(_expungedMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('posted')) {
      context.handle(_postedMeta,
          posted.isAcceptableOrUnknown(data['posted']!, _postedMeta));
    } else if (isInserting) {
      context.missing(_postedMeta);
    }
    context.handle(_tagsMeta, const VerificationResult.success());
    if (data.containsKey('last_read_at')) {
      context.handle(
          _lastReadAtMeta,
          lastReadAt.isAcceptableOrUnknown(
              data['last_read_at']!, _lastReadAtMeta));
    }
    if (data.containsKey('last_read_page')) {
      context.handle(
          _lastReadPageMeta,
          lastReadPage.isAcceptableOrUnknown(
              data['last_read_page']!, _lastReadPageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GalleryEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    return GalleryEntry.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $GalleriesTable createAlias(String alias) {
    return $GalleriesTable(_db, alias);
  }

  static TypeConverter<List<String>, String> $converter0 =
      ListConverter<String>();
}

class SearchHistoryEntry extends DataClass
    implements Insertable<SearchHistoryEntry> {
  final String query;
  final DateTime lastQueriedAt;
  SearchHistoryEntry({required this.query, required this.lastQueriedAt});
  factory SearchHistoryEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return SearchHistoryEntry(
      query: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}query'])!,
      lastQueriedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_queried_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['query'] = Variable<String>(query);
    map['last_queried_at'] = Variable<DateTime>(lastQueriedAt);
    return map;
  }

  SearchHistoriesCompanion toCompanion(bool nullToAbsent) {
    return SearchHistoriesCompanion(
      query: Value(query),
      lastQueriedAt: Value(lastQueriedAt),
    );
  }

  factory SearchHistoryEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return SearchHistoryEntry(
      query: serializer.fromJson<String>(json['query']),
      lastQueriedAt: serializer.fromJson<DateTime>(json['lastQueriedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'query': serializer.toJson<String>(query),
      'lastQueriedAt': serializer.toJson<DateTime>(lastQueriedAt),
    };
  }

  SearchHistoryEntry copyWith({String? query, DateTime? lastQueriedAt}) =>
      SearchHistoryEntry(
        query: query ?? this.query,
        lastQueriedAt: lastQueriedAt ?? this.lastQueriedAt,
      );
  @override
  String toString() {
    return (StringBuffer('SearchHistoryEntry(')
          ..write('query: $query, ')
          ..write('lastQueriedAt: $lastQueriedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(query.hashCode, lastQueriedAt.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchHistoryEntry &&
          other.query == this.query &&
          other.lastQueriedAt == this.lastQueriedAt);
}

class SearchHistoriesCompanion extends UpdateCompanion<SearchHistoryEntry> {
  final Value<String> query;
  final Value<DateTime> lastQueriedAt;
  const SearchHistoriesCompanion({
    this.query = const Value.absent(),
    this.lastQueriedAt = const Value.absent(),
  });
  SearchHistoriesCompanion.insert({
    required String query,
    required DateTime lastQueriedAt,
  })  : query = Value(query),
        lastQueriedAt = Value(lastQueriedAt);
  static Insertable<SearchHistoryEntry> custom({
    Expression<String>? query,
    Expression<DateTime>? lastQueriedAt,
  }) {
    return RawValuesInsertable({
      if (query != null) 'query': query,
      if (lastQueriedAt != null) 'last_queried_at': lastQueriedAt,
    });
  }

  SearchHistoriesCompanion copyWith(
      {Value<String>? query, Value<DateTime>? lastQueriedAt}) {
    return SearchHistoriesCompanion(
      query: query ?? this.query,
      lastQueriedAt: lastQueriedAt ?? this.lastQueriedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (query.present) {
      map['query'] = Variable<String>(query.value);
    }
    if (lastQueriedAt.present) {
      map['last_queried_at'] = Variable<DateTime>(lastQueriedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SearchHistoriesCompanion(')
          ..write('query: $query, ')
          ..write('lastQueriedAt: $lastQueriedAt')
          ..write(')'))
        .toString();
  }
}

class $SearchHistoriesTable extends SearchHistories
    with TableInfo<$SearchHistoriesTable, SearchHistoryEntry> {
  final GeneratedDatabase _db;
  final String? _alias;
  $SearchHistoriesTable(this._db, [this._alias]);
  final VerificationMeta _queryMeta = const VerificationMeta('query');
  late final GeneratedColumn<String?> query = GeneratedColumn<String?>(
      'query', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _lastQueriedAtMeta =
      const VerificationMeta('lastQueriedAt');
  late final GeneratedColumn<DateTime?> lastQueriedAt =
      GeneratedColumn<DateTime?>('last_queried_at', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [query, lastQueriedAt];
  @override
  String get aliasedName => _alias ?? 'search_histories';
  @override
  String get actualTableName => 'search_histories';
  @override
  VerificationContext validateIntegrity(Insertable<SearchHistoryEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('query')) {
      context.handle(
          _queryMeta, query.isAcceptableOrUnknown(data['query']!, _queryMeta));
    } else if (isInserting) {
      context.missing(_queryMeta);
    }
    if (data.containsKey('last_queried_at')) {
      context.handle(
          _lastQueriedAtMeta,
          lastQueriedAt.isAcceptableOrUnknown(
              data['last_queried_at']!, _lastQueriedAtMeta));
    } else if (isInserting) {
      context.missing(_lastQueriedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {query};
  @override
  SearchHistoryEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    return SearchHistoryEntry.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $SearchHistoriesTable createAlias(String alias) {
    return $SearchHistoriesTable(_db, alias);
  }
}

class DownloadTaskEntry extends DataClass
    implements Insertable<DownloadTaskEntry> {
  final int galleryId;
  final int totalCount;
  final int downloadedCount;
  final DateTime createdAt;
  final DateTime queuedAt;
  final DownloadTaskState state;
  final String? errorDetails;
  final String? thumbnail;
  DownloadTaskEntry(
      {required this.galleryId,
      required this.totalCount,
      required this.downloadedCount,
      required this.createdAt,
      required this.queuedAt,
      required this.state,
      this.errorDetails,
      this.thumbnail});
  factory DownloadTaskEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DownloadTaskEntry(
      galleryId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}gallery_id'])!,
      totalCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total_count'])!,
      downloadedCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}downloaded_count'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      queuedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}queued_at'])!,
      state: $DownloadTasksTable.$converter0.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}state']))!,
      errorDetails: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}error_details']),
      thumbnail: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}thumbnail']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['gallery_id'] = Variable<int>(galleryId);
    map['total_count'] = Variable<int>(totalCount);
    map['downloaded_count'] = Variable<int>(downloadedCount);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['queued_at'] = Variable<DateTime>(queuedAt);
    {
      final converter = $DownloadTasksTable.$converter0;
      map['state'] = Variable<String>(converter.mapToSql(state)!);
    }
    if (!nullToAbsent || errorDetails != null) {
      map['error_details'] = Variable<String?>(errorDetails);
    }
    if (!nullToAbsent || thumbnail != null) {
      map['thumbnail'] = Variable<String?>(thumbnail);
    }
    return map;
  }

  DownloadTasksCompanion toCompanion(bool nullToAbsent) {
    return DownloadTasksCompanion(
      galleryId: Value(galleryId),
      totalCount: Value(totalCount),
      downloadedCount: Value(downloadedCount),
      createdAt: Value(createdAt),
      queuedAt: Value(queuedAt),
      state: Value(state),
      errorDetails: errorDetails == null && nullToAbsent
          ? const Value.absent()
          : Value(errorDetails),
      thumbnail: thumbnail == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnail),
    );
  }

  factory DownloadTaskEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DownloadTaskEntry(
      galleryId: serializer.fromJson<int>(json['galleryId']),
      totalCount: serializer.fromJson<int>(json['totalCount']),
      downloadedCount: serializer.fromJson<int>(json['downloadedCount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      queuedAt: serializer.fromJson<DateTime>(json['queuedAt']),
      state: serializer.fromJson<DownloadTaskState>(json['state']),
      errorDetails: serializer.fromJson<String?>(json['errorDetails']),
      thumbnail: serializer.fromJson<String?>(json['thumbnail']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'galleryId': serializer.toJson<int>(galleryId),
      'totalCount': serializer.toJson<int>(totalCount),
      'downloadedCount': serializer.toJson<int>(downloadedCount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'queuedAt': serializer.toJson<DateTime>(queuedAt),
      'state': serializer.toJson<DownloadTaskState>(state),
      'errorDetails': serializer.toJson<String?>(errorDetails),
      'thumbnail': serializer.toJson<String?>(thumbnail),
    };
  }

  DownloadTaskEntry copyWith(
          {int? galleryId,
          int? totalCount,
          int? downloadedCount,
          DateTime? createdAt,
          DateTime? queuedAt,
          DownloadTaskState? state,
          String? errorDetails,
          String? thumbnail}) =>
      DownloadTaskEntry(
        galleryId: galleryId ?? this.galleryId,
        totalCount: totalCount ?? this.totalCount,
        downloadedCount: downloadedCount ?? this.downloadedCount,
        createdAt: createdAt ?? this.createdAt,
        queuedAt: queuedAt ?? this.queuedAt,
        state: state ?? this.state,
        errorDetails: errorDetails ?? this.errorDetails,
        thumbnail: thumbnail ?? this.thumbnail,
      );
  @override
  String toString() {
    return (StringBuffer('DownloadTaskEntry(')
          ..write('galleryId: $galleryId, ')
          ..write('totalCount: $totalCount, ')
          ..write('downloadedCount: $downloadedCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('queuedAt: $queuedAt, ')
          ..write('state: $state, ')
          ..write('errorDetails: $errorDetails, ')
          ..write('thumbnail: $thumbnail')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      galleryId.hashCode,
      $mrjc(
          totalCount.hashCode,
          $mrjc(
              downloadedCount.hashCode,
              $mrjc(
                  createdAt.hashCode,
                  $mrjc(
                      queuedAt.hashCode,
                      $mrjc(
                          state.hashCode,
                          $mrjc(
                              errorDetails.hashCode, thumbnail.hashCode))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DownloadTaskEntry &&
          other.galleryId == this.galleryId &&
          other.totalCount == this.totalCount &&
          other.downloadedCount == this.downloadedCount &&
          other.createdAt == this.createdAt &&
          other.queuedAt == this.queuedAt &&
          other.state == this.state &&
          other.errorDetails == this.errorDetails &&
          other.thumbnail == this.thumbnail);
}

class DownloadTasksCompanion extends UpdateCompanion<DownloadTaskEntry> {
  final Value<int> galleryId;
  final Value<int> totalCount;
  final Value<int> downloadedCount;
  final Value<DateTime> createdAt;
  final Value<DateTime> queuedAt;
  final Value<DownloadTaskState> state;
  final Value<String?> errorDetails;
  final Value<String?> thumbnail;
  const DownloadTasksCompanion({
    this.galleryId = const Value.absent(),
    this.totalCount = const Value.absent(),
    this.downloadedCount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.queuedAt = const Value.absent(),
    this.state = const Value.absent(),
    this.errorDetails = const Value.absent(),
    this.thumbnail = const Value.absent(),
  });
  DownloadTasksCompanion.insert({
    this.galleryId = const Value.absent(),
    required int totalCount,
    required int downloadedCount,
    required DateTime createdAt,
    required DateTime queuedAt,
    required DownloadTaskState state,
    this.errorDetails = const Value.absent(),
    this.thumbnail = const Value.absent(),
  })  : totalCount = Value(totalCount),
        downloadedCount = Value(downloadedCount),
        createdAt = Value(createdAt),
        queuedAt = Value(queuedAt),
        state = Value(state);
  static Insertable<DownloadTaskEntry> custom({
    Expression<int>? galleryId,
    Expression<int>? totalCount,
    Expression<int>? downloadedCount,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? queuedAt,
    Expression<DownloadTaskState>? state,
    Expression<String?>? errorDetails,
    Expression<String?>? thumbnail,
  }) {
    return RawValuesInsertable({
      if (galleryId != null) 'gallery_id': galleryId,
      if (totalCount != null) 'total_count': totalCount,
      if (downloadedCount != null) 'downloaded_count': downloadedCount,
      if (createdAt != null) 'created_at': createdAt,
      if (queuedAt != null) 'queued_at': queuedAt,
      if (state != null) 'state': state,
      if (errorDetails != null) 'error_details': errorDetails,
      if (thumbnail != null) 'thumbnail': thumbnail,
    });
  }

  DownloadTasksCompanion copyWith(
      {Value<int>? galleryId,
      Value<int>? totalCount,
      Value<int>? downloadedCount,
      Value<DateTime>? createdAt,
      Value<DateTime>? queuedAt,
      Value<DownloadTaskState>? state,
      Value<String?>? errorDetails,
      Value<String?>? thumbnail}) {
    return DownloadTasksCompanion(
      galleryId: galleryId ?? this.galleryId,
      totalCount: totalCount ?? this.totalCount,
      downloadedCount: downloadedCount ?? this.downloadedCount,
      createdAt: createdAt ?? this.createdAt,
      queuedAt: queuedAt ?? this.queuedAt,
      state: state ?? this.state,
      errorDetails: errorDetails ?? this.errorDetails,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (galleryId.present) {
      map['gallery_id'] = Variable<int>(galleryId.value);
    }
    if (totalCount.present) {
      map['total_count'] = Variable<int>(totalCount.value);
    }
    if (downloadedCount.present) {
      map['downloaded_count'] = Variable<int>(downloadedCount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (queuedAt.present) {
      map['queued_at'] = Variable<DateTime>(queuedAt.value);
    }
    if (state.present) {
      final converter = $DownloadTasksTable.$converter0;
      map['state'] = Variable<String>(converter.mapToSql(state.value)!);
    }
    if (errorDetails.present) {
      map['error_details'] = Variable<String?>(errorDetails.value);
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<String?>(thumbnail.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DownloadTasksCompanion(')
          ..write('galleryId: $galleryId, ')
          ..write('totalCount: $totalCount, ')
          ..write('downloadedCount: $downloadedCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('queuedAt: $queuedAt, ')
          ..write('state: $state, ')
          ..write('errorDetails: $errorDetails, ')
          ..write('thumbnail: $thumbnail')
          ..write(')'))
        .toString();
  }
}

class $DownloadTasksTable extends DownloadTasks
    with TableInfo<$DownloadTasksTable, DownloadTaskEntry> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DownloadTasksTable(this._db, [this._alias]);
  final VerificationMeta _galleryIdMeta = const VerificationMeta('galleryId');
  late final GeneratedColumn<int?> galleryId = GeneratedColumn<int?>(
      'gallery_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _totalCountMeta = const VerificationMeta('totalCount');
  late final GeneratedColumn<int?> totalCount = GeneratedColumn<int?>(
      'total_count', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _downloadedCountMeta =
      const VerificationMeta('downloadedCount');
  late final GeneratedColumn<int?> downloadedCount = GeneratedColumn<int?>(
      'downloaded_count', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _queuedAtMeta = const VerificationMeta('queuedAt');
  late final GeneratedColumn<DateTime?> queuedAt = GeneratedColumn<DateTime?>(
      'queued_at', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _stateMeta = const VerificationMeta('state');
  late final GeneratedColumnWithTypeConverter<DownloadTaskState, String?>
      state = GeneratedColumn<String?>('state', aliasedName, false,
              typeName: 'TEXT', requiredDuringInsert: true)
          .withConverter<DownloadTaskState>($DownloadTasksTable.$converter0);
  final VerificationMeta _errorDetailsMeta =
      const VerificationMeta('errorDetails');
  late final GeneratedColumn<String?> errorDetails = GeneratedColumn<String?>(
      'error_details', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _thumbnailMeta = const VerificationMeta('thumbnail');
  late final GeneratedColumn<String?> thumbnail = GeneratedColumn<String?>(
      'thumbnail', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        galleryId,
        totalCount,
        downloadedCount,
        createdAt,
        queuedAt,
        state,
        errorDetails,
        thumbnail
      ];
  @override
  String get aliasedName => _alias ?? 'download_tasks';
  @override
  String get actualTableName => 'download_tasks';
  @override
  VerificationContext validateIntegrity(Insertable<DownloadTaskEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('gallery_id')) {
      context.handle(_galleryIdMeta,
          galleryId.isAcceptableOrUnknown(data['gallery_id']!, _galleryIdMeta));
    }
    if (data.containsKey('total_count')) {
      context.handle(
          _totalCountMeta,
          totalCount.isAcceptableOrUnknown(
              data['total_count']!, _totalCountMeta));
    } else if (isInserting) {
      context.missing(_totalCountMeta);
    }
    if (data.containsKey('downloaded_count')) {
      context.handle(
          _downloadedCountMeta,
          downloadedCount.isAcceptableOrUnknown(
              data['downloaded_count']!, _downloadedCountMeta));
    } else if (isInserting) {
      context.missing(_downloadedCountMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('queued_at')) {
      context.handle(_queuedAtMeta,
          queuedAt.isAcceptableOrUnknown(data['queued_at']!, _queuedAtMeta));
    } else if (isInserting) {
      context.missing(_queuedAtMeta);
    }
    context.handle(_stateMeta, const VerificationResult.success());
    if (data.containsKey('error_details')) {
      context.handle(
          _errorDetailsMeta,
          errorDetails.isAcceptableOrUnknown(
              data['error_details']!, _errorDetailsMeta));
    }
    if (data.containsKey('thumbnail')) {
      context.handle(_thumbnailMeta,
          thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {galleryId};
  @override
  DownloadTaskEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DownloadTaskEntry.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DownloadTasksTable createAlias(String alias) {
    return $DownloadTasksTable(_db, alias);
  }

  static TypeConverter<DownloadTaskState, String> $converter0 =
      const EnumStringConverter(DownloadTaskState.values);
}

class DownloadedImageEntry extends DataClass
    implements Insertable<DownloadedImageEntry> {
  final int galleryId;
  final int page;
  final String key;
  final int width;
  final int height;
  final int size;
  final String path;
  final DateTime downloadedAt;
  DownloadedImageEntry(
      {required this.galleryId,
      required this.page,
      required this.key,
      required this.width,
      required this.height,
      required this.size,
      required this.path,
      required this.downloadedAt});
  factory DownloadedImageEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DownloadedImageEntry(
      galleryId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}gallery_id'])!,
      page: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}page'])!,
      key: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}key'])!,
      width: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}width'])!,
      height: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}height'])!,
      size: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}size'])!,
      path: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}path'])!,
      downloadedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}downloaded_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['gallery_id'] = Variable<int>(galleryId);
    map['page'] = Variable<int>(page);
    map['key'] = Variable<String>(key);
    map['width'] = Variable<int>(width);
    map['height'] = Variable<int>(height);
    map['size'] = Variable<int>(size);
    map['path'] = Variable<String>(path);
    map['downloaded_at'] = Variable<DateTime>(downloadedAt);
    return map;
  }

  DownloadedImagesCompanion toCompanion(bool nullToAbsent) {
    return DownloadedImagesCompanion(
      galleryId: Value(galleryId),
      page: Value(page),
      key: Value(key),
      width: Value(width),
      height: Value(height),
      size: Value(size),
      path: Value(path),
      downloadedAt: Value(downloadedAt),
    );
  }

  factory DownloadedImageEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DownloadedImageEntry(
      galleryId: serializer.fromJson<int>(json['galleryId']),
      page: serializer.fromJson<int>(json['page']),
      key: serializer.fromJson<String>(json['key']),
      width: serializer.fromJson<int>(json['width']),
      height: serializer.fromJson<int>(json['height']),
      size: serializer.fromJson<int>(json['size']),
      path: serializer.fromJson<String>(json['path']),
      downloadedAt: serializer.fromJson<DateTime>(json['downloadedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'galleryId': serializer.toJson<int>(galleryId),
      'page': serializer.toJson<int>(page),
      'key': serializer.toJson<String>(key),
      'width': serializer.toJson<int>(width),
      'height': serializer.toJson<int>(height),
      'size': serializer.toJson<int>(size),
      'path': serializer.toJson<String>(path),
      'downloadedAt': serializer.toJson<DateTime>(downloadedAt),
    };
  }

  DownloadedImageEntry copyWith(
          {int? galleryId,
          int? page,
          String? key,
          int? width,
          int? height,
          int? size,
          String? path,
          DateTime? downloadedAt}) =>
      DownloadedImageEntry(
        galleryId: galleryId ?? this.galleryId,
        page: page ?? this.page,
        key: key ?? this.key,
        width: width ?? this.width,
        height: height ?? this.height,
        size: size ?? this.size,
        path: path ?? this.path,
        downloadedAt: downloadedAt ?? this.downloadedAt,
      );
  @override
  String toString() {
    return (StringBuffer('DownloadedImageEntry(')
          ..write('galleryId: $galleryId, ')
          ..write('page: $page, ')
          ..write('key: $key, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('size: $size, ')
          ..write('path: $path, ')
          ..write('downloadedAt: $downloadedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      galleryId.hashCode,
      $mrjc(
          page.hashCode,
          $mrjc(
              key.hashCode,
              $mrjc(
                  width.hashCode,
                  $mrjc(
                      height.hashCode,
                      $mrjc(size.hashCode,
                          $mrjc(path.hashCode, downloadedAt.hashCode))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DownloadedImageEntry &&
          other.galleryId == this.galleryId &&
          other.page == this.page &&
          other.key == this.key &&
          other.width == this.width &&
          other.height == this.height &&
          other.size == this.size &&
          other.path == this.path &&
          other.downloadedAt == this.downloadedAt);
}

class DownloadedImagesCompanion extends UpdateCompanion<DownloadedImageEntry> {
  final Value<int> galleryId;
  final Value<int> page;
  final Value<String> key;
  final Value<int> width;
  final Value<int> height;
  final Value<int> size;
  final Value<String> path;
  final Value<DateTime> downloadedAt;
  const DownloadedImagesCompanion({
    this.galleryId = const Value.absent(),
    this.page = const Value.absent(),
    this.key = const Value.absent(),
    this.width = const Value.absent(),
    this.height = const Value.absent(),
    this.size = const Value.absent(),
    this.path = const Value.absent(),
    this.downloadedAt = const Value.absent(),
  });
  DownloadedImagesCompanion.insert({
    required int galleryId,
    required int page,
    required String key,
    required int width,
    required int height,
    required int size,
    required String path,
    this.downloadedAt = const Value.absent(),
  })  : galleryId = Value(galleryId),
        page = Value(page),
        key = Value(key),
        width = Value(width),
        height = Value(height),
        size = Value(size),
        path = Value(path);
  static Insertable<DownloadedImageEntry> custom({
    Expression<int>? galleryId,
    Expression<int>? page,
    Expression<String>? key,
    Expression<int>? width,
    Expression<int>? height,
    Expression<int>? size,
    Expression<String>? path,
    Expression<DateTime>? downloadedAt,
  }) {
    return RawValuesInsertable({
      if (galleryId != null) 'gallery_id': galleryId,
      if (page != null) 'page': page,
      if (key != null) 'key': key,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      if (size != null) 'size': size,
      if (path != null) 'path': path,
      if (downloadedAt != null) 'downloaded_at': downloadedAt,
    });
  }

  DownloadedImagesCompanion copyWith(
      {Value<int>? galleryId,
      Value<int>? page,
      Value<String>? key,
      Value<int>? width,
      Value<int>? height,
      Value<int>? size,
      Value<String>? path,
      Value<DateTime>? downloadedAt}) {
    return DownloadedImagesCompanion(
      galleryId: galleryId ?? this.galleryId,
      page: page ?? this.page,
      key: key ?? this.key,
      width: width ?? this.width,
      height: height ?? this.height,
      size: size ?? this.size,
      path: path ?? this.path,
      downloadedAt: downloadedAt ?? this.downloadedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (galleryId.present) {
      map['gallery_id'] = Variable<int>(galleryId.value);
    }
    if (page.present) {
      map['page'] = Variable<int>(page.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (width.present) {
      map['width'] = Variable<int>(width.value);
    }
    if (height.present) {
      map['height'] = Variable<int>(height.value);
    }
    if (size.present) {
      map['size'] = Variable<int>(size.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (downloadedAt.present) {
      map['downloaded_at'] = Variable<DateTime>(downloadedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DownloadedImagesCompanion(')
          ..write('galleryId: $galleryId, ')
          ..write('page: $page, ')
          ..write('key: $key, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('size: $size, ')
          ..write('path: $path, ')
          ..write('downloadedAt: $downloadedAt')
          ..write(')'))
        .toString();
  }
}

class $DownloadedImagesTable extends DownloadedImages
    with TableInfo<$DownloadedImagesTable, DownloadedImageEntry> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DownloadedImagesTable(this._db, [this._alias]);
  final VerificationMeta _galleryIdMeta = const VerificationMeta('galleryId');
  late final GeneratedColumn<int?> galleryId = GeneratedColumn<int?>(
      'gallery_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _pageMeta = const VerificationMeta('page');
  late final GeneratedColumn<int?> page = GeneratedColumn<int?>(
      'page', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _keyMeta = const VerificationMeta('key');
  late final GeneratedColumn<String?> key = GeneratedColumn<String?>(
      'key', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _widthMeta = const VerificationMeta('width');
  late final GeneratedColumn<int?> width = GeneratedColumn<int?>(
      'width', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _heightMeta = const VerificationMeta('height');
  late final GeneratedColumn<int?> height = GeneratedColumn<int?>(
      'height', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _sizeMeta = const VerificationMeta('size');
  late final GeneratedColumn<int?> size = GeneratedColumn<int?>(
      'size', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _pathMeta = const VerificationMeta('path');
  late final GeneratedColumn<String?> path = GeneratedColumn<String?>(
      'path', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _downloadedAtMeta =
      const VerificationMeta('downloadedAt');
  late final GeneratedColumn<DateTime?> downloadedAt =
      GeneratedColumn<DateTime?>('downloaded_at', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [galleryId, page, key, width, height, size, path, downloadedAt];
  @override
  String get aliasedName => _alias ?? 'downloaded_images';
  @override
  String get actualTableName => 'downloaded_images';
  @override
  VerificationContext validateIntegrity(
      Insertable<DownloadedImageEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('gallery_id')) {
      context.handle(_galleryIdMeta,
          galleryId.isAcceptableOrUnknown(data['gallery_id']!, _galleryIdMeta));
    } else if (isInserting) {
      context.missing(_galleryIdMeta);
    }
    if (data.containsKey('page')) {
      context.handle(
          _pageMeta, page.isAcceptableOrUnknown(data['page']!, _pageMeta));
    } else if (isInserting) {
      context.missing(_pageMeta);
    }
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('width')) {
      context.handle(
          _widthMeta, width.isAcceptableOrUnknown(data['width']!, _widthMeta));
    } else if (isInserting) {
      context.missing(_widthMeta);
    }
    if (data.containsKey('height')) {
      context.handle(_heightMeta,
          height.isAcceptableOrUnknown(data['height']!, _heightMeta));
    } else if (isInserting) {
      context.missing(_heightMeta);
    }
    if (data.containsKey('size')) {
      context.handle(
          _sizeMeta, size.isAcceptableOrUnknown(data['size']!, _sizeMeta));
    } else if (isInserting) {
      context.missing(_sizeMeta);
    }
    if (data.containsKey('path')) {
      context.handle(
          _pathMeta, path.isAcceptableOrUnknown(data['path']!, _pathMeta));
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    if (data.containsKey('downloaded_at')) {
      context.handle(
          _downloadedAtMeta,
          downloadedAt.isAcceptableOrUnknown(
              data['downloaded_at']!, _downloadedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {galleryId, page};
  @override
  DownloadedImageEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DownloadedImageEntry.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DownloadedImagesTable createAlias(String alias) {
    return $DownloadedImagesTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  _$Database.connect(DatabaseConnection c) : super.connect(c);
  late final $GalleriesTable galleries = $GalleriesTable(this);
  late final $SearchHistoriesTable searchHistories =
      $SearchHistoriesTable(this);
  late final $DownloadTasksTable downloadTasks = $DownloadTasksTable(this);
  late final $DownloadedImagesTable downloadedImages =
      $DownloadedImagesTable(this);
  late final GalleriesDao galleriesDao = GalleriesDao(this as Database);
  late final SearchHistoriesDao searchHistoriesDao =
      SearchHistoriesDao(this as Database);
  late final DownloadTasksDao downloadTasksDao =
      DownloadTasksDao(this as Database);
  late final DownloadedImagesDao downloadedImagesDao =
      DownloadedImagesDao(this as Database);
  late final HistoryDao historyDao = HistoryDao(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [galleries, searchHistories, downloadTasks, downloadedImages];
}
