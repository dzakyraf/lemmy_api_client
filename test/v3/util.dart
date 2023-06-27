import 'dart:io';

import 'package:lemmy_api_client2/v3.dart';
import 'package:test/test.dart';

final run = const LemmyApiV3('lemmy.ca').run;

/// checks if the LemmyApiQuery will throw and will have a correct i18n string set as a message
Future<void> lemmyThrows(LemmyApiQuery query) async {
  await expectLater(
    () => run<dynamic>(query),
    throwsA(
      isA<LemmyApiException>().having(
        (e) => e.message,
        'lemmy error message',
        matches(RegExp(r'^([a-z]+_)*[a-z]+$')),
      ),
    ),
  );
}

const goodCommunityName = 'outdoor';
const badCommunityName = '--';

const goodPersonId = 13709;
const badPersonId = -1;

const goodModPersonId = 8169;
const badModPersonId = -1;

const goodPostId = 862306;
const badPostId = -1;

const goodUsername = 'shilangyu';
const badUsername = '--';

const goodCommunityId = 34177;
const badCommunityId = -1;

const goodMyCommentId = 43631;
const badMyCommentId = 42890;

const goodCommentId = 42890;
const badCommentId = -1;

final goodAuth = Platform.environment['TEST_JWT'] ?? 'GUEST';
const badAuth = 'dsa';
