class Imagemodel {
  int id;
  String url;
  String title;
  Imagemodel(this.id, this.url, this.title);
  Imagemodel.fromJson(Map<String, dynamic> parsedjson) {
    id = parsedjson['id'];
    url = parsedjson['url'];
    title = parsedjson['title'];
  }
}
