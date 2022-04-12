class PCDetail {
  int? id;
  List<DistrictsOffices>? districtsOffices;
  String? pcId;
  String? firstName;
  String? lastName;
  String? otherNames;
  String? dob;
  String? email;
  String? phone;
  String? idType;
  String? idNumber;
  String? idImage;
  String? fingerprint;
  String? town;
  String? district;
  String? region;
  bool? isActive;
  String? geoLoc;
  int? availCocoa;
  int? purchasingLimit;
  String? balance;
  String? createAt;
  List<int>? lbcs;

  PCDetail(
      {this.id,
        this.districtsOffices,
        this.pcId,
        this.firstName,
        this.lastName,
        this.otherNames,
        this.dob,
        this.email,
        this.phone,
        this.idType,
        this.idNumber,
        this.idImage,
        this.fingerprint,
        this.town,
        this.district,
        this.region,
        this.isActive,
        this.geoLoc,
        this.availCocoa,
        this.purchasingLimit,
        this.balance,
        this.createAt,
        this.lbcs});

  PCDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['districtsOffices'] != null) {
      districtsOffices = <DistrictsOffices>[];
      json['districtsOffices'].forEach((v) {
        this.districtsOffices!.add( DistrictsOffices.fromJson(v));
      });
    }
    pcId = json['pcId'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    otherNames = json['other_names'];
    dob = json['dob'];
    email = json['email'];
    phone = json['phone'];
    idType = json['idType'];
    idNumber = json['idNumber'];
    idImage = json['idImage'];
    fingerprint = json['fingerprint'];
    town = json['town'];
    district = json['district'];
    region = json['region'];
    isActive = json['isActive'];
    geoLoc = json['geoLoc'];
    availCocoa = json['availCocoa'];
    purchasingLimit = json['PurchasingLimit'];
    balance = json['balance'];
    createAt = json['createAt'];
    lbcs = json['lbcs'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    if (this.districtsOffices != null) {
      data['districtsOffices'] =
          this.districtsOffices!.map((v) => v.toJson()).toList();
    }
    data['pcId'] = this.pcId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['other_names'] = this.otherNames;
    data['dob'] = this.dob;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['idType'] = this.idType;
    data['idNumber'] = this.idNumber;
    data['idImage'] = this.idImage;
    data['fingerprint'] = this.fingerprint;
    data['town'] = this.town;
    data['district'] = this.district;
    data['region'] = this.region;
    data['isActive'] = this.isActive;
    data['geoLoc'] = this.geoLoc;
    data['availCocoa'] = this.availCocoa;
    data['PurchasingLimit'] = this.purchasingLimit;
    data['balance'] = this.balance;
    data['createAt'] = this.createAt;
    data['lbcs'] = this.lbcs;
    return data;
  }
}

class DistrictsOffices {
  int? id;
  String? name;

  DistrictsOffices({this.id, this.name});

  DistrictsOffices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}