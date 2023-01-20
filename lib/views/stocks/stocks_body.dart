import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_demo_app/views/stocks/bloc/stocks_bloc.dart';
import 'package:stocks_demo_app/views/stocks/widgets/stocks_list.dart';
import 'package:stocks_demo_app/views/stocks/widgets/stocks_list_empty_widget.dart';
import 'package:stocks_demo_app/widgets/loading_widget.dart';

class StocksBody extends StatelessWidget {
  const StocksBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StocksBloc, StocksState>(
      builder: (context, state) {
        if (state.status.isLoading) {
          return const LoadingWidget();
        } else if (state.status.isSuccess) {
          if (state.stocks.isEmpty) {
            return const StocksListEmptyWidget();
          } else {
            return StocksList(
              stocks: state.stocks,
            );
          }
        }
        return Container();
      },
    );
  }
}
