class Customer {
  final int id;
  final String custName;
  final String custComp;
  final String phone;
  final String mobile;
  final String address;
  final String note;
  final String email;

  Customer({
    required this.id,
    required this.custName,
    required this.custComp,
    required this.phone,
    required this.mobile,
    required this.address,
    required this.note,
    required this.email,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'] as int,
      custName: json['cust_name'] ?? '',
      custComp: json['cust_comp'] ?? '',
      phone: json['no_phone'] ?? '',
      mobile: json['no_mobile'] ?? '',
      address: json['cust_address'] ?? '',
      note: json['note'] ?? '',
      email: json['email'] ?? '',
    );
  }
}
