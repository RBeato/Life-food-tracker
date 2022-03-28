import 'package:flutter/material.dart';

import '../../constants.dart';
import 'carousel_card.dart';

class CarouselList extends StatefulWidget {
  const CarouselList({Key? key, required this.parameters}) : super(key: key);

  final List<String> parameters;

  @override
  _CarouselListState createState() => _CarouselListState();
}

class _CarouselListState extends State<CarouselList> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.parameters == Constants.routineActions
          ? MediaQuery.of(context).size.height * 0.45
          : MediaQuery.of(context).size.height * 0.35,
      child: Column(
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              padEnds: true,
              itemCount: widget.parameters.length,
              itemBuilder: (context, index) {
                return Opacity(
                  opacity: currentPage == index ? 1.0 : 0.8,
                  child: CarouselCard(widget.parameters[index]),
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
          updateIndicators(widget.parameters),
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
            return Container(
              width: 7.0,
              height: 7.0,
              margin: const EdgeInsets.symmetric(horizontal: 6.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentPage == index ? Colors.red : Color(0xFFA6AEBD),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
