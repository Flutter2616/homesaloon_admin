class Ordermodal {
  String? name, time, type, desc, gender, img, offer, servicetime, status, id;
  num? price, qty;
  Map? address;

  Ordermodal(
      {this.name,
        this.id,
        this.address,
        this.time,
        this.type,
        this.desc,
        this.gender,
        this.img,
        this.offer,
        this.servicetime,
        this.status,
        this.price,
        this.qty});
}