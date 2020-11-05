// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en_US';

  static m0(clouds) => "Cloud cover: ${clouds}%";

  static m1(feels_like) => "Feels like: ${feels_like}°";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "app_name" : MessageLookupByLibrary.simpleMessage("Weatherly"),
    "clouds" : m0,
    "enable" : MessageLookupByLibrary.simpleMessage("Enable"),
    "enable_location" : MessageLookupByLibrary.simpleMessage("Enable location"),
    "enable_location_desc" : MessageLookupByLibrary.simpleMessage("Please enable location. The application won\'t work properly without it."),
    "enable_permission" : MessageLookupByLibrary.simpleMessage("Please enable location permissions and GPS. The application won\'t work properly without it."),
    "error" : MessageLookupByLibrary.simpleMessage("An error occured"),
    "feels_like" : m1,
    "hello" : MessageLookupByLibrary.simpleMessage("Hello!"),
    "location_info_title" : MessageLookupByLibrary.simpleMessage("Location Info"),
    "settings" : MessageLookupByLibrary.simpleMessage("Settings"),
    "try_again" : MessageLookupByLibrary.simpleMessage("Try again")
  };
}
