import 'package:flutter/material.dart';
import 'package:portfolio_app/theme/theme_constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:dotted_border/dotted_border.dart';

class ImagesSliderCreator extends StatefulWidget {
  bool isWebMobile = kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);
  double carouselAspectRatioMobile = 16 / 9;
  double carouselAspectRatioDesktop = 16 / 16;
  List<String> imgPaths;
  bool hasEnlarger;
  bool isEnlarged;
  bool isViewHorizontal;

  ImagesSliderCreator(
      this.imgPaths, this.hasEnlarger, this.isEnlarged, this.isViewHorizontal,
      {super.key});

  @override
  State<ImagesSliderCreator> createState() => _ImagesSliderCreatorState();
}

class _ImagesSliderCreatorState extends State<ImagesSliderCreator> {
  OverlayEntry? screenBarrier;
  OverlayEntry? sliderEnlarged;

  void enlargeSliderAsOverlay() {
    screenBarrier = OverlayEntry(
      builder: (context) => ModalBarrier(
        dismissible: true,
        color: const Color.fromRGBO(0, 0, 0, 0.7),
        onDismiss: endEnlargingAndOverlay,
      ),
    );

    sliderEnlarged = OverlayEntry(
        builder: (context) => ImagesSliderCreator(
            widget.imgPaths, false, true, widget.isViewHorizontal));

    final overlay = Overlay.of(context);
    overlay.insert(screenBarrier!);
    overlay.insert(sliderEnlarged!);
  }

  void endEnlargingAndOverlay() {
    sliderEnlarged?.remove();
    screenBarrier?.remove();
    screenBarrier = null;
    sliderEnlarged = null;
  }

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
              return DottedBorder(
                color: (widget.isEnlarged & !widget.isWebMobile)
                    ? Theme.of(context).primaryColor
                    : Colors.transparent,
                strokeWidth: (widget.isEnlarged & !widget.isWebMobile) ? 4 : 0,
                dashPattern: const [10],
                strokeCap: StrokeCap.round,
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 0),
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: Image.asset(i, fit: BoxFit.contain)),
                  ),
                ),
              );
            },
          );
        }).toList());

    Widget imagesSliderEnlarger = GestureDetector(
        onTap: () {
          enlargeSliderAsOverlay();
        },
        child: imagesSlider);

    Widget imagesSliderNavigatorMobile =
        Center(child: widget.hasEnlarger ? imagesSliderEnlarger : imagesSlider);

    Widget imagesSliderNavigatorHorizontal = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(flex: 2, child: NavigationArrowLeft()),
        Expanded(
            flex: 10,
            child: widget.hasEnlarger ? imagesSliderEnlarger : imagesSlider),
        Expanded(flex: 2, child: NavigationArrowRight()),
      ],
    );

    Widget imagesSliderNavigatorVertical = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        widget.hasEnlarger ? imagesSliderEnlarger : imagesSlider,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[NavigationArrowLeft(), NavigationArrowRight()],
        ),
      ],
    );

    Widget imagesSliderNavigatorVerticalEnlarged = ConstrainedBox(
      constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
              child: widget.hasEnlarger ? imagesSliderEnlarger : imagesSlider),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[NavigationArrowLeft(), NavigationArrowRight()],
          ),
        ],
      ),
    );

    if (widget.isWebMobile) {
      return imagesSliderNavigatorMobile;
    } else if (widget.isViewHorizontal) {
      return imagesSliderNavigatorHorizontal;
    } else if (widget.isEnlarged) {
      return imagesSliderNavigatorVerticalEnlarged;
    } else {
      return imagesSliderNavigatorVertical;
    }
  }
}

class NavigationArrowLeft extends IconButton {
  NavigationArrowLeft({super.key})
      : super(
          padding: EdgeInsets.zero,
          iconSize: 10,
          onPressed: () => {print("LEFT")},
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          style: IconButton.styleFrom(
              backgroundColor: const Color.fromRGBO(250, 250, 250, 0.8)),
        );
}

class NavigationArrowRight extends IconButton {
  NavigationArrowRight({super.key})
      : super(
          padding: EdgeInsets.zero,
          iconSize: 10,
          onPressed: () => {print("RIGHT")},
          icon: const Icon(Icons.arrow_forward_ios_rounded),
          style: IconButton.styleFrom(
              backgroundColor: const Color.fromRGBO(250, 250, 250, 0.8)),
        );
}
