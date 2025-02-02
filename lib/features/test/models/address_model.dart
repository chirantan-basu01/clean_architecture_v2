class AddressModel {
  int? id;
  String? state;
  String? district;
  String? address;
  String? contact;
  String? email;
  String? map;
  String? location;

  AddressModel(
      {this.id,
        this.state,
        this.district,
        this.address,
        this.contact,
        this.email,
        this.map,
        this.location});

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    state = json['state'];
    district = json['district'];
    address = json['address'];
    contact = json['contact'];
    email = json['email'];
    map = json['map'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['state'] = this.state;
    data['district'] = this.district;
    data['address'] = this.address;
    data['contact'] = this.contact;
    data['email'] = this.email;
    data['map'] = this.map;
    data['location'] = this.location;
    return data;
  }
}