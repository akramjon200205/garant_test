class TestModel {
  bool? status;
  Resoult? resoult;

  TestModel({this.status, this.resoult});

  TestModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    resoult =
        json['resoult'] != null ? new Resoult.fromJson(json['resoult']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.resoult != null) {
      data['resoult'] = this.resoult!.toJson();
    }
    return data;
  }
}

class Resoult {
  List<Data>? data;

  Resoult({this.data});

  Resoult.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? question;
  List<Options>? options;
  Data({this.id, this.question, this.options});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Options {
  int? id;
  String? option;
  String? status;

  Options({this.id, this.option, this.status});

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    option = json['option'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['option'] = this.option;
    data['status'] = this.status;
    return data;
  }
}
