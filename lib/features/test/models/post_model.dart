class PostModel {
  int? id;
  String? type;
  String? videoLink;
  String? title;
  String? image;
  String? status;
  String? createdAt;
  String? updatedAt;

  PostModel(
      {this.id,
        this.type,
        this.videoLink,
        this.title,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt});

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    videoLink = json['video_link'];
    title = json['title'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['video_link'] = this.videoLink;
    data['title'] = this.title;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}