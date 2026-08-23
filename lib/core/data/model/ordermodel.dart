class Ordersmodel {
  String? ordersId;
  String? ordersUserid;
  String? ordersAddress;
  String? orderstype;
  String? orderspricedelivery;
  String? ordersPrice;
  String? ordersTolotalprice;
  String? ordersCoupon;
  String? ordersRatig;
  String? ordersNoterating;
  String? ordersPaymentmethod;
  String? ordersStatus;
  String? ordersDatatime;
  String? addressId;
  String? addressUsersid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;

  Ordersmodel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'].toString();
    ordersUserid = json['orders_userid'].toString();
    ordersAddress = json['orders_address'].toString();
    orderstype = json['orders_type'].toString();
    orderspricedelivery = json['orders_pricedelivery'].toString();
    ordersPrice = json['orders_price'].toString();
    ordersTolotalprice = json['orders_totalprice'].toString();
    ordersCoupon = json['orders_coupon'].toString();
    ordersRatig = json['orders_rating'].toString();
    ordersNoterating = json['orders_noterating'].toString();
    ordersPaymentmethod = json['orders_paymentmethod'].toString();
    ordersStatus = json['orders_status'].toString();
    ordersDatatime = json['orders_datetime'].toString();
    addressId = json['address_id'].toString();
    addressUsersid = json['address_usersid'].toString();
    addressName = json['address_name'].toString();
    addressCity = json['address_city'].toString();
    addressStreet = json['address_street'].toString();
    addressLat = json['address_lat'].toString();
    addressLong= json['address_long'].toString();
  }
}
