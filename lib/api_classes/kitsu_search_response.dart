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
    titles =
        json['titles'] != null ? new Titles.fromJson(json['titles']) : null;
    canonicalTitle = json['canonicalTitle'];
    abbreviatedTitles = json['abbreviatedTitles'].cast<String>();
    averageRating = json['averageRating'];
    ratingFrequencies = json['ratingFrequencies'] != null
        ? new RatingFrequencies.fromJson(json['ratingFrequencies'])
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
        ? new PosterImage.fromJson(json['posterImage'])
        : null;
    coverImage = json['coverImage'] != null
        ? new CoverImage.fromJson(json['coverImage'])
        : null;
    chapterCount = json['chapterCount'];
    volumeCount = json['volumeCount'];
    serialization = json['serialization'];
    mangaType = json['mangaType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['slug'] = this.slug;
    data['synopsis'] = this.synopsis;
    data['description'] = this.description;
    data['coverImageTopOffset'] = this.coverImageTopOffset;
    if (this.titles != null) {
      data['titles'] = this.titles!.toJson();
    }
    data['canonicalTitle'] = this.canonicalTitle;
    data['abbreviatedTitles'] = this.abbreviatedTitles;
    data['averageRating'] = this.averageRating;
    if (this.ratingFrequencies != null) {
      data['ratingFrequencies'] = this.ratingFrequencies!.toJson();
    }
    data['userCount'] = this.userCount;
    data['favoritesCount'] = this.favoritesCount;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['popularityRank'] = this.popularityRank;
    data['ratingRank'] = this.ratingRank;
    data['ageRating'] = this.ageRating;
    data['ageRatingGuide'] = this.ageRatingGuide;
    data['subtype'] = this.subtype;
    data['status'] = this.status;
    if (this.posterImage != null) {
      data['posterImage'] = this.posterImage!.toJson();
    }
    if (this.coverImage != null) {
      data['coverImage'] = this.coverImage!.toJson();
    }
    data['chapterCount'] = this.chapterCount;
    data['volumeCount'] = this.volumeCount;
    data['serialization'] = this.serialization;
    data['mangaType'] = this.mangaType;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ar'] = this.ar;
    data['en'] = this.en;
    data['cs_cz'] = this.csCz;
    data['en_jp'] = this.enJp;
    data['es_es'] = this.esEs;
    data['fa_ir'] = this.faIr;
    data['fi_fi'] = this.fiFi;
    data['fr_fr'] = this.frFr;
    data['hr_hr'] = this.hrHr;
    data['it_it'] = this.itIt;
    data['ja_jp'] = this.jaJp;
    data['ko_kr'] = this.koKr;
    data['pt_br'] = this.ptBr;
    data['ru_ru'] = this.ruRu;
    data['th_th'] = this.thTh;
    data['tr_tr'] = this.trTr;
    data['vi_vn'] = this.viVn;
    data['zh_cn'] = this.zhCn;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['2'] = this.s2;
    data['3'] = this.s3;
    data['4'] = this.s4;
    data['5'] = this.s5;
    data['6'] = this.s6;
    data['7'] = this.s7;
    data['8'] = this.s8;
    data['9'] = this.s9;
    data['10'] = this.s10;
    data['11'] = this.s11;
    data['12'] = this.s12;
    data['13'] = this.s13;
    data['14'] = this.s14;
    data['15'] = this.s15;
    data['16'] = this.s16;
    data['17'] = this.s17;
    data['18'] = this.s18;
    data['19'] = this.s19;
    data['20'] = this.s20;
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
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tiny'] = this.tiny;
    data['large'] = this.large;
    data['small'] = this.small;
    data['medium'] = this.medium;
    data['original'] = this.original;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Meta {
  Dimensions? dimensions;

  Meta({this.dimensions});

  Meta.fromJson(Map<String, dynamic> json) {
    dimensions = json['dimensions'] != null
        ? new Dimensions.fromJson(json['dimensions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dimensions != null) {
      data['dimensions'] = this.dimensions!.toJson();
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
    tiny = json['tiny'] != null ? new Tiny.fromJson(json['tiny']) : null;
    large = json['large'] != null ? new Tiny.fromJson(json['large']) : null;
    small = json['small'] != null ? new Tiny.fromJson(json['small']) : null;
    medium = json['medium'] != null ? new Tiny.fromJson(json['medium']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tiny != null) {
      data['tiny'] = this.tiny!.toJson();
    }
    if (this.large != null) {
      data['large'] = this.large!.toJson();
    }
    if (this.small != null) {
      data['small'] = this.small!.toJson();
    }
    if (this.medium != null) {
      data['medium'] = this.medium!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['width'] = this.width;
    data['height'] = this.height;
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
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tiny'] = this.tiny;
    data['large'] = this.large;
    data['small'] = this.small;
    data['original'] = this.original;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}
