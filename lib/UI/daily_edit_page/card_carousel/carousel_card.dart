import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_tracker/UI/daily_edit_page/card_carousel/quality_slider.dart';
import 'package:lifestyle_tracker/UI/daily_edit_page/common/time_picker.dart';
import '../../../constants.dart';
import 'brief_description.dart';
import 'card_title.dart';
import 'items_list_view.dart';

final showLabelPanelProvider = StateProvider<bool>((ref) => false);

class CarouselCard extends ConsumerStatefulWidget {
  const CarouselCard(this.index, {Key? key}) : super(key: key);

  final int index;

  @override
  _CarouselCardState createState() => _CarouselCardState();
}

class _CarouselCardState extends ConsumerState<CarouselCard> {
  late TextEditingController _descriptionCtrl;
  late String _parameter;

  @override
  void initState() {
    super.initState();
    _descriptionCtrl = TextEditingController();
    List<String> _parameters = Constants.completeParameterOptions;
    _parameter = _parameters[widget.index];
  }

  @override
  Widget build(BuildContext context) {
    bool _showLabelPanel = ref.watch(showLabelPanelProvider);
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 32.0,
          left: 8.0,
          right: 8.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            border: Border.all(color: Colors.blue.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CardTitle(_parameter),
                BriefDescription(
                    showLabelPanel: _showLabelPanel,
                    textCtrl: _descriptionCtrl,
                    index: widget.index),
                ItemsListView(Constants.allItems[_parameter]!),
                Constants.needsTimePicker(_parameter)
                    ? CustomTimePicker(_parameter)
                    : Container(),
                Constants.needsQualitySlider(_parameter)
                    ? QualitySlider(_parameter)
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
