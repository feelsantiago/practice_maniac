import 'package:flutter/material.dart';
import 'package:practice_maniac/progress/components/progress_detail.dart';
import 'package:practice_maniac/progress/domain/progress.dart';

class LastProgress extends StatelessWidget {
  final String measure;
  final Progress progress;

  const LastProgress({
    Key? key,
    required this.progress,
    required this.measure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(
            children: const [
              Text('Last Progress'),
              SizedBox(width: 5),
              Expanded(
                child: Divider(
                  color: Colors.white,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ProgressDetail(progress: progress, measure: measure),
          ),
          const Divider(color: Colors.white)
        ],
      ),
    );
  }
}
