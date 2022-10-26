import 'package:flutter/material.dart';
import 'package:practice_maniac/components/editable_slidable.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/progress/components/progress_detail.dart';
import 'package:practice_maniac/progress/domain/progress.dart';
import 'package:practice_maniac/progress/domain/progresses.dart';
import 'package:practice_maniac/progress/progress_item/progress_item_view_model.dart';
import 'package:rx_widgets_plus/rx_widgets_plus.dart';

class ProgressItemView extends ViewData<Progress, ProgressItemViewModel> {
  final Progresses progresses;
  final void Function() onChange;

  Progress get progress => viewModel.model.value;

  ProgressItemView({
    Key? key,
    required Progress progress,
    required this.progresses,
    required this.onChange,
  }) : super(key: key, model: progress);

  @override
  dynamic onInit() {
    viewModel.progresses = progresses;
    listeners.sink = viewModel.remove.results.listen((_) => onChange());
  }

  @override
  Widget build(BuildContext context) {
    return EditableSlidable(
      key: Key(progress.id),
      onEdit: viewModel.edit,
      onRemove: viewModel.remove,
      body: Column(
        children: [
          const Divider(
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ReactiveBuilder(
              stream: viewModel.edit.results.where((event) => event.hasData),
              initialData: true,
              builder: (context, _) => ProgressDetail(
                progress: progress,
                measure: progresses.measure,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
