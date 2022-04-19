
import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';

import 'src/view_models/view_models.dart';

List<SingleChildWidget> getProviders() {
  return [
    ChangeNotifierProvider(create: (context) => CacheViewModel()),
  ];
}
