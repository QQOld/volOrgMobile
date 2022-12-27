import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_shell.dart';

final chosenTabProvider = Provider.autoDispose<TabType>((ref) => TabType.common);