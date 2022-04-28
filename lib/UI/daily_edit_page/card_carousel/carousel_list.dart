import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../constants.dart';
import 'carousel_card.dart';

final currentCardPageIndexProvider = StateProvider<int>((ref) => 0);

final selectedParameterProvider = StateProvider<String>((ref) {
  int index = ref.watch(currentCardPageIndexProvider);
  return Constants.completeParameterOptions[index];
});

class CarouselWidget extends ConsumerStatefulWidget {
  const CarouselWidget({Key? key}) : super(key: key);

  @override
  _CarouselListState createState() => _CarouselListState();
}

class _CarouselListState extends ConsumerState<CarouselWidget> {
  int currentPage = 0;
  late List<String> parameters;

  @override
  void initState() {
    super.initState();
    parameters = Constants.completeParameterOptions;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.45,
      child: Column(
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              padEnds: true,
              itemCount: parameters.length,
              itemBuilder: (context, index) {
                return Opacity(
                  opacity: currentPage == index ? 1.0 : 0.65,
                  child: CarouselCard(index),
                );
              },
              controller:
                  PageController(initialPage: 0, viewportFraction: 0.75),
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
          ),
          updateIndicators(parameters),
        ],
      ),
    );
  }

  Widget updateIndicators(List<String> parameters) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: parameters.map(
          (item) {
            var index = parameters.indexOf(item);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Icon(
                Icons.circle,
                size: 10.0,
                color: currentPage == index
                    ? Colors.blue
                    : const Color(0xFFA6AEBD),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
