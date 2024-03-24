import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_am/bloc/booking_list_bloc.dart';
import 'package:i_am/models/booking_list_model.dart';
import 'package:i_am/widgets/custom_expand_tile.dart';

class HistoryTabs extends StatelessWidget {
  const HistoryTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingListBloc, BookingListState>(
      builder: (context, state) {
        final BookingListModel? rawData =
            (state is BookingListLoaded) ? state.bookingList : null;
        final historyData = rawData!.data!
            .where((element) =>
                element.status == 'completed' || element.status == 'canceled')
            .toList();
        return ListView.separated(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(height: 10.0),
          itemCount: historyData.length,
          itemBuilder: (BuildContext context, int index) {
            final data = historyData[index];
            return CustomExpandTile(
              status: (data.status == 'completed')
                  ? StatusType.completed
                  : StatusType.canceled,
              data: data,
            );
          },
        );
      },
    );
  }
}
