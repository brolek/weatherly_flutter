// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pl_PL locale. All the
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
  String get localeName => 'pl_PL';

  static m0(clouds) => "Zachmurzenie: ${clouds}%";

  static m1(feels_like) => "Temp. odczuwalna: ${feels_like}°";

  static m2(humidity) => "${humidity}%";

  static m3(pressure) => "${pressure}hPa";

  static m4(wind) => "${wind}m/s";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "app_name" : MessageLookupByLibrary.simpleMessage("Weatherly"),
    "clouds" : m0,
    "enable" : MessageLookupByLibrary.simpleMessage("Włącz"),
    "enable_location" : MessageLookupByLibrary.simpleMessage("Włącz usługi GPS"),
    "enable_location_desc" : MessageLookupByLibrary.simpleMessage("Proszę włączyć usługi GPS. Bez nich aplikacja nie będzie działać poprawnie."),
    "enable_permission" : MessageLookupByLibrary.simpleMessage("Proszę pozwolić na dostęp do lokalizacji urządzenia oraz o włączenie usług GPS. Bez tego aplikacja nie będzie działać poprawnie."),
    "error" : MessageLookupByLibrary.simpleMessage("Wystąpił błąd"),
    "feels_like" : m1,
    "hello" : MessageLookupByLibrary.simpleMessage("Witaj!"),
    "humidity" : MessageLookupByLibrary.simpleMessage("Wilgotność"),
    "humidity_value" : m2,
    "location_info_title" : MessageLookupByLibrary.simpleMessage("Informacja o lokalizacji"),
    "pressure" : MessageLookupByLibrary.simpleMessage("Ciśnienie"),
    "pressure_value" : m3,
    "settings" : MessageLookupByLibrary.simpleMessage("Ustawienia"),
    "sunrise" : MessageLookupByLibrary.simpleMessage("Wschód słońca"),
    "sunset" : MessageLookupByLibrary.simpleMessage("Zachód słońca"),
    "try_again" : MessageLookupByLibrary.simpleMessage("Spróbuj ponownie"),
    "wind" : MessageLookupByLibrary.simpleMessage("Wiatr"),
    "wind_value" : m4
  };
}
