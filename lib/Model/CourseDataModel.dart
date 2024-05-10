import 'package:nail_art/Core/Constants/Assets.dart';

class courseVideosModel {
  final String title;
  final String description;
  final String videoLink;

  courseVideosModel({
    required this.title,
    required this.description,
    required this.videoLink,
  });
}

class coursesDataModel {
  final double price;
  final String image;
  final String title;
  final bool isFavorite;
  final double courseRating;
  final int numberofRatings;
  final List<String> ratingsTextList;
  final List<courseVideosModel> courseVideos;
  final bool isBought;

  coursesDataModel({
    required this.price,
    required this.image,
    required this.title,
    required this.isFavorite,
    required this.courseRating,
    required this.numberofRatings,
    required this.ratingsTextList,
    required this.courseVideos,
    required this.isBought,
  });
}

List<coursesDataModel> coursesList = [
  coursesDataModel(
    price: 25.00,
    image: carouselImage,
    title: 'Amazing and Creating 1',
    isFavorite: false,
    courseRating: 3.5,
    numberofRatings: 1234,
    isBought: true,
    ratingsTextList: [
      '¡ Manuela es increíble! sus diseños son impresionantes y su '
          'habilidad como manicurista es excelente. No duden en contratarla '
          'para un servicio de uñas impecable.',
      '¡ Manuela es increíble! sus diseños son impresionantes y su '
          'habilidad como manicurista es excelente. No duden en contratarla '
          'para un servicio de uñas impecable.',
      '¡ Manuela es increíble! sus diseños son impresionantes y su '
          'habilidad como manicurista es excelente. No duden en contratarla '
          'para un servicio de uñas impecable.',
    ],
    courseVideos: [
      courseVideosModel(
        title: 'Video 1',
        description: 'Lorem Ipsum is simply dummy text of the printing '
            'desktop publishing software like Aldus PageMaker ',
        videoLink: 'link for Video 1',
      ),
      courseVideosModel(
        title: 'Video 2',
        description: 'Lorem Ipsum is simply dummy text of the printing '
            'desktop publishing software like Aldus PageMaker ',
        videoLink: 'link for Video 1',
      ),
      courseVideosModel(
        title: 'Video 3',
        description: 'Lorem Ipsum is simply dummy text of the printing '
            'desktop publishing software like Aldus PageMaker ',
        videoLink: 'link for Video 1',
      ),
    ],
  ),
  coursesDataModel(
    price: 13.00,
    image: carouselImage,
    title: 'Amazing and Creating 2',
    isFavorite: false,
    courseRating: 4.5,
    numberofRatings: 8385,
    isBought: true,
    ratingsTextList: [
      '¡ Manuela es increíble! sus diseños son impresionantes y su '
          'habilidad como manicurista es excelente. No duden en contratarla '
          'para un servicio de uñas impecable.'
    ],
    courseVideos: [
      courseVideosModel(
        title: 'Video 1',
        description: 'Lorem Ipsum is simply dummy text of the printing '
            'desktop publishing software like Aldus PageMaker ',
        videoLink: 'link for Video 1',
      ),
      courseVideosModel(
        title: 'Video 2',
        description: 'Lorem Ipsum is simply dummy text of the printing '
            'desktop publishing software like Aldus PageMaker ',
        videoLink: 'link for Video 1',
      ),
      courseVideosModel(
        title: 'Video 3',
        description: 'Lorem Ipsum is simply dummy text of the printing '
            'desktop publishing software like Aldus PageMaker ',
        videoLink: 'link for Video 1',
      ),
    ],
  ),
  coursesDataModel(
    price: 40.00,
    image: carouselImage,
    title: 'Amazing and Creating 3',
    isFavorite: true,
    courseRating: 1.5,
    numberofRatings: 9239,
    isBought: false,
    ratingsTextList: [
      '¡ Manuela es increíble! sus diseños son impresionantes y su '
          'habilidad como manicurista es excelente. No duden en contratarla '
          'para un servicio de uñas impecable.'
    ],
    courseVideos: [
      courseVideosModel(
        title: 'Video 1',
        description: 'Lorem Ipsum is simply dummy text of the printing '
            'desktop publishing software like Aldus PageMaker ',
        videoLink: 'link for Video 1',
      ),
      courseVideosModel(
        title: 'Video 2',
        description: 'Lorem Ipsum is simply dummy text of the printing '
            'desktop publishing software like Aldus PageMaker ',
        videoLink: 'link for Video 1',
      ),
      courseVideosModel(
        title: 'Video 3',
        description: 'Lorem Ipsum is simply dummy text of the printing '
            'desktop publishing software like Aldus PageMaker ',
        videoLink: 'link for Video 1',
      ),
    ],
  ),
  coursesDataModel(
    price: 25.00,
    image: carouselImage,
    title: 'Amazing and Creating 4',
    isFavorite: true,
    courseRating: 5,
    numberofRatings: 2129,
    isBought: false,
    ratingsTextList: [
      '¡ Manuela es increíble! sus diseños son impresionantes y su '
          'habilidad como manicurista es excelente. No duden en contratarla '
          'para un servicio de uñas impecable.'
    ],
    courseVideos: [
      courseVideosModel(
        title: 'Video 1',
        description: 'Lorem Ipsum is simply dummy text of the printing '
            'desktop publishing software like Aldus PageMaker ',
        videoLink: 'link for Video 1',
      ),
      courseVideosModel(
        title: 'Video 2',
        description: 'Lorem Ipsum is simply dummy text of the printing '
            'desktop publishing software like Aldus PageMaker ',
        videoLink: 'link for Video 1',
      ),
      courseVideosModel(
        title: 'Video 3',
        description: 'Lorem Ipsum is simply dummy text of the printing '
            'desktop publishing software like Aldus PageMaker ',
        videoLink: 'link for Video 1',
      ),
    ],
  ),
  coursesDataModel(
    price: 25.00,
    image: carouselImage,
    title: 'Amazing and Creating 5',
    isFavorite: false,
    courseRating: 2.5,
    numberofRatings: 3214,
    isBought: false,
    ratingsTextList: [
      '¡ Manuela es increíble! sus diseños son impresionantes y su '
          'habilidad como manicurista es excelente. No duden en contratarla '
          'para un servicio de uñas impecable.'
    ],
    courseVideos: [
      courseVideosModel(
        title: 'Video 1',
        description: 'Video 1',
        videoLink: 'link for Video 1',
      ),
      courseVideosModel(
        title: 'Video 2',
        description: 'Video 2',
        videoLink: 'link for Video 1',
      ),
      courseVideosModel(
        title: 'Video 3',
        description: 'Video 3',
        videoLink: 'link for Video 1',
      ),
    ],
  ),
];
