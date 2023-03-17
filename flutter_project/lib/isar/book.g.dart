// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetBookCollection on Isar {
  IsarCollection<Book> get books => getCollection();
}

const BookSchema = CollectionSchema(
  name: 'Book',
  schema:
      '{"name":"Book","idName":"id","properties":[{"name":"catalog","type":"String"},{"name":"image","type":"String"},{"name":"title","type":"String"},{"name":"url","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'catalog': 0, 'image': 1, 'title': 2, 'url': 3},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _bookGetId,
  setId: _bookSetId,
  getLinks: _bookGetLinks,
  attachLinks: _bookAttachLinks,
  serializeNative: _bookSerializeNative,
  deserializeNative: _bookDeserializeNative,
  deserializePropNative: _bookDeserializePropNative,
  serializeWeb: _bookSerializeWeb,
  deserializeWeb: _bookDeserializeWeb,
  deserializePropWeb: _bookDeserializePropWeb,
  version: 3,
);

int? _bookGetId(Book object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _bookSetId(Book object, int id) {
  object.id = id;
}

List<IsarLinkBase> _bookGetLinks(Book object) {
  return [];
}

void _bookSerializeNative(IsarCollection<Book> collection, IsarRawObject rawObj,
    Book object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.catalog;
  final _catalog = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_catalog.length) as int;
  final value1 = object.image;
  final _image = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_image.length) as int;
  final value2 = object.title;
  final _title = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_title.length) as int;
  final value3 = object.url;
  final _url = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_url.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _catalog);
  writer.writeBytes(offsets[1], _image);
  writer.writeBytes(offsets[2], _title);
  writer.writeBytes(offsets[3], _url);
}

Book _bookDeserializeNative(IsarCollection<Book> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Book();
  object.catalog = reader.readString(offsets[0]);
  object.id = id;
  object.image = reader.readString(offsets[1]);
  object.title = reader.readString(offsets[2]);
  object.url = reader.readString(offsets[3]);
  return object;
}

P _bookDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _bookSerializeWeb(IsarCollection<Book> collection, Book object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'catalog', object.catalog);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'image', object.image);
  IsarNative.jsObjectSet(jsObj, 'title', object.title);
  IsarNative.jsObjectSet(jsObj, 'url', object.url);
  return jsObj;
}

Book _bookDeserializeWeb(IsarCollection<Book> collection, dynamic jsObj) {
  final object = Book();
  object.catalog = IsarNative.jsObjectGet(jsObj, 'catalog') ?? '';
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.image = IsarNative.jsObjectGet(jsObj, 'image') ?? '';
  object.title = IsarNative.jsObjectGet(jsObj, 'title') ?? '';
  object.url = IsarNative.jsObjectGet(jsObj, 'url') ?? '';
  return object;
}

P _bookDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'catalog':
      return (IsarNative.jsObjectGet(jsObj, 'catalog') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'image':
      return (IsarNative.jsObjectGet(jsObj, 'image') ?? '') as P;
    case 'title':
      return (IsarNative.jsObjectGet(jsObj, 'title') ?? '') as P;
    case 'url':
      return (IsarNative.jsObjectGet(jsObj, 'url') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _bookAttachLinks(IsarCollection col, int id, Book object) {}

extension BookQueryWhereSort on QueryBuilder<Book, Book, QWhere> {
  QueryBuilder<Book, Book, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension BookQueryWhere on QueryBuilder<Book, Book, QWhereClause> {
  QueryBuilder<Book, Book, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Book, Book, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<Book, Book, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Book, Book, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Book, Book, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension BookQueryFilter on QueryBuilder<Book, Book, QFilterCondition> {
  QueryBuilder<Book, Book, QAfterFilterCondition> catalogEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'catalog',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> catalogGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'catalog',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> catalogLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'catalog',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> catalogBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'catalog',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> catalogStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'catalog',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> catalogEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'catalog',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> catalogContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'catalog',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> catalogMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'catalog',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> imageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'image',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> imageGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'image',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> imageLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'image',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> imageBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'image',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> imageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'image',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> imageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'image',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> imageContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'image',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> imageMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'image',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> titleLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'title',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> titleContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> titleMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'title',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> urlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> urlGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> urlLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> urlBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'url',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> urlContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Book, Book, QAfterFilterCondition> urlMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'url',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension BookQueryLinks on QueryBuilder<Book, Book, QFilterCondition> {}

extension BookQueryWhereSortBy on QueryBuilder<Book, Book, QSortBy> {
  QueryBuilder<Book, Book, QAfterSortBy> sortByCatalog() {
    return addSortByInternal('catalog', Sort.asc);
  }

  QueryBuilder<Book, Book, QAfterSortBy> sortByCatalogDesc() {
    return addSortByInternal('catalog', Sort.desc);
  }

  QueryBuilder<Book, Book, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Book, Book, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Book, Book, QAfterSortBy> sortByImage() {
    return addSortByInternal('image', Sort.asc);
  }

  QueryBuilder<Book, Book, QAfterSortBy> sortByImageDesc() {
    return addSortByInternal('image', Sort.desc);
  }

  QueryBuilder<Book, Book, QAfterSortBy> sortByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<Book, Book, QAfterSortBy> sortByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }

  QueryBuilder<Book, Book, QAfterSortBy> sortByUrl() {
    return addSortByInternal('url', Sort.asc);
  }

  QueryBuilder<Book, Book, QAfterSortBy> sortByUrlDesc() {
    return addSortByInternal('url', Sort.desc);
  }
}

extension BookQueryWhereSortThenBy on QueryBuilder<Book, Book, QSortThenBy> {
  QueryBuilder<Book, Book, QAfterSortBy> thenByCatalog() {
    return addSortByInternal('catalog', Sort.asc);
  }

  QueryBuilder<Book, Book, QAfterSortBy> thenByCatalogDesc() {
    return addSortByInternal('catalog', Sort.desc);
  }

  QueryBuilder<Book, Book, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Book, Book, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Book, Book, QAfterSortBy> thenByImage() {
    return addSortByInternal('image', Sort.asc);
  }

  QueryBuilder<Book, Book, QAfterSortBy> thenByImageDesc() {
    return addSortByInternal('image', Sort.desc);
  }

  QueryBuilder<Book, Book, QAfterSortBy> thenByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<Book, Book, QAfterSortBy> thenByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }

  QueryBuilder<Book, Book, QAfterSortBy> thenByUrl() {
    return addSortByInternal('url', Sort.asc);
  }

  QueryBuilder<Book, Book, QAfterSortBy> thenByUrlDesc() {
    return addSortByInternal('url', Sort.desc);
  }
}

extension BookQueryWhereDistinct on QueryBuilder<Book, Book, QDistinct> {
  QueryBuilder<Book, Book, QDistinct> distinctByCatalog(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('catalog', caseSensitive: caseSensitive);
  }

  QueryBuilder<Book, Book, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Book, Book, QDistinct> distinctByImage(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('image', caseSensitive: caseSensitive);
  }

  QueryBuilder<Book, Book, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }

  QueryBuilder<Book, Book, QDistinct> distinctByUrl(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('url', caseSensitive: caseSensitive);
  }
}

extension BookQueryProperty on QueryBuilder<Book, Book, QQueryProperty> {
  QueryBuilder<Book, String, QQueryOperations> catalogProperty() {
    return addPropertyNameInternal('catalog');
  }

  QueryBuilder<Book, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Book, String, QQueryOperations> imageProperty() {
    return addPropertyNameInternal('image');
  }

  QueryBuilder<Book, String, QQueryOperations> titleProperty() {
    return addPropertyNameInternal('title');
  }

  QueryBuilder<Book, String, QQueryOperations> urlProperty() {
    return addPropertyNameInternal('url');
  }
}
