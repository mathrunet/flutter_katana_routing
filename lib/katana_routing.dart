// Copyright 2021 mathru. All rights reserved.

/// Package that improvement of routing.
///
/// To use, import `package:katana_routing/katana_routing.dart`.
///
/// [mathru.net]: https://mathru.net
/// [YouTube]: https://www.youtube.com/c/mathrunetchannel
library katana_routing;

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:katana/katana.dart';
import "package:flutter/material.dart";
export 'package:katana/katana.dart';

part "lib/use_page.dart";
part "lib/extensions.dart";
part "lib/theme_color.dart";
part "lib/route_config.dart";
part "lib/route_query.dart";
part "lib/ui_page_route.dart";
part "lib/ui_material_app.dart";
part "lib/widget_theme.dart";

part "page/ui_page.dart";
part "page/ui_page_scaffold.dart";
part "page/ui_internal_page.dart";
part "page/ui_internal_page_scaffold.dart";
