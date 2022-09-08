class ImagePath {
  final String imgPath;
  final double price;
  final double? width;
  final double? height;

  const ImagePath({
    required this.imgPath,
    required this.price,
    this.height,
    this.width,
  });
}
