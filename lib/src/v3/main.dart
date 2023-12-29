import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../exceptions.dart';
import '../utils/response_ok.dart';
import 'query.dart';

/// Lemmy API that uses version 3
class LemmyApiV3 {
  final String host;
  static const extraPath = '/api/v3';

  const LemmyApiV3(this.host);

  /// Run a given query
  Future<T> run<T>(LemmyApiQuery<T> query) async {
    // get a future based on http method

    if (host.contains('localhost')) {
      return _runLocalhost(query);
    }

    final res = await () {
      switch (query.httpMethod) {
        case HttpMethod.get:
          return http.get(
              Uri.https(
                host,
                '$extraPath${query.path}',
                <String, String>{
                  for (final entry in query.toJson().entries)
                    entry.key: entry.value.toString()
                },
              ),
              headers: {
                'Authorization': query.toJson().containsKey('auth')
                    ? 'Bearer ${query.toJson()['auth']}'
                    : ''
              });
        case HttpMethod.post:
          return http.post(
            Uri.https(host, '$extraPath${query.path}'),
            body: jsonEncode(query.toJson()),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': query.toJson().containsKey('auth')
                  ? 'Bearer ${query.toJson()['auth']}'
                  : ''
            },
          );
        case HttpMethod.put:
          return http.put(
            Uri.https(host, '$extraPath${query.path}'),
            body: jsonEncode(query.toJson()),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': query.toJson().containsKey('auth')
                  ? 'Bearer ${query.toJson()['auth']}'
                  : ''
            },
          );
      }
    }();

    // if status code is not \in [200; 300) then throw an exception with a correct message
    if (!res.ok) {
      final String errorMessage = () {
        try {
          final Map<String, dynamic> json = jsonDecode(res.body);
          return json['error'];
        } on FormatException {
          return res.body;
        }
      }();

      throw LemmyApiException(errorMessage);
    }

    // augment responses with `instance_host`
    final Map<String, dynamic> json = jsonDecode(utf8.decode(res.bodyBytes));
    _augmentInstanceHost(host, json);

    return query.responseFactory(json);
  }

  /// Run a given query
  Future<T> _runLocalhost<T>(LemmyApiQuery<T> query) async {
    // get a future based on http method
    final res = await () {
      switch (query.httpMethod) {
        case HttpMethod.get:
          return http.get(
            Uri.http(
              host,
              '$extraPath${query.path}',
              <String, String>{
                for (final entry in query.toJson().entries)
                  entry.key: entry.value.toString()
              },
            ),
          );
        case HttpMethod.post:
          return http.post(
            Uri.http(host, '$extraPath${query.path}'),
            body: jsonEncode(query.toJson()),
            headers: const {'Content-Type': 'application/json'},
          );
        case HttpMethod.put:
          return http.put(
            Uri.http(host, '$extraPath${query.path}'),
            body: jsonEncode(query.toJson()),
            headers: const {'Content-Type': 'application/json'},
          );
      }
    }();

    // if status code is not \in [200; 300) then throw an exception with a correct message
    if (!res.ok) {
      final String errorMessage = () {
        try {
          final Map<String, dynamic> json = jsonDecode(res.body);
          return json['error'];
        } on FormatException {
          return res.body;
        }
      }();

      throw LemmyApiException(errorMessage);
    }

    // augment responses with `instance_host`
    final Map<String, dynamic> json = jsonDecode(utf8.decode(res.bodyBytes));
    _augmentInstanceHost(host, json);

    return query.responseFactory(json);
  }

  /// Deeply augments the whole json with `instance_host`.
  /// This might seems stupid but it is incredibly useful for lemmur
  /// where instances coexist and it's hard to tell what object
  /// came from where
  void _augmentInstanceHost(String instanceHost, Map<String, dynamic> json) {
    json['instance_host'] = instanceHost;

    for (final value in json.values) {
      if (value is Map<String, dynamic>) {
        _augmentInstanceHost(instanceHost, value);
      } else if (value is List) {
        for (final subvalue in value) {
          if (subvalue is Map<String, dynamic>) {
            _augmentInstanceHost(instanceHost, subvalue);
          }
        }
      }
    }
  }
}
