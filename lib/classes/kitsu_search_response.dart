class KitsuSearchResponse {
  List<Data>? data;

  KitsuSearchResponse({this.data});

  KitsuSearchResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? type;
  Attributes? attributes;

  Data({this.id, this.type, this.attributes});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? createdAt;
  String? updatedAt;
  String? slug;
  String? synopsis;
  String? description;
  int? coverImageTopOffset;
  Titles? titles;
  String? canonicalTitle;
  List<String>? abbreviatedTitles;
  String? averageRating;
  RatingFrequencies? ratingFrequencies;
  int? userCount;
  int? favoritesCount;
  String? startDate;
  String? endDate;
  int? popularityRank;
  int? ratingRank;
  String? ageRating;
  String? ageRatingGuide;
  String? subtype;
  String? status;
  PosterImage? posterImage;
  CoverImage? coverImage;
  int? chapterCount;
  int? volumeCount;
  String? serialization;
  String? mangaType;

  Attributes(
      {this.createdAt,
      this.updatedAt,
      this.slug,
      this.synopsis,
      this.description,
      this.coverImageTopOffset,
      this.titles,
      this.canonicalTitle,
      this.abbreviatedTitles,
      this.averageRating,
      this.ratingFrequencies,
      this.userCount,
      this.favoritesCount,
      this.startDate,
      this.endDate,
      this.popularityRank,
      this.ratingRank,
      this.ageRating,
      this.ageRatingGuide,
      this.subtype,
      this.status,
      this.posterImage,
      this.coverImage,
      this.chapterCount,
      this.volumeCount,
      this.serialization,
      this.mangaType});

  Attributes.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    slug = json['slug'];
    synopsis = json['synopsis'];
    description = json['description'];
    coverImageTopOffset = json['coverImageTopOffset'];
    titles = json['titles'] != null ? Titles.fromJson(json['titles']) : null;
    canonicalTitle = json['canonicalTitle'];
    abbreviatedTitles = json['abbreviatedTitles'].cast<String>();
    averageRating = json['averageRating'];
    ratingFrequencies = json['ratingFrequencies'] != null
        ? RatingFrequencies.fromJson(json['ratingFrequencies'])
        : null;
    userCount = json['userCount'];
    favoritesCount = json['favoritesCount'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    popularityRank = json['popularityRank'];
    ratingRank = json['ratingRank'];
    ageRating = json['ageRating'];
    ageRatingGuide = json['ageRatingGuide'];
    subtype = json['subtype'];
    status = json['status'];
    posterImage = json['posterImage'] != null
        ? PosterImage.fromJson(json['posterImage'])
        : null;
    coverImage = json['coverImage'] != null
        ? CoverImage.fromJson(json['coverImage'])
        : null;
    chapterCount = json['chapterCount'];
    volumeCount = json['volumeCount'];
    serialization = json['serialization'];
    mangaType = json['mangaType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['slug'] = slug;
    data['synopsis'] = synopsis;
    data['description'] = description;
    data['coverImageTopOffset'] = coverImageTopOffset;
    if (titles != null) {
      data['titles'] = titles!.toJson();
    }
    data['canonicalTitle'] = canonicalTitle;
    data['abbreviatedTitles'] = abbreviatedTitles;
    data['averageRating'] = averageRating;
    if (ratingFrequencies != null) {
      data['ratingFrequencies'] = ratingFrequencies!.toJson();
    }
    data['userCount'] = userCount;
    data['favoritesCount'] = favoritesCount;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['popularityRank'] = popularityRank;
    data['ratingRank'] = ratingRank;
    data['ageRating'] = ageRating;
    data['ageRatingGuide'] = ageRatingGuide;
    data['subtype'] = subtype;
    data['status'] = status;
    if (posterImage != null) {
      data['posterImage'] = posterImage!.toJson();
    }
    if (coverImage != null) {
      data['coverImage'] = coverImage!.toJson();
    }
    data['chapterCount'] = chapterCount;
    data['volumeCount'] = volumeCount;
    data['serialization'] = serialization;
    data['mangaType'] = mangaType;
    return data;
  }
}

class Titles {
  String? ar;
  String? en;
  String? csCz;
  String? enJp;
  String? esEs;
  String? faIr;
  String? fiFi;
  String? frFr;
  String? hrHr;
  String? itIt;
  String? jaJp;
  String? koKr;
  String? ptBr;
  String? ruRu;
  String? thTh;
  String? trTr;
  String? viVn;
  String? zhCn;

  Titles(
      {this.ar,
      this.en,
      this.csCz,
      this.enJp,
      this.esEs,
      this.faIr,
      this.fiFi,
      this.frFr,
      this.hrHr,
      this.itIt,
      this.jaJp,
      this.koKr,
      this.ptBr,
      this.ruRu,
      this.thTh,
      this.trTr,
      this.viVn,
      this.zhCn});

  Titles.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
    csCz = json['cs_cz'];
    enJp = json['en_jp'];
    esEs = json['es_es'];
    faIr = json['fa_ir'];
    fiFi = json['fi_fi'];
    frFr = json['fr_fr'];
    hrHr = json['hr_hr'];
    itIt = json['it_it'];
    jaJp = json['ja_jp'];
    koKr = json['ko_kr'];
    ptBr = json['pt_br'];
    ruRu = json['ru_ru'];
    thTh = json['th_th'];
    trTr = json['tr_tr'];
    viVn = json['vi_vn'];
    zhCn = json['zh_cn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ar'] = ar;
    data['en'] = en;
    data['cs_cz'] = csCz;
    data['en_jp'] = enJp;
    data['es_es'] = esEs;
    data['fa_ir'] = faIr;
    data['fi_fi'] = fiFi;
    data['fr_fr'] = frFr;
    data['hr_hr'] = hrHr;
    data['it_it'] = itIt;
    data['ja_jp'] = jaJp;
    data['ko_kr'] = koKr;
    data['pt_br'] = ptBr;
    data['ru_ru'] = ruRu;
    data['th_th'] = thTh;
    data['tr_tr'] = trTr;
    data['vi_vn'] = viVn;
    data['zh_cn'] = zhCn;
    return data;
  }
}

class RatingFrequencies {
  String? s2;
  String? s3;
  String? s4;
  String? s5;
  String? s6;
  String? s7;
  String? s8;
  String? s9;
  String? s10;
  String? s11;
  String? s12;
  String? s13;
  String? s14;
  String? s15;
  String? s16;
  String? s17;
  String? s18;
  String? s19;
  String? s20;

  RatingFrequencies(
      {this.s2,
      this.s3,
      this.s4,
      this.s5,
      this.s6,
      this.s7,
      this.s8,
      this.s9,
      this.s10,
      this.s11,
      this.s12,
      this.s13,
      this.s14,
      this.s15,
      this.s16,
      this.s17,
      this.s18,
      this.s19,
      this.s20});

  RatingFrequencies.fromJson(Map<String, dynamic> json) {
    s2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
    s5 = json['5'];
    s6 = json['6'];
    s7 = json['7'];
    s8 = json['8'];
    s9 = json['9'];
    s10 = json['10'];
    s11 = json['11'];
    s12 = json['12'];
    s13 = json['13'];
    s14 = json['14'];
    s15 = json['15'];
    s16 = json['16'];
    s17 = json['17'];
    s18 = json['18'];
    s19 = json['19'];
    s20 = json['20'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['2'] = s2;
    data['3'] = s3;
    data['4'] = s4;
    data['5'] = s5;
    data['6'] = s6;
    data['7'] = s7;
    data['8'] = s8;
    data['9'] = s9;
    data['10'] = s10;
    data['11'] = s11;
    data['12'] = s12;
    data['13'] = s13;
    data['14'] = s14;
    data['15'] = s15;
    data['16'] = s16;
    data['17'] = s17;
    data['18'] = s18;
    data['19'] = s19;
    data['20'] = s20;
    return data;
  }
}

class PosterImage {
  String? tiny;
  String? large;
  String? small;
  String? medium;
  String? original;
  Meta? meta;

  PosterImage(
      {this.tiny,
      this.large,
      this.small,
      this.medium,
      this.original,
      this.meta});

  PosterImage.fromJson(Map<String, dynamic> json) {
    tiny = json['tiny'];
    large = json['large'];
    small = json['small'];
    medium = json['medium'];
    original = json['original'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tiny'] = tiny;
    data['large'] = large;
    data['small'] = small;
    data['medium'] = medium;
    data['original'] = original;
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Meta {
  Dimensions? dimensions;

  Meta({this.dimensions});

  Meta.fromJson(Map<String, dynamic> json) {
    dimensions = json['dimensions'] != null
        ? Dimensions.fromJson(json['dimensions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dimensions != null) {
      data['dimensions'] = dimensions!.toJson();
    }
    return data;
  }
}

class Dimensions {
  Tiny? tiny;
  Tiny? large;
  Tiny? small;
  Tiny? medium;

  Dimensions({this.tiny, this.large, this.small, this.medium});

  Dimensions.fromJson(Map<String, dynamic> json) {
    tiny = json['tiny'] != null ? Tiny.fromJson(json['tiny']) : null;
    large = json['large'] != null ? Tiny.fromJson(json['large']) : null;
    small = json['small'] != null ? Tiny.fromJson(json['small']) : null;
    medium = json['medium'] != null ? Tiny.fromJson(json['medium']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tiny != null) {
      data['tiny'] = tiny!.toJson();
    }
    if (large != null) {
      data['large'] = large!.toJson();
    }
    if (small != null) {
      data['small'] = small!.toJson();
    }
    if (medium != null) {
      data['medium'] = medium!.toJson();
    }
    return data;
  }
}

class Tiny {
  Null? width;
  Null? height;

  Tiny({this.width, this.height});

  Tiny.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['width'] = width;
    data['height'] = height;
    return data;
  }
}

class CoverImage {
  String? tiny;
  String? large;
  String? small;
  String? original;
  Meta? meta;

  CoverImage({this.tiny, this.large, this.small, this.original, this.meta});

  CoverImage.fromJson(Map<String, dynamic> json) {
    tiny = json['tiny'];
    large = json['large'];
    small = json['small'];
    original = json['original'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tiny'] = tiny;
    data['large'] = large;
    data['small'] = small;
    data['original'] = original;
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}
