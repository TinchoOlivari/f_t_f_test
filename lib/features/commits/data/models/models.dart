// app.quicktype.io

import 'dart:convert';

import 'package:f_t_f_test/features/commits/domain/entities/entities.dart';

List<CommitListModel> commitListFromJson(String str) =>
    List<CommitListModel>.from(
        json.decode(str).map((x) => CommitListModel.fromJson(x)));

///CommitListModel
class CommitListModel extends CommitListEntity {
  CommitListModel({
    super.author,
    super.commentsUrl,
    super.commit,
    super.committer,
    super.files,
    super.htmlUrl,
    super.nodeId,
    super.parents,
    super.sha,
    super.stats,
    super.url,
  });

  factory CommitListModel.fromJson(Map<String, dynamic> json) =>
      CommitListModel(
        author: json["author"] == null
            ? null
            : GithubUserModel.fromJson(json["author"]),
        commentsUrl: json["comments_url"],
        commit: json["commit"] == null
            ? null
            : CommitModel.fromJson(json["commit"]),
        committer: json["committer"] == null
            ? null
            : GithubUserModel.fromJson(json["committer"]),
        files: json["files"] == null
            ? []
            : List<DiffEntryModel>.from(
                json["files"]!.map((x) => DiffEntryModel.fromJson(x))),
        htmlUrl: json["html_url"],
        nodeId: json["node_id"],
        parents: json["parents"] == null
            ? []
            : List<ParentModel>.from(
                json["parents"]!.map((x) => ParentModel.fromJson(x))),
        sha: json["sha"],
        stats:
            json["stats"] == null ? null : StatsModel.fromJson(json["stats"]),
        url: json["url"],
      );
}

///A GitHub user.
class GithubUserModel extends GithubUserEntity {
  GithubUserModel({
    super.avatarUrl,
    super.email,
    super.eventsUrl,
    super.followersUrl,
    super.followingUrl,
    super.gistsUrl,
    super.gravatarId,
    super.htmlUrl,
    super.id,
    super.login,
    super.name,
    super.nodeId,
    super.organizationsUrl,
    super.receivedEventsUrl,
    super.reposUrl,
    super.siteAdmin,
    super.starredAt,
    super.starredUrl,
    super.subscriptionsUrl,
    super.type,
    super.url,
  });

  factory GithubUserModel.fromJson(Map<String, dynamic> json) =>
      GithubUserModel(
        avatarUrl: json["avatar_url"],
        email: json["email"],
        eventsUrl: json["events_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        gistsUrl: json["gists_url"],
        gravatarId: json["gravatar_id"],
        htmlUrl: json["html_url"],
        id: json["id"],
        login: json["login"],
        name: json["name"],
        nodeId: json["node_id"],
        organizationsUrl: json["organizations_url"],
        receivedEventsUrl: json["received_events_url"],
        reposUrl: json["repos_url"],
        siteAdmin: json["site_admin"],
        starredAt: json["starred_at"],
        starredUrl: json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"],
        type: json["type"],
        url: json["url"],
      );
}

class CommitModel extends CommitEntity {
  CommitModel({
    super.author,
    super.commentCount,
    super.committer,
    super.message,
    super.tree,
    super.url,
    super.verification,
  });

  factory CommitModel.fromJson(Map<String, dynamic> json) => CommitModel(
        author: json["author"] == null
            ? null
            : GitUserModel.fromJson(json["author"]),
        commentCount: json["comment_count"],
        committer: json["committer"] == null
            ? null
            : GitUserModel.fromJson(json["committer"]),
        message: json["message"],
        tree: json["tree"] == null ? null : TreeModel.fromJson(json["tree"]),
        url: json["url"],
        verification: json["verification"] == null
            ? null
            : VerificationModel.fromJson(json["verification"]),
      );
}

///Metaproperties for Git author/committer information.
class GitUserModel extends GitUserEntity {
  GitUserModel({
    super.date,
    super.email,
    super.name,
  });

  factory GitUserModel.fromJson(Map<String, dynamic> json) => GitUserModel(
        date: json["date"],
        email: json["email"],
        name: json["name"],
      );
}

class TreeModel extends TreeEntity {
  TreeModel({
    super.sha,
    super.url,
  });

  factory TreeModel.fromJson(Map<String, dynamic> json) => TreeModel(
        sha: json["sha"],
        url: json["url"],
      );
}

class VerificationModel extends VerificationEntity {
  VerificationModel({
    super.payload,
    super.reason,
    super.signature,
    super.verified,
  });

  factory VerificationModel.fromJson(Map<String, dynamic> json) =>
      VerificationModel(
        payload: json["payload"],
        reason: json["reason"],
        signature: json["signature"],
        verified: json["verified"],
      );
}

///Diff Entry
class DiffEntryModel extends DiffEntryEntity {
  DiffEntryModel({
    super.additions,
    super.blobUrl,
    super.changes,
    super.contentsUrl,
    super.deletions,
    super.filename,
    super.patch,
    super.previousFilename,
    super.rawUrl,
    super.sha,
    super.status,
  });

  factory DiffEntryModel.fromJson(Map<String, dynamic> json) => DiffEntryModel(
        additions: json["additions"],
        blobUrl: json["blob_url"],
        changes: json["changes"],
        contentsUrl: json["contents_url"],
        deletions: json["deletions"],
        filename: json["filename"],
        patch: json["patch"],
        previousFilename: json["previous_filename"],
        rawUrl: json["raw_url"],
        sha: json["sha"],
        status: statusValues.map[json["status"]]!,
      );
}

class ParentModel extends ParentEntity {
  ParentModel({
    super.htmlUrl,
    super.sha,
    super.url,
  });

  factory ParentModel.fromJson(Map<String, dynamic> json) => ParentModel(
        htmlUrl: json["html_url"],
        sha: json["sha"],
        url: json["url"],
      );
}

class StatsModel extends StatsEntity {
  StatsModel({
    super.additions,
    super.deletions,
    super.total,
  });

  factory StatsModel.fromJson(Map<String, dynamic> json) => StatsModel(
        additions: json["additions"],
        deletions: json["deletions"],
        total: json["total"],
      );
}
