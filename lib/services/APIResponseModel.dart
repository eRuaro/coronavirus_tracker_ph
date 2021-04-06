class APIResponseModel {
  String country;
  String countryCode;
  String lat;
  String lon;
  int confirmed;
  int deaths;
  int recovered;
  int active;
  String date;
  String locationID;

  APIResponseModel(
      {this.country,
      this.countryCode,
      this.lat,
      this.lon,
      this.confirmed,
      this.deaths,
      this.recovered,
      this.active,
      this.date,
      this.locationID});

  APIResponseModel.fromJson(Map<String, dynamic> json) {
    country = json['Country'];
    countryCode = json['CountryCode'];
    lat = json['Lat'];
    lon = json['Lon'];
    confirmed = json['Confirmed'];
    deaths = json['Deaths'];
    recovered = json['Recovered'];
    active = json['Active'];
    date = json['Date'];
    locationID = json['LocationID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Country'] = this.country;
    data['CountryCode'] = this.countryCode;
    data['Lat'] = this.lat;
    data['Lon'] = this.lon;
    data['Confirmed'] = this.confirmed;
    data['Deaths'] = this.deaths;
    data['Recovered'] = this.recovered;
    data['Active'] = this.active;
    data['Date'] = this.date;
    data['LocationID'] = this.locationID;
    return data;
  }
}