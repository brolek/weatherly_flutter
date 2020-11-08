// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Weatherly`
  String get app_name {
    return Intl.message(
      'Weatherly',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Enable location`
  String get enable_location {
    return Intl.message(
      'Enable location',
      name: 'enable_location',
      desc: '',
      args: [],
    );
  }

  /// `Please enable location. The application won't work properly without it.`
  String get enable_location_desc {
    return Intl.message(
      'Please enable location. The application won\'t work properly without it.',
      name: 'enable_location_desc',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Location Info`
  String get location_info_title {
    return Intl.message(
      'Location Info',
      name: 'location_info_title',
      desc: '',
      args: [],
    );
  }

  /// `Enable`
  String get enable {
    return Intl.message(
      'Enable',
      name: 'enable',
      desc: '',
      args: [],
    );
  }

  /// `Please enable location permissions and GPS. The application won't work properly without it.`
  String get enable_permission {
    return Intl.message(
      'Please enable location permissions and GPS. The application won\'t work properly without it.',
      name: 'enable_permission',
      desc: '',
      args: [],
    );
  }

  /// `An error occured`
  String get error {
    return Intl.message(
      'An error occured',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get try_again {
    return Intl.message(
      'Try again',
      name: 'try_again',
      desc: '',
      args: [],
    );
  }

  /// `Hello!`
  String get hello {
    return Intl.message(
      'Hello!',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Cloud cover: {clouds}%`
  String clouds(Object clouds) {
    return Intl.message(
      'Cloud cover: $clouds%',
      name: 'clouds',
      desc: '',
      args: [clouds],
    );
  }

  /// `Feels like: {feels_like}°`
  String feels_like(Object feels_like) {
    return Intl.message(
      'Feels like: $feels_like°',
      name: 'feels_like',
      desc: '',
      args: [feels_like],
    );
  }

  /// `Wind`
  String get wind {
    return Intl.message(
      'Wind',
      name: 'wind',
      desc: '',
      args: [],
    );
  }

  /// `{wind}m/s`
  String wind_value(Object wind) {
    return Intl.message(
      '${wind}m/s',
      name: 'wind_value',
      desc: '',
      args: [wind],
    );
  }

  /// `Humidity`
  String get humidity {
    return Intl.message(
      'Humidity',
      name: 'humidity',
      desc: '',
      args: [],
    );
  }

  /// `{humidity}%`
  String humidity_value(Object humidity) {
    return Intl.message(
      '$humidity%',
      name: 'humidity_value',
      desc: '',
      args: [humidity],
    );
  }

  /// `Pressure`
  String get pressure {
    return Intl.message(
      'Pressure',
      name: 'pressure',
      desc: '',
      args: [],
    );
  }

  /// `{pressure}hPa`
  String pressure_value(Object pressure) {
    return Intl.message(
      '${pressure}hPa',
      name: 'pressure_value',
      desc: '',
      args: [pressure],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'pl', countryCode: 'PL'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}