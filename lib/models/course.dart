class Course {
  int id;
  String title;             // 标题
  String slug;
  String thumb;             // 缩略图
  double charge;            // 价钱
  String shortDescription;  // 简介
  String renderDesc;
  String publishAt;         // 发布时间
  bool isRec;               // 是否为推荐
  String seoDescription;    // seo 描述
  String seoKeywords;       // seo 关键字
  Category category;        // 分类

  Course({
    this.id,
    this.slug,
    this.thumb,
    this.charge,
    this.shortDescription,
    this.renderDesc,
    this.publishAt,
    this.isRec,
    this.seoDescription,
    this.seoKeywords,
    this.category,
  });

  factory Course.fromJson(Map<String, dynamic> parsedJson) {
    return Course(
      id: parsedJson['id'],
      slug: parsedJson['slug'],
      thumb: parsedJson['thumb'],
      charge: parsedJson['charge'],
      shortDescription: parsedJson['short_description'],
      renderDesc: parsedJson['render_desc'],
      publishAt: parsedJson['published_at'],
      isRec: parsedJson['is_rec'],
      seoDescription: parsedJson['seo_description'],
      seoKeywords: parsedJson['seo_keywords'],
      category: parsedJson['category'],
    );
  }
}

class Category {
  int id;
  String name;          // 分类名称
  bool isShow;          // 是否显示
  int sort;             // 排序
  int parentId;
  String parentChain;
  String createAt;      // 创建时间
  String updateAt;      // 更新时间
  String deleteAt;      // 删除时间

  Category({
    this.id,
    this.name,
    this.isShow,
    this.sort,
    this.parentId,
    this.parentChain,
    this.createAt,
    this.updateAt,
    this.deleteAt,
  });

  factory Category.fromJson(Map<String, dynamic> parsedJson) {
    return Category(
      id: parsedJson['id'],
      name: parsedJson['name'],
      isShow: parsedJson['is_show'],
      sort: parsedJson['sort'],
      parentId: parsedJson['parent_id'],
      parentChain: parsedJson['parent_chain'],
      createAt: parsedJson['created_at'],
      updateAt: parsedJson['updated_at'],
      deleteAt: parsedJson['deleted_at'],
    );
  }
}
