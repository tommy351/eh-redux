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
  final String uploader;
  final int fileCount;
  final int fileSize;
  final bool expunged;
  final double rating;
  final DateTime posted;
  final List<String> tags;
  final DateTime lastReadAt;
  final int lastReadPage;
  GalleryEntry(
      {@required this.id,
      @required this.token,
      @required this.title,
      @required this.titleJpn,
      @required this.category,
      @required this.uploader,
      @required this.fileCount,
      @required this.fileSize,
      @required this.expunged,
      @required this.rating,
      @required this.posted,
      @required this.tags,
      this.lastReadAt,
      this.lastReadPage});
  factory GalleryEntry.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final doubleType = db.typeSystem.forDartType<double>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return GalleryEntry(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      token:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}token']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      titleJpn: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}title_jpn']),
      category: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}category']),
      uploader: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}uploader']),
      fileCount:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}file_count']),
      fileSize:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}file_size']),
      expunged:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}expunged']),
      rating:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}rating']),
      posted: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}posted']),
      tags: $GalleriesTable.$converter0.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}tags'])),
      lastReadAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_read_at']),
      lastReadPage: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_read_page']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || token != null) {
      map['token'] = Variable<String>(token);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || titleJpn != null) {
      map['title_jpn'] = Variable<String>(titleJpn);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || uploader != null) {
      map['uploader'] = Variable<String>(uploader);
    }
    if (!nullToAbsent || fileCount != null) {
      map['file_count'] = Variable<int>(fileCount);
    }
    if (!nullToAbsent || fileSize != null) {
      map['file_size'] = Variable<int>(fileSize);
    }
    if (!nullToAbsent || expunged != null) {
      map['expunged'] = Variable<bool>(expunged);
    }
    if (!nullToAbsent || rating != null) {
      map['rating'] = Variable<double>(rating);
    }
    if (!nullToAbsent || posted != null) {
      map['posted'] = Variable<DateTime>(posted);
    }
    if (!nullToAbsent || tags != null) {
      final converter = $GalleriesTable.$converter0;
      map['tags'] = Variable<String>(converter.mapToSql(tags));
    }
    if (!nullToAbsent || lastReadAt != null) {
      map['last_read_at'] = Variable<DateTime>(lastReadAt);
    }
    if (!nullToAbsent || lastReadPage != null) {
      map['last_read_page'] = Variable<int>(lastReadPage);
    }
    return map;
  }

  GalleriesCompanion toCompanion(bool nullToAbsent) {
    return GalleriesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      token:
          token == null && nullToAbsent ? const Value.absent() : Value(token),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      titleJpn: titleJpn == null && nullToAbsent
          ? const Value.absent()
          : Value(titleJpn),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      uploader: uploader == null && nullToAbsent
          ? const Value.absent()
          : Value(uploader),
      fileCount: fileCount == null && nullToAbsent
          ? const Value.absent()
          : Value(fileCount),
      fileSize: fileSize == null && nullToAbsent
          ? const Value.absent()
          : Value(fileSize),
      expunged: expunged == null && nullToAbsent
          ? const Value.absent()
          : Value(expunged),
      rating:
          rating == null && nullToAbsent ? const Value.absent() : Value(rating),
      posted:
          posted == null && nullToAbsent ? const Value.absent() : Value(posted),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      lastReadAt: lastReadAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReadAt),
      lastReadPage: lastReadPage == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReadPage),
    );
  }

  factory GalleryEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return GalleryEntry(
      id: serializer.fromJson<int>(json['id']),
      token: serializer.fromJson<String>(json['token']),
      title: serializer.fromJson<String>(json['title']),
      titleJpn: serializer.fromJson<String>(json['titleJpn']),
      category: serializer.fromJson<String>(json['category']),
      uploader: serializer.fromJson<String>(json['uploader']),
      fileCount: serializer.fromJson<int>(json['fileCount']),
      fileSize: serializer.fromJson<int>(json['fileSize']),
      expunged: serializer.fromJson<bool>(json['expunged']),
      rating: serializer.fromJson<double>(json['rating']),
      posted: serializer.fromJson<DateTime>(json['posted']),
      tags: serializer.fromJson<List<String>>(json['tags']),
      lastReadAt: serializer.fromJson<DateTime>(json['lastReadAt']),
      lastReadPage: serializer.fromJson<int>(json['lastReadPage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'token': serializer.toJson<String>(token),
      'title': serializer.toJson<String>(title),
      'titleJpn': serializer.toJson<String>(titleJpn),
      'category': serializer.toJson<String>(category),
      'uploader': serializer.toJson<String>(uploader),
      'fileCount': serializer.toJson<int>(fileCount),
      'fileSize': serializer.toJson<int>(fileSize),
      'expunged': serializer.toJson<bool>(expunged),
      'rating': serializer.toJson<double>(rating),
      'posted': serializer.toJson<DateTime>(posted),
      'tags': serializer.toJson<List<String>>(tags),
      'lastReadAt': serializer.toJson<DateTime>(lastReadAt),
      'lastReadPage': serializer.toJson<int>(lastReadPage),
    };
  }

  GalleryEntry copyWith(
          {int id,
          String token,
          String title,
          String titleJpn,
          String category,
          String uploader,
          int fileCount,
          int fileSize,
          bool expunged,
          double rating,
          DateTime posted,
          List<String> tags,
          DateTime lastReadAt,
          int lastReadPage}) =>
      GalleryEntry(
        id: id ?? this.id,
        token: token ?? this.token,
        title: title ?? this.title,
        titleJpn: titleJpn ?? this.titleJpn,
        category: category ?? this.category,
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
                                                          .hashCode))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is GalleryEntry &&
          other.id == this.id &&
          other.token == this.token &&
          other.title == this.title &&
          other.titleJpn == this.titleJpn &&
          other.category == this.category &&
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
  final Value<String> uploader;
  final Value<int> fileCount;
  final Value<int> fileSize;
  final Value<bool> expunged;
  final Value<double> rating;
  final Value<DateTime> posted;
  final Value<List<String>> tags;
  final Value<DateTime> lastReadAt;
  final Value<int> lastReadPage;
  const GalleriesCompanion({
    this.id = const Value.absent(),
    this.token = const Value.absent(),
    this.title = const Value.absent(),
    this.titleJpn = const Value.absent(),
    this.category = const Value.absent(),
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
    @required String token,
    @required String title,
    @required String titleJpn,
    @required String category,
    @required String uploader,
    @required int fileCount,
    @required int fileSize,
    @required bool expunged,
    @required double rating,
    @required DateTime posted,
    @required List<String> tags,
    this.lastReadAt = const Value.absent(),
    this.lastReadPage = const Value.absent(),
  })  : token = Value(token),
        title = Value(title),
        titleJpn = Value(titleJpn),
        category = Value(category),
        uploader = Value(uploader),
        fileCount = Value(fileCount),
        fileSize = Value(fileSize),
        expunged = Value(expunged),
        rating = Value(rating),
        posted = Value(posted),
        tags = Value(tags);
  static Insertable<GalleryEntry> custom({
    Expression<int> id,
    Expression<String> token,
    Expression<String> title,
    Expression<String> titleJpn,
    Expression<String> category,
    Expression<String> uploader,
    Expression<int> fileCount,
    Expression<int> fileSize,
    Expression<bool> expunged,
    Expression<double> rating,
    Expression<DateTime> posted,
    Expression<String> tags,
    Expression<DateTime> lastReadAt,
    Expression<int> lastReadPage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (token != null) 'token': token,
      if (title != null) 'title': title,
      if (titleJpn != null) 'title_jpn': titleJpn,
      if (category != null) 'category': category,
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
      {Value<int> id,
      Value<String> token,
      Value<String> title,
      Value<String> titleJpn,
      Value<String> category,
      Value<String> uploader,
      Value<int> fileCount,
      Value<int> fileSize,
      Value<bool> expunged,
      Value<double> rating,
      Value<DateTime> posted,
      Value<List<String>> tags,
      Value<DateTime> lastReadAt,
      Value<int> lastReadPage}) {
    return GalleriesCompanion(
      id: id ?? this.id,
      token: token ?? this.token,
      title: title ?? this.title,
      titleJpn: titleJpn ?? this.titleJpn,
      category: category ?? this.category,
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
      map['tags'] = Variable<String>(converter.mapToSql(tags.value));
    }
    if (lastReadAt.present) {
      map['last_read_at'] = Variable<DateTime>(lastReadAt.value);
    }
    if (lastReadPage.present) {
      map['last_read_page'] = Variable<int>(lastReadPage.value);
    }
    return map;
  }
}

class $GalleriesTable extends Galleries
    with TableInfo<$GalleriesTable, GalleryEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $GalleriesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _tokenMeta = const VerificationMeta('token');
  GeneratedTextColumn _token;
  @override
  GeneratedTextColumn get token => _token ??= _constructToken();
  GeneratedTextColumn _constructToken() {
    return GeneratedTextColumn(
      'token',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleJpnMeta = const VerificationMeta('titleJpn');
  GeneratedTextColumn _titleJpn;
  @override
  GeneratedTextColumn get titleJpn => _titleJpn ??= _constructTitleJpn();
  GeneratedTextColumn _constructTitleJpn() {
    return GeneratedTextColumn(
      'title_jpn',
      $tableName,
      false,
    );
  }

  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  GeneratedTextColumn _category;
  @override
  GeneratedTextColumn get category => _category ??= _constructCategory();
  GeneratedTextColumn _constructCategory() {
    return GeneratedTextColumn(
      'category',
      $tableName,
      false,
    );
  }

  final VerificationMeta _uploaderMeta = const VerificationMeta('uploader');
  GeneratedTextColumn _uploader;
  @override
  GeneratedTextColumn get uploader => _uploader ??= _constructUploader();
  GeneratedTextColumn _constructUploader() {
    return GeneratedTextColumn(
      'uploader',
      $tableName,
      false,
    );
  }

  final VerificationMeta _fileCountMeta = const VerificationMeta('fileCount');
  GeneratedIntColumn _fileCount;
  @override
  GeneratedIntColumn get fileCount => _fileCount ??= _constructFileCount();
  GeneratedIntColumn _constructFileCount() {
    return GeneratedIntColumn(
      'file_count',
      $tableName,
      false,
    );
  }

  final VerificationMeta _fileSizeMeta = const VerificationMeta('fileSize');
  GeneratedIntColumn _fileSize;
  @override
  GeneratedIntColumn get fileSize => _fileSize ??= _constructFileSize();
  GeneratedIntColumn _constructFileSize() {
    return GeneratedIntColumn(
      'file_size',
      $tableName,
      false,
    );
  }

  final VerificationMeta _expungedMeta = const VerificationMeta('expunged');
  GeneratedBoolColumn _expunged;
  @override
  GeneratedBoolColumn get expunged => _expunged ??= _constructExpunged();
  GeneratedBoolColumn _constructExpunged() {
    return GeneratedBoolColumn(
      'expunged',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ratingMeta = const VerificationMeta('rating');
  GeneratedRealColumn _rating;
  @override
  GeneratedRealColumn get rating => _rating ??= _constructRating();
  GeneratedRealColumn _constructRating() {
    return GeneratedRealColumn(
      'rating',
      $tableName,
      false,
    );
  }

  final VerificationMeta _postedMeta = const VerificationMeta('posted');
  GeneratedDateTimeColumn _posted;
  @override
  GeneratedDateTimeColumn get posted => _posted ??= _constructPosted();
  GeneratedDateTimeColumn _constructPosted() {
    return GeneratedDateTimeColumn(
      'posted',
      $tableName,
      false,
    );
  }

  final VerificationMeta _tagsMeta = const VerificationMeta('tags');
  GeneratedTextColumn _tags;
  @override
  GeneratedTextColumn get tags => _tags ??= _constructTags();
  GeneratedTextColumn _constructTags() {
    return GeneratedTextColumn(
      'tags',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lastReadAtMeta = const VerificationMeta('lastReadAt');
  GeneratedDateTimeColumn _lastReadAt;
  @override
  GeneratedDateTimeColumn get lastReadAt =>
      _lastReadAt ??= _constructLastReadAt();
  GeneratedDateTimeColumn _constructLastReadAt() {
    return GeneratedDateTimeColumn(
      'last_read_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _lastReadPageMeta =
      const VerificationMeta('lastReadPage');
  GeneratedIntColumn _lastReadPage;
  @override
  GeneratedIntColumn get lastReadPage =>
      _lastReadPage ??= _constructLastReadPage();
  GeneratedIntColumn _constructLastReadPage() {
    return GeneratedIntColumn(
      'last_read_page',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        token,
        title,
        titleJpn,
        category,
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
  $GalleriesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'galleries';
  @override
  final String actualTableName = 'galleries';
  @override
  VerificationContext validateIntegrity(Insertable<GalleryEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('token')) {
      context.handle(
          _tokenMeta, token.isAcceptableOrUnknown(data['token'], _tokenMeta));
    } else if (isInserting) {
      context.missing(_tokenMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('title_jpn')) {
      context.handle(_titleJpnMeta,
          titleJpn.isAcceptableOrUnknown(data['title_jpn'], _titleJpnMeta));
    } else if (isInserting) {
      context.missing(_titleJpnMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category'], _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('uploader')) {
      context.handle(_uploaderMeta,
          uploader.isAcceptableOrUnknown(data['uploader'], _uploaderMeta));
    } else if (isInserting) {
      context.missing(_uploaderMeta);
    }
    if (data.containsKey('file_count')) {
      context.handle(_fileCountMeta,
          fileCount.isAcceptableOrUnknown(data['file_count'], _fileCountMeta));
    } else if (isInserting) {
      context.missing(_fileCountMeta);
    }
    if (data.containsKey('file_size')) {
      context.handle(_fileSizeMeta,
          fileSize.isAcceptableOrUnknown(data['file_size'], _fileSizeMeta));
    } else if (isInserting) {
      context.missing(_fileSizeMeta);
    }
    if (data.containsKey('expunged')) {
      context.handle(_expungedMeta,
          expunged.isAcceptableOrUnknown(data['expunged'], _expungedMeta));
    } else if (isInserting) {
      context.missing(_expungedMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating'], _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('posted')) {
      context.handle(_postedMeta,
          posted.isAcceptableOrUnknown(data['posted'], _postedMeta));
    } else if (isInserting) {
      context.missing(_postedMeta);
    }
    context.handle(_tagsMeta, const VerificationResult.success());
    if (data.containsKey('last_read_at')) {
      context.handle(
          _lastReadAtMeta,
          lastReadAt.isAcceptableOrUnknown(
              data['last_read_at'], _lastReadAtMeta));
    }
    if (data.containsKey('last_read_page')) {
      context.handle(
          _lastReadPageMeta,
          lastReadPage.isAcceptableOrUnknown(
              data['last_read_page'], _lastReadPageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GalleryEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return GalleryEntry.fromData(data, _db, prefix: effectivePrefix);
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
  SearchHistoryEntry({@required this.query, @required this.lastQueriedAt});
  factory SearchHistoryEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return SearchHistoryEntry(
      query:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}query']),
      lastQueriedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_queried_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || query != null) {
      map['query'] = Variable<String>(query);
    }
    if (!nullToAbsent || lastQueriedAt != null) {
      map['last_queried_at'] = Variable<DateTime>(lastQueriedAt);
    }
    return map;
  }

  SearchHistoriesCompanion toCompanion(bool nullToAbsent) {
    return SearchHistoriesCompanion(
      query:
          query == null && nullToAbsent ? const Value.absent() : Value(query),
      lastQueriedAt: lastQueriedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastQueriedAt),
    );
  }

  factory SearchHistoryEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return SearchHistoryEntry(
      query: serializer.fromJson<String>(json['query']),
      lastQueriedAt: serializer.fromJson<DateTime>(json['lastQueriedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'query': serializer.toJson<String>(query),
      'lastQueriedAt': serializer.toJson<DateTime>(lastQueriedAt),
    };
  }

  SearchHistoryEntry copyWith({String query, DateTime lastQueriedAt}) =>
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
  bool operator ==(dynamic other) =>
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
    @required String query,
    @required DateTime lastQueriedAt,
  })  : query = Value(query),
        lastQueriedAt = Value(lastQueriedAt);
  static Insertable<SearchHistoryEntry> custom({
    Expression<String> query,
    Expression<DateTime> lastQueriedAt,
  }) {
    return RawValuesInsertable({
      if (query != null) 'query': query,
      if (lastQueriedAt != null) 'last_queried_at': lastQueriedAt,
    });
  }

  SearchHistoriesCompanion copyWith(
      {Value<String> query, Value<DateTime> lastQueriedAt}) {
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
}

class $SearchHistoriesTable extends SearchHistories
    with TableInfo<$SearchHistoriesTable, SearchHistoryEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $SearchHistoriesTable(this._db, [this._alias]);
  final VerificationMeta _queryMeta = const VerificationMeta('query');
  GeneratedTextColumn _query;
  @override
  GeneratedTextColumn get query => _query ??= _constructQuery();
  GeneratedTextColumn _constructQuery() {
    return GeneratedTextColumn(
      'query',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lastQueriedAtMeta =
      const VerificationMeta('lastQueriedAt');
  GeneratedDateTimeColumn _lastQueriedAt;
  @override
  GeneratedDateTimeColumn get lastQueriedAt =>
      _lastQueriedAt ??= _constructLastQueriedAt();
  GeneratedDateTimeColumn _constructLastQueriedAt() {
    return GeneratedDateTimeColumn(
      'last_queried_at',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [query, lastQueriedAt];
  @override
  $SearchHistoriesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'search_histories';
  @override
  final String actualTableName = 'search_histories';
  @override
  VerificationContext validateIntegrity(Insertable<SearchHistoryEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('query')) {
      context.handle(
          _queryMeta, query.isAcceptableOrUnknown(data['query'], _queryMeta));
    } else if (isInserting) {
      context.missing(_queryMeta);
    }
    if (data.containsKey('last_queried_at')) {
      context.handle(
          _lastQueriedAtMeta,
          lastQueriedAt.isAcceptableOrUnknown(
              data['last_queried_at'], _lastQueriedAtMeta));
    } else if (isInserting) {
      context.missing(_lastQueriedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {query};
  @override
  SearchHistoryEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return SearchHistoryEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $SearchHistoriesTable createAlias(String alias) {
    return $SearchHistoriesTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $GalleriesTable _galleries;
  $GalleriesTable get galleries => _galleries ??= $GalleriesTable(this);
  $SearchHistoriesTable _searchHistories;
  $SearchHistoriesTable get searchHistories =>
      _searchHistories ??= $SearchHistoriesTable(this);
  GalleriesDao _galleriesDao;
  GalleriesDao get galleriesDao =>
      _galleriesDao ??= GalleriesDao(this as Database);
  SearchHistoriesDao _searchHistoriesDao;
  SearchHistoriesDao get searchHistoriesDao =>
      _searchHistoriesDao ??= SearchHistoriesDao(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [galleries, searchHistories];
}
