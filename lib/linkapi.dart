class Applink {
  static const String server = "http://192.168.10.206:9000";
  static const String imagestatic = "http://192.168.10.206:9000/upload";

  // Auth ========================
  static const String login = "$server/delivery/auth/login";
  static const String signup = "$server/delivery/auth/signup";
  // Orders ======================
  static const String viewpending = "$server/delivery/orders/pending";
  static const String viewaccepted = "$server/delivery/orders/accepted";
  static const String viewarchive = "$server/delivery/orders/archive";
  static const String detalis = "$server/delivery/orders/details";
  static const String approve = "$server/delivery/orders/approve";
  static const String doneDelivery = "$server/delivery/orders/done";

}
