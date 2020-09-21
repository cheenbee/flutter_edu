
 class HSlider {
  String thumb;       // 缩略图
  int sort;           // 排序
  String url;         // 链接

  HSlider({
    this.thumb,
    this.sort,
    this.url,
 });

  factory HSlider.fromJson(Map<String, dynamic> parsedJson) {
    return HSlider(
      thumb: parsedJson['thumb'],
      sort: parsedJson['sort'],
      url: parsedJson['url']
    );
  }
 }