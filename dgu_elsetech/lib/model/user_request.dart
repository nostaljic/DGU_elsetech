class User_request {
  final String id;
  final String name;
  final bool isBookmark;
  final String hasTag;
  final String price;
  final String lenght;
  final String height;
  final String draft;
  final String image;
  final String detailImage;

  User_request(
      {required this.id,
      required this.name,
      required this.isBookmark,
      required this.hasTag,
      required this.price,
      required this.lenght,
      required this.height,
      required this.draft,
      required this.image,
      required this.detailImage});
}
