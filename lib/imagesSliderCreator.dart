import 'package:flutter/material.dart';
import 'package:portfolio_app/theme/theme_constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';

class ImagesSliderCreator extends StatefulWidget {
  bool isWebMobile = kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);
  double carouselAspectRatioMobile = 16 / 9;
  double carouselAspectRatioDesktop = 16 / 16;
  List<String> imgPaths;
  bool hasEnlarger;

  ImagesSliderCreator(this.imgPaths, this.hasEnlarger, {super.key});

  @override
  State<ImagesSliderCreator> createState() => _ImagesSliderCreatorState();
}

class _ImagesSliderCreatorState extends State<ImagesSliderCreator> {
  @override
  Widget build(BuildContext context) {
    CarouselSlider imagesSlider = CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 4),
          viewportFraction: 1.0,
          enlargeCenterPage: false,
          aspectRatio: widget.isWebMobile
              ? widget.carouselAspectRatioMobile
              : widget.carouselAspectRatioDesktop,
        ),
        items: widget.imgPaths.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 0),
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Image.asset(
                  i,
                ),
              );
            },
          );
        }).toList());

    Widget imagesSliderEnlarger = GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      EnlargedImagesSliderView(widget.imgPaths)));
        },
        child: imagesSlider);

    Widget imagesSliderNavigator = widget.isWebMobile
        ? Center(
            child: widget.hasEnlarger ? imagesSliderEnlarger : imagesSlider)
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 10,
                    onPressed: () => {print("LEFT")},
                    icon: const Icon(Icons.arrow_back_ios_new_rounded)),
              ),
              Expanded(
                  flex: 10,
                  child:
                      widget.hasEnlarger ? imagesSliderEnlarger : imagesSlider),
              Expanded(
                flex: 2,
                child: IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 10,
                    onPressed: () => {print("RIGHT")},
                    icon: const Icon(Icons.arrow_forward_ios_rounded)),
              ),
            ],
          );

    return imagesSliderNavigator;
  }
}

class EnlargedImagesSliderView extends StatefulWidget {
  List<String> imgPaths;
  EnlargedImagesSliderView(this.imgPaths, {super.key});

  @override
  State<EnlargedImagesSliderView> createState() =>
      _EnlargedImagesSliderViewState();
}

class _EnlargedImagesSliderViewState extends State<EnlargedImagesSliderView> {
  @override
  Widget build(BuildContext context) {
    return ImagesSliderCreator(widget.imgPaths, false);
  }
}
