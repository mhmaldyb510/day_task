import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum DateSelectionType {
  time,
  date,
}

class DateSelectionTile extends StatefulWidget {
  final DateSelectionType type;
  const DateSelectionTile({
    super.key,
    required this.type,
  });

  @override
  State<DateSelectionTile> createState() => _DateSelectionTileState();
}

class _DateSelectionTileState extends State<DateSelectionTile> {
  late IconData icon;
  late String initialText;
  @override
  void initState() {
    super.initState();
    switch (widget.type) {
      case DateSelectionType.time:
        icon = Icons.access_time_rounded;
        initialText = DateFormat('hh:mm a').format(DateTime.now());

        break;
      case DateSelectionType.date:
        icon = Icons.calendar_month_outlined;
        initialText = DateFormat('dd/MM/yyyy').format(DateTime.now());
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        switch (widget.type) {
          case DateSelectionType.time:
            var time = await showTimePicker(
              context: context,
              initialTime: TimeOfDay(
                hour: int.parse(initialText.split(':')[0]),
                minute: int.parse(
                  initialText.split(':')[1].split(' ')[0],
                ),
              ),
            );
            if (time != null) {
              setState(() {
                initialText = time.format(context);
              });
            }
            break;
          case DateSelectionType.date:
            var date = await showDatePicker(
              context: context,
              firstDate: DateTime(2000),
              lastDate: DateTime(3000),
              initialDate: DateTime(
                int.parse(initialText.split('/')[2]),
                int.parse(initialText.split('/')[1]),
                int.parse(initialText.split('/')[0]),
              ),
            );
            if (date != null) {
              setState(
                () {
                  initialText = DateFormat('dd/MM/yyyy').format(date);
                },
              );
            }
            break;
        }
      },
      child: Container(
        constraints: BoxConstraints(
          maxWidth: (MediaQuery.sizeOf(context).width - 40) / 2,
        ),
        color: kSecondaryColor,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              color: kPrimaryColor,
              child: Icon(
                icon,
                size: 22,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                initialText,
                style: kPrimaryTextStyle.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
