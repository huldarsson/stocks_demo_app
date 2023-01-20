import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_demo_app/views/stock/bloc/stock_bloc.dart';
import 'package:stocks_demo_app/views/stock/widgets/graph_widget.dart';
import 'package:stocks_demo_app/views/stock/widgets/stock_info.dart';
import 'package:stocks_demo_app/views/stock/widgets/stock_title.dart';
import 'package:stocks_demo_app/widgets/loading_widget.dart';

class StockBody extends StatelessWidget {
  const StockBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StockBloc, StockState>(
      builder: (context, state) {
        if (state.status.isLoading) {
          return const LoadingWidget();
        }

        if (state.status.isSuccess) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 70,
                    left: 20,
                  ),
                  child: StockTitle(
                    stock: state.stock!,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                GraphWidget(graph: state.graph!),
                const SizedBox(
                  height: 80,
                ),
                StockInfo(stock: state.stock!),
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
