import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_am/models/booking_list_model.dart';
import 'package:i_am/utils/theme.dart';
import 'package:i_am/widgets/custom_filled_button.dart';
import 'package:i_am/widgets/custom_outline_button.dart';
import 'package:intl/intl.dart';

enum StatusType {
  pending,
  accepted,
  picked,
  completed,
  canceled,
}

extension StatusTypeExtension on StatusType {
  String get name {
    switch (this) {
      case StatusType.pending:
        return 'Pending';
      case StatusType.accepted:
        return 'Accepted';
      case StatusType.picked:
        return 'Picked';
      case StatusType.completed:
        return 'Completed';
      case StatusType.canceled:
        return 'Canceled';
    }
  }

  Color get color {
    switch (this) {
      case StatusType.pending:
        return CustomColors.pinkColor;
      case StatusType.accepted:
        return CustomColors.violetColor;
      case StatusType.picked:
        return CustomColors.cyanColor;
      case StatusType.completed:
        return CustomColors.greenColor;
      case StatusType.canceled:
        return CustomColors.primaryColor;
    }
  }

  IconData get icon {
    switch (this) {
      case StatusType.pending:
        return CupertinoIcons.exclamationmark_circle_fill;
      case StatusType.accepted:
        return CupertinoIcons.check_mark_circled_solid;
      case StatusType.picked:
        return CupertinoIcons.check_mark_circled_solid;
      case StatusType.completed:
        return CupertinoIcons.check_mark_circled_solid;
      case StatusType.canceled:
        return CupertinoIcons.xmark_circle_fill;
    }
  }
}

class CustomExpandTile extends StatelessWidget {
  final StatusType status;
  final BookingData data;
  const CustomExpandTile({
    super.key,
    required this.status,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Chip(
        label: Text(status.name),
        avatar: Icon(
          status.icon,
          color: CustomColors.lightColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        side: BorderSide.none,
        backgroundColor: status.color,
        labelStyle: CustomTextStyles.light.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 12.0,
        ),
      ),
      title: Text(
        'Emergency Order',
        style: CustomTextStyles.dark.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        'ID: ${data.id}',
        style: CustomTextStyles.grey.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
        side: BorderSide(
          color: CustomColors.primaryColor,
        ),
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
      collapsedBackgroundColor: CustomColors.lightColor,
      // initiallyExpanded: _expanded,
      // onExpansionChanged: (bool expanded) {
      //   setState(() {
      //     _expanded = expanded;
      //   });
      // },
      expansionAnimationStyle: AnimationStyle(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 200),
      ),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      tilePadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      childrenPadding: const EdgeInsets.fromLTRB(30, 20, 30, 40),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'ID :',
              style: CustomTextStyles.dark.copyWith(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${data.id}',
              style: CustomTextStyles.dark.copyWith(
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Status :',
              style: CustomTextStyles.dark.copyWith(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              status.name,
              style: CustomTextStyles.dark.copyWith(
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Booking Time :',
              style: CustomTextStyles.dark.copyWith(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              DateFormat('EEE, dd MMM yyyy\nhh:mm a').format(data.bookingTime!),
              style: CustomTextStyles.dark.copyWith(
                fontSize: 14.0,
              ),
              textAlign: TextAlign.end,
            ),
          ],
        ),
        SizedBox(height: 4.0),
        Text(
          'Description :',
          style: CustomTextStyles.dark.copyWith(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 4.0),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: CustomColors.darkColor,
            ),
          ),
          child: Text(
            data.description!,
            style: CustomTextStyles.dark.copyWith(
              fontSize: 14.0,
            ),
          ),
        ),
        SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Lat :',
              style: CustomTextStyles.dark.copyWith(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${data.latitude}',
              style: CustomTextStyles.dark.copyWith(
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Lng :',
              style: CustomTextStyles.dark.copyWith(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${data.longitude}',
              style: CustomTextStyles.dark.copyWith(
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Arrival Time :',
              style: CustomTextStyles.dark.copyWith(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              data.arrivalTime != null
                  ? DateFormat('EEE, dd MMM yyyy\nhh:mm a')
                      .format(data.arrivalTime!)
                  : 'Not Arrived',
              style: CustomTextStyles.dark.copyWith(
                fontSize: 14.0,
              ),
              textAlign: TextAlign.end,
            ),
          ],
        ),
        SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Completion Time :',
              style: CustomTextStyles.dark.copyWith(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              data.completionTime != null
                  ? DateFormat('EEE, dd MMM yyyy\nhh:mm a')
                      .format(data.completionTime!)
                  : 'Not Completed',
              style: CustomTextStyles.dark.copyWith(
                fontSize: 14.0,
              ),
              textAlign: TextAlign.end,
            ),
          ],
        ),
        data.ambulance != null
            ? _buildAmbulance(data.ambulance!)
            : SizedBox.shrink(),
        SizedBox(height: 12.0),
        Wrap(
          runSpacing: 12.0,
          children: [
            status == StatusType.accepted ||
                    status == StatusType.picked ||
                    status == StatusType.completed
                ? CustomFilledButton(
                    onPressed: () {},
                    text: 'Contact',
                  )
                : SizedBox.shrink(),
            status == StatusType.pending
                ? CustomOutlineButton(
                    onPressed: () {},
                    text: 'Cancel',
                  )
                : SizedBox.shrink(),
          ],
        ),
      ],
    );
  }

  Widget _buildAmbulance(Ambulance ambulance) {
    return Column(
      children: [
        Divider(
          color: CustomColors.primaryColor,
          height: 32.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Driver Name :',
              style: CustomTextStyles.dark.copyWith(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              ambulance.user!.name!.toUpperCase(),
              style: CustomTextStyles.dark.copyWith(
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Phone Number :',
              style: CustomTextStyles.dark.copyWith(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              ambulance.user!.phoneNumber!,
              style: CustomTextStyles.dark.copyWith(
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Ambulance Model :',
              style: CustomTextStyles.dark.copyWith(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              ambulance.model!,
              style: CustomTextStyles.dark.copyWith(
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'License Plate :',
              style: CustomTextStyles.dark.copyWith(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              ambulance.licensePlate!,
              style: CustomTextStyles.dark.copyWith(
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
