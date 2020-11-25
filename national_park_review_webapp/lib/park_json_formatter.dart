class ParkData {
  String total;
  String limit;
  String start;
  List<Data> data;

  ParkData({this.total, this.limit, this.start, this.data});

  ParkData.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    limit = json['limit'];
    start = json['start'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['limit'] = this.limit;
    data['start'] = this.start;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String id;
  String url;
  String fullName;
  String parkCode;
  String description;
  String latitude;
  String longitude;
  String latLong;
  List<Activities> activities;
  String states;
  Contacts contacts;
  List<EntranceFees> entranceFees;
  String directionsInfo;
  String directionsUrl;
  List<OperatingHours> operatingHours;
  List<Addresses> addresses;
  List<Images> images;
  String weatherInfo;
  String name;
  String designation;

  Data(
      {this.id,
      this.url,
      this.fullName,
      this.parkCode,
      this.description,
      this.latitude,
      this.longitude,
      this.latLong,
      this.activities,
      this.states,
      this.contacts,
      this.entranceFees,
      this.directionsInfo,
      this.directionsUrl,
      this.operatingHours,
      this.addresses,
      this.images,
      this.weatherInfo,
      this.name,
      this.designation});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    fullName = json['fullName'];
    parkCode = json['parkCode'];
    description = json['description'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    latLong = json['latLong'];
    if (json['activities'] != null) {
      activities = new List<Activities>();
      json['activities'].forEach((v) {
        activities.add(new Activities.fromJson(v));
      });
    }
    states = json['states'];
    contacts = json['contacts'] != null
        ? new Contacts.fromJson(json['contacts'])
        : null;
    if (json['entranceFees'] != null) {
      entranceFees = new List<EntranceFees>();
      json['entranceFees'].forEach((v) {
        entranceFees.add(new EntranceFees.fromJson(v));
      });
    }
    directionsInfo = json['directionsInfo'];
    directionsUrl = json['directionsUrl'];
    if (json['operatingHours'] != null) {
      operatingHours = new List<OperatingHours>();
      json['operatingHours'].forEach((v) {
        operatingHours.add(new OperatingHours.fromJson(v));
      });
    }
    if (json['addresses'] != null) {
      addresses = new List<Addresses>();
      json['addresses'].forEach((v) {
        addresses.add(new Addresses.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    weatherInfo = json['weatherInfo'];
    name = json['name'];
    designation = json['designation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['fullName'] = this.fullName;
    data['parkCode'] = this.parkCode;
    data['description'] = this.description;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['latLong'] = this.latLong;
    if (this.activities != null) {
      data['activities'] = this.activities.map((v) => v.toJson()).toList();
    }
    data['states'] = this.states;
    if (this.contacts != null) {
      data['contacts'] = this.contacts.toJson();
    }
    if (this.entranceFees != null) {
      data['entranceFees'] = this.entranceFees.map((v) => v.toJson()).toList();
    }
    data['directionsInfo'] = this.directionsInfo;
    data['directionsUrl'] = this.directionsUrl;
    if (this.operatingHours != null) {
      data['operatingHours'] =
          this.operatingHours.map((v) => v.toJson()).toList();
    }
    if (this.addresses != null) {
      data['addresses'] = this.addresses.map((v) => v.toJson()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    data['weatherInfo'] = this.weatherInfo;
    data['name'] = this.name;
    data['designation'] = this.designation;
    return data;
  }
}

class Activities {
  String id;
  String name;

  Activities({this.id, this.name});

  Activities.fromJson(Map<String, dynamic> json) {
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

class Contacts {
  List<PhoneNumbers> phoneNumbers;
  List<EmailAddresses> emailAddresses;

  Contacts({this.phoneNumbers, this.emailAddresses});

  Contacts.fromJson(Map<String, dynamic> json) {
    if (json['phoneNumbers'] != null) {
      phoneNumbers = new List<PhoneNumbers>();
      json['phoneNumbers'].forEach((v) {
        phoneNumbers.add(new PhoneNumbers.fromJson(v));
      });
    }
    if (json['emailAddresses'] != null) {
      emailAddresses = new List<EmailAddresses>();
      json['emailAddresses'].forEach((v) {
        emailAddresses.add(new EmailAddresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.phoneNumbers != null) {
      data['phoneNumbers'] = this.phoneNumbers.map((v) => v.toJson()).toList();
    }
    if (this.emailAddresses != null) {
      data['emailAddresses'] =
          this.emailAddresses.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PhoneNumbers {
  String phoneNumber;
  String description;
  String extension;
  String type;

  PhoneNumbers({this.phoneNumber, this.description, this.extension, this.type});

  PhoneNumbers.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    description = json['description'];
    extension = json['extension'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phoneNumber'] = this.phoneNumber;
    data['description'] = this.description;
    data['extension'] = this.extension;
    data['type'] = this.type;
    return data;
  }
}

class EmailAddresses {
  String description;
  String emailAddress;

  EmailAddresses({this.description, this.emailAddress});

  EmailAddresses.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    emailAddress = json['emailAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['emailAddress'] = this.emailAddress;
    return data;
  }
}

class EntranceFees {
  String cost;
  String description;
  String title;

  EntranceFees({this.cost, this.description, this.title});

  EntranceFees.fromJson(Map<String, dynamic> json) {
    cost = json['cost'];
    description = json['description'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cost'] = this.cost;
    data['description'] = this.description;
    data['title'] = this.title;
    return data;
  }
}

class OperatingHours {
  List<Exceptions> exceptions;
  String description;
  ExceptionHours standardHours;
  String name;

  OperatingHours(
      {this.exceptions, this.description, this.standardHours, this.name});

  OperatingHours.fromJson(Map<String, dynamic> json) {
    if (json['exceptions'] != null) {
      exceptions = new List<Exceptions>();
      json['exceptions'].forEach((v) {
        exceptions.add(new Exceptions.fromJson(v));
      });
    }
    description = json['description'];
    standardHours = json['standardHours'] != null
        ? new ExceptionHours.fromJson(json['standardHours'])
        : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.exceptions != null) {
      data['exceptions'] = this.exceptions.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    if (this.standardHours != null) {
      data['standardHours'] = this.standardHours.toJson();
    }
    data['name'] = this.name;
    return data;
  }
}

class Exceptions {
  ExceptionHours exceptionHours;
  String startDate;
  String name;
  String endDate;

  Exceptions({this.exceptionHours, this.startDate, this.name, this.endDate});

  Exceptions.fromJson(Map<String, dynamic> json) {
    exceptionHours = json['exceptionHours'] != null
        ? new ExceptionHours.fromJson(json['exceptionHours'])
        : null;
    startDate = json['startDate'];
    name = json['name'];
    endDate = json['endDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.exceptionHours != null) {
      data['exceptionHours'] = this.exceptionHours.toJson();
    }
    data['startDate'] = this.startDate;
    data['name'] = this.name;
    data['endDate'] = this.endDate;
    return data;
  }
}

class ExceptionHours {
  String wednesday;
  String monday;
  String thursday;
  String sunday;
  String tuesday;
  String friday;
  String saturday;

  ExceptionHours(
      {this.wednesday,
      this.monday,
      this.thursday,
      this.sunday,
      this.tuesday,
      this.friday,
      this.saturday});

  ExceptionHours.fromJson(Map<String, dynamic> json) {
    wednesday = json['wednesday'];
    monday = json['monday'];
    thursday = json['thursday'];
    sunday = json['sunday'];
    tuesday = json['tuesday'];
    friday = json['friday'];
    saturday = json['saturday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wednesday'] = this.wednesday;
    data['monday'] = this.monday;
    data['thursday'] = this.thursday;
    data['sunday'] = this.sunday;
    data['tuesday'] = this.tuesday;
    data['friday'] = this.friday;
    data['saturday'] = this.saturday;
    return data;
  }
}

class Addresses {
  String postalCode;
  String city;
  String stateCode;
  String line1;
  String type;
  String line3;
  String line2;

  Addresses(
      {this.postalCode,
      this.city,
      this.stateCode,
      this.line1,
      this.type,
      this.line3,
      this.line2});

  Addresses.fromJson(Map<String, dynamic> json) {
    postalCode = json['postalCode'];
    city = json['city'];
    stateCode = json['stateCode'];
    line1 = json['line1'];
    type = json['type'];
    line3 = json['line3'];
    line2 = json['line2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postalCode'] = this.postalCode;
    data['city'] = this.city;
    data['stateCode'] = this.stateCode;
    data['line1'] = this.line1;
    data['type'] = this.type;
    data['line3'] = this.line3;
    data['line2'] = this.line2;
    return data;
  }
}

class Images {
  String credit;
  String title;
  String altText;
  String caption;
  String url;

  Images({this.credit, this.title, this.altText, this.caption, this.url});

  Images.fromJson(Map<String, dynamic> json) {
    credit = json['credit'];
    title = json['title'];
    altText = json['altText'];
    caption = json['caption'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['credit'] = this.credit;
    data['title'] = this.title;
    data['altText'] = this.altText;
    data['caption'] = this.caption;
    data['url'] = this.url;
    return data;
  }
}
