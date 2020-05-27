import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';
import 'redux/action.dart';

class Item {
  final int id;
  final String body;

  Item({
    @required this.id,
    @required this.body,
  });
}


class AppState {
  final List<Item> items;
  final int count;

  AppState({
    @required this.items,
    @required this.count
  });

  AppState.initialState()
    : items = List.unmodifiable(<Item>[]),
      count = 0;
}


class ViewModel {
  final List<Item> items;
  final Function(String) onAddItem;
  final Function(Item) onRemoveItem;
  final Function() onRemoveItems;
  final Function() increment;
  final int count;

  ViewModel({
    this.count,
    this.increment,
    this.items,
    this.onAddItem,
    this.onRemoveItem,
    this.onRemoveItems,
  });

  factory ViewModel.create(Store<AppState> store) {
    _onAddItem(String body) {
      store.dispatch(AddItemAction(body));
    }

    _onRemoveItem(Item item) {
      store.dispatch(RemoveItemAction(item));
    }

    _onRemoveItems() {
      store.dispatch(RemoveItemsAction());
    }

    _onIncrement() {
      store.dispatch(ReduxActions.Increment);
    }

    return ViewModel(
      items: store.state.items,
      count: store.state.count,
      onAddItem: _onAddItem,
      onRemoveItem: _onRemoveItem,
      onRemoveItems: _onRemoveItems,
      increment: _onIncrement,
    );
  }
}
