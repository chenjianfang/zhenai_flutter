import 'package:redux/redux.dart';
import '../model.dart';
import './action.dart';

List <Item> addItemReducer(List<Item> state, action) {
  return []
      ..addAll(state)
      ..add(Item(id: action.id, body: action.item));
}

List <Item> removeItemReducer(List<Item> state, action) {
  return List.unmodifiable(List.from(state)..remove(action.item));
}

List <Item> removeItemsReducer(List<Item> state, action) {
  return List.unmodifiable([]);
}

final Reducer <List<Item>> itemsReducer = combineReducers <List<Item>>([
  new TypedReducer<List<Item>, AddItemAction>(addItemReducer),
  new TypedReducer<List<Item>, RemoveItemAction>(removeItemReducer),
  new TypedReducer<List<Item>, RemoveItemsAction>(removeItemsReducer),
]);



int incrementReducer(int state, dynamic action) {
  if (action == ReduxActions.Increment) {
    return state + 1;
  }

  return state;
}

AppState appStateReducer(AppState state, action) {
  return AppState(
    items: itemsReducer(state.items, action),
    count: incrementReducer(state.count, action)
  );
}
