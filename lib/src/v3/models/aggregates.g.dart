// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aggregates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PersonAggregates _$$_PersonAggregatesFromJson(Map<String, dynamic> json) =>
    _$_PersonAggregates(
      personId: json['person_id'] as int,
      postCount: json['post_count'] as int,
      commentCount: json['comment_count'] as int,
    );

Map<String, dynamic> _$$_PersonAggregatesToJson(_$_PersonAggregates instance) =>
    <String, dynamic>{
      'person_id': instance.personId,
      'post_count': instance.postCount,
      'comment_count': instance.commentCount,
    };

_$_SiteAggregates _$$_SiteAggregatesFromJson(Map<String, dynamic> json) =>
    _$_SiteAggregates(
      siteId: json['site_id'] as int,
      users: json['users'] as int,
      posts: json['posts'] as int,
      comments: json['comments'] as int,
      communities: json['communities'] as int,
      usersActiveDay: json['users_active_day'] as int,
      usersActiveWeek: json['users_active_week'] as int,
      usersActiveMonth: json['users_active_month'] as int,
      usersActiveHalfYear: json['users_active_half_year'] as int,
    );

Map<String, dynamic> _$$_SiteAggregatesToJson(_$_SiteAggregates instance) =>
    <String, dynamic>{
      'site_id': instance.siteId,
      'users': instance.users,
      'posts': instance.posts,
      'comments': instance.comments,
      'communities': instance.communities,
      'users_active_day': instance.usersActiveDay,
      'users_active_week': instance.usersActiveWeek,
      'users_active_month': instance.usersActiveMonth,
      'users_active_half_year': instance.usersActiveHalfYear,
    };

_$_PostAggregates _$$_PostAggregatesFromJson(Map<String, dynamic> json) =>
    _$_PostAggregates(
      postId: json['post_id'] as int,
      comments: json['comments'] as int,
      score: json['score'] as int,
      upvotes: json['upvotes'] as int,
      downvotes: json['downvotes'] as int,
    );

Map<String, dynamic> _$$_PostAggregatesToJson(_$_PostAggregates instance) =>
    <String, dynamic>{
      'post_id': instance.postId,
      'comments': instance.comments,
      'score': instance.score,
      'upvotes': instance.upvotes,
      'downvotes': instance.downvotes,
    };

_$_CommunityAggregates _$$_CommunityAggregatesFromJson(
        Map<String, dynamic> json) =>
    _$_CommunityAggregates(
      communityId: json['community_id'] as int,
      subscribers: json['subscribers'] as int,
      posts: json['posts'] as int,
      comments: json['comments'] as int,
      usersActiveDay: json['users_active_day'] as int,
      usersActiveWeek: json['users_active_week'] as int,
      usersActiveMonth: json['users_active_month'] as int,
      usersActiveHalfYear: json['users_active_half_year'] as int,
      hotRank: json['hot_rank'] as int?,
    );

Map<String, dynamic> _$$_CommunityAggregatesToJson(
        _$_CommunityAggregates instance) =>
    <String, dynamic>{
      'community_id': instance.communityId,
      'subscribers': instance.subscribers,
      'posts': instance.posts,
      'comments': instance.comments,
      'users_active_day': instance.usersActiveDay,
      'users_active_week': instance.usersActiveWeek,
      'users_active_month': instance.usersActiveMonth,
      'users_active_half_year': instance.usersActiveHalfYear,
      'hot_rank': instance.hotRank,
    };

_$_CommentAggregates _$$_CommentAggregatesFromJson(Map<String, dynamic> json) =>
    _$_CommentAggregates(
      commentId: json['comment_id'] as int,
      score: json['score'] as int,
      upvotes: json['upvotes'] as int,
      downvotes: json['downvotes'] as int,
      childCount: json['child_count'] as int?,
      hotRank: json['hot_rank'] as int?,
    );

Map<String, dynamic> _$$_CommentAggregatesToJson(
        _$_CommentAggregates instance) =>
    <String, dynamic>{
      'comment_id': instance.commentId,
      'score': instance.score,
      'upvotes': instance.upvotes,
      'downvotes': instance.downvotes,
      'child_count': instance.childCount,
      'hot_rank': instance.hotRank,
    };
