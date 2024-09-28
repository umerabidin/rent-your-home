import 'dart:math';
import 'package:bloc_pattern_mvp/src/assets/image_path.dart';
import 'package:bloc_pattern_mvp/src/modules/course/course_screen.dart';
import 'package:flutter/material.dart';

class ProductHome extends StatefulWidget {
  const ProductHome({super.key});

  @override
  State<ProductHome> createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey.shade100, body: AnimatedExample()),
    );
  }
}

class AnimatedExample extends StatefulWidget {
  @override
  _AnimatedExampleState createState() => _AnimatedExampleState();
}

class _AnimatedExampleState extends State<AnimatedExample>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _fastAnimationcontroller;

  late Animation<Offset> _textFieldAnimation;
  late Animation<double> _containerSizeAnimation;
  late Animation<double> _offercontainerSizeAnimation;
  late Animation<double> _textPositionAnimation;
  late Animation<double> _textOpacityAnimation;
  late Animation<double> _secondTextOpacityAnimation;
  late Animation<int> _numberAnimation;
   late AnimationController _bottomToTopController;
  late Animation<Offset> _bottomToTopAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _fastAnimationcontroller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _textFieldAnimation =
        Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0)).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _numberAnimation = IntTween(begin: 0, end: 2212).animate(_controller);

    _containerSizeAnimation = Tween<double>(begin: 10.0, end: 60.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _offercontainerSizeAnimation =
        Tween<double>(begin: 50.0, end: 170.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _textPositionAnimation = Tween<double>(begin: 40.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _secondTextOpacityAnimation = Tween<double>(begin: 0.2, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _bottomToTopController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    _bottomToTopAnimation = Tween<Offset>(
      begin: Offset(0, 1), // Start off-screen (bottom)
      end: Offset(0, 0), // End at the top
    ).animate(CurvedAnimation(
      parent: _bottomToTopController,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
     _bottomToTopController.forward();
  }

  @override
  void dispose() {
     _bottomToTopController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
           gradient: LinearGradient(
                 begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1, 0.2, 0.9], // Adjust stops for smooth transition
                colors: [
                  Colors.brown.shade50.withOpacity(0.2), // light skin color
                  Colors.brown.shade50.withOpacity(0.0), // fade to transparent
                  Colors.brown.shade300.withOpacity(0.9), // light brown color
                ],
              ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SlideTransition(
                      position: _textFieldAnimation,
                      child:  Container(
                        decoration: BoxDecoration(
         color:  Colors.white,
         borderRadius: BorderRadius.circular(25)
                        ),
                      
                        width: 220,
                        child: Material(
                          borderRadius: BorderRadius.circular(30),
                          child:  TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              filled: true,
                              
                              contentPadding: EdgeInsets.all(5),
                              focusColor: Colors.red,
                              
                              border: InputBorder.none,
         
        
                              labelText: 'Saint Petersburg',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    AnimatedBuilder(
                      animation: _containerSizeAnimation,
                      builder: (context, child) {
                        return InkWell(
                          onTap: (){
                            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  CoursePage()),
            );
                          },
                          child: Container(
                            width: _containerSizeAnimation.value,
                            height: _containerSizeAnimation.value,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(75),
                               image: DecorationImage(
                                                image: AssetImage(ImageAsset.woman),
                                                fit: BoxFit.cover)
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _secondTextOpacityAnimation.value,
                      child: Text(
                        'Hi, Marina',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 24, color: Colors.grey.shade400),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0.0, _textPositionAnimation.value),
                      child: Opacity(
                        opacity: _textOpacityAnimation.value,
                        child: const Row(
                          children: [
                            Text(
                              'lets\'s select your \n perfect place',
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 28),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedBuilder(
                      animation: _offercontainerSizeAnimation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset:
                              Offset(0.0, -(_containerSizeAnimation.value - 50.0)),
                          child: Container(
                            width: _offercontainerSizeAnimation.value,
                            height: _offercontainerSizeAnimation.value,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: AnimatedBuilder(
                                animation: _numberAnimation,
                                builder: (context, child) {
                                  return Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: _offercontainerSizeAnimation.value <
                                            130.0
                                        ? const SizedBox()
                                        : Column(
                                            children: [
                                              const Text(
                                                'RENT',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              SizedBox(
                                                height: _offercontainerSizeAnimation
                                                            .value >
                                                        130.0
                                                    ? 20
                                                    : 0,
                                              ),
                                              Text(
                                                _offercontainerSizeAnimation.value >
                                                        130.0
                                                    ? _numberAnimation.value
                                                        .toString()
                                                    : "",
                                                style: const TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                             _offercontainerSizeAnimation
                                                            .value >
                                                        130.0 ? const Text(
                                                'Offers',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ):SizedBox(),
                                            ],
                                          ),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: _offercontainerSizeAnimation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset:
                              Offset(0.0, -(_containerSizeAnimation.value - 50.0)),
                          child: Container(
                            width: _offercontainerSizeAnimation.value,
                            height: _offercontainerSizeAnimation.value,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: AnimatedBuilder(
                                animation: _numberAnimation,
                                builder: (context, child) {
                                  return _offercontainerSizeAnimation.value < 130.0
                                      ? const SizedBox()
                                      : Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            children: [
                                              const Text(
                                                'RENT',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                _numberAnimation.value.toString(),
                                                style: const TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const Text(
                                                'Offers',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
        
              SlideTransition(
              position: _bottomToTopAnimation,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)
                    )
                  ),
                  height: 650,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Expanded(
                              child: ImageWidget(height: 200, imagePath: ImageAsset.room),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Row(
                          children: [
                            const Expanded(
                              child: ImageWidget(
                                height: 400,
                                imagePath: ImageAsset.dinning,
                              ),
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            Expanded(
                              child: Container(
                                height: 400,
                                child: const Column(
                                  children: [
                                    Expanded(
                                      child: ImageWidget(
                                        imagePath: ImageAsset.tvArea,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Expanded(
                                      child: ImageWidget(
                                        imagePath: ImageAsset.kitchen,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
//   List<StaggeredGridTile> items = const [
//   StaggeredGridTile.count(
//     crossAxisCellCount: 4,
//     mainAxisCellCount: 2,
//     child: Expanded(child: ImageWidget()),
//   ),
//   StaggeredGridTile.count(
//     crossAxisCellCount: 2,
//     mainAxisCellCount: 2,
//     child: ImageWidget(),
//   ),
//     StaggeredGridTile.count(
//     crossAxisCellCount: 2,
//     mainAxisCellCount: 1,
//     child: ImageWidget(),

//   ),
//    StaggeredGridTile.count(
//     crossAxisCellCount: 2,
//     mainAxisCellCount: 1,
//     child: ImageWidget(),

//   ),
// ];
}

class ImageWidget extends StatelessWidget {
  final double? height;
  final String imagePath;
  const ImageWidget({Key? key, this.height, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int photoId = Random().nextInt(30) + 55;
    int sizeMultiplier = photoId % 7;

    return Row(
      children: [
        Expanded(
          child: Container(
            height: height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: DecorationImage(
                    image: AssetImage(imagePath),
                    //  NetworkImage(
                    //   "https://picsum.photos/id/$photoId/300/${200 * sizeMultiplier}",
                    //   scale: 1,
                    // ),
                    fit: BoxFit.fill)),
          ),
        ),
      ],
    );
  }
}
