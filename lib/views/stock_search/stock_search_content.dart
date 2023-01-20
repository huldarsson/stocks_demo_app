import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_demo_app/models/stock_model.dart';
import 'package:stocks_demo_app/views/stock_search/bloc/stock_search_bloc.dart';
import 'package:stocks_demo_app/views/stock_search/stock_search_list_item.dart';

class StockSearchContent extends StatelessWidget {
  StockSearchContent({
    required this.onStockSelected,
    super.key,
  });

  final Function(StockModel) onStockSelected;

  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth * 0.8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          TextField(
            autofocus: true,
            onChanged: (value) {
              if (_debounce?.isActive ?? false) _debounce?.cancel();
              _debounce = Timer(const Duration(milliseconds: 500), () {
                BlocProvider.of<StockSearchBloc>(context).add(
                  LoadStocks(
                    searchString: value,
                  ),
                );
              });
            },
            decoration: InputDecoration(
              hintText: 'Search for stock',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey[400]!,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<StockSearchBloc, StockSearchState>(
              builder: (context, state) {
            if (state.stocks.isNotEmpty) {
              return Flexible(
                child: ListView.separated(
                  itemBuilder: (context, i) => StockSearchListItem(
                    onPressed: () => onStockSelected(state.stocks[i]),
                    stock: state.stocks[i],
                  ),
                  separatorBuilder: (context, i) => const Divider(),
                  itemCount: state.stocks.length,
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          })
        ],
      ),
    );
  }
}
