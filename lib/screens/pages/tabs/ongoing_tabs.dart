import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:i_am/utils/theme.dart';
import 'package:i_am/widgets/custom_filled_button.dart';
import 'package:i_am/widgets/custom_outline_button.dart';

class OngoingTabs extends StatefulWidget {
  const OngoingTabs({super.key});

  @override
  State<OngoingTabs> createState() => _OngoingTabsState();
}

class _OngoingTabsState extends State<OngoingTabs> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ExpansionTile(
            leading: Chip(
              label: Text('Pending'),
              avatar: Icon(
                CupertinoIcons.exclamationmark_circle_fill,
                color: CustomColors.lightColor,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              side: BorderSide.none,
              backgroundColor: CustomColors.primaryColor,
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
              'ID: 1234567890',
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
            initiallyExpanded: _expanded,
            onExpansionChanged: (bool expanded) {
              setState(() {
                _expanded = expanded;
              });
            },
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
                    '1234567890',
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
                    'Pending',
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
                    '2022-01-01 00:00:00',
                    style: CustomTextStyles.dark.copyWith(
                      fontSize: 14.0,
                    ),
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
                  'Shot by Gun',
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
                    '1234567890',
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
                    '1234567890',
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
                    '2022-01-01 00:00:00',
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
                    'Completion Time :',
                    style: CustomTextStyles.dark.copyWith(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '2022-01-01 00:00:00',
                    style: CustomTextStyles.dark.copyWith(
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
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
                    'John Doe',
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
                    '1234567890',
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
                    'Honda CBR 1000RR',
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
                    'B 1234 ABC',
                    style: CustomTextStyles.dark.copyWith(
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.0),
              Wrap(
                runSpacing: 12.0,
                children: [
                  CustomFilledButton(
                    onPressed: () {},
                    text: 'Contact',
                  ),
                  CustomOutlineButton(
                    onPressed: () {},
                    text: 'Cancel',
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
