
import 'package:mobile_test/src/view_models/store_view_model/store_view_model.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';

import 'src/view_models/view_models.dart';

List<SingleChildWidget> getProviders() {
  return [
    ListenableProvider<StoreViewModel>(create: (_) => StoreViewModel()),
    ChangeNotifierProvider(create: (context) => ShopBasketViewModel()),
  ];
}
