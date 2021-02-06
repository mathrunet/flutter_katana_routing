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

part "src/use_page.dart";
part "src/extensions.dart";
part "src/theme_color.dart";
part "src/route_config.dart";
part "src/route_query.dart";
part "src/ui_page_route.dart";
part "src/ui_material_app.dart";
part "src/widget_theme.dart";

part "page/ui_page.dart";
part "page/ui_page_scaffold.dart";
part "page/ui_internal_page.dart";
part "page/ui_internal_page_scaffold.dart";
