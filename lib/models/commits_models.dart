// app.quicktype.io
//
// To parse this JSON data, do
//
//     final commitList = commitListFromJson(jsonString);

import 'dart:convert';

List<CommitList> commitListFromJson(String str) =>
    List<CommitList>.from(json.decode(str).map((x) => CommitList.fromJson(x)));

String commitListToJson(List<CommitList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

///Commit
class CommitList {
  GithubUser? author;
  String? commentsUrl;
  Commit? commit;
  GithubUser? committer;
  List<DiffEntry>? files;
  String? htmlUrl;
  String? nodeId;
  List<Parent>? parents;
  String? sha;
  Stats? stats;
  String? url;

  CommitList({
    this.author,
    this.commentsUrl,
    this.commit,
    this.committer,
    this.files,
    this.htmlUrl,
    this.nodeId,
    this.parents,
    this.sha,
    this.stats,
    this.url,
  });

  factory CommitList.fromJson(Map<String, dynamic> json) => CommitList(
        author:
            json["author"] == null ? null : GithubUser.fromJson(json["author"]),
        commentsUrl: json["comments_url"],
        commit: json["commit"] == null ? null : Commit.fromJson(json["commit"]),
        committer: json["committer"] == null
            ? null
            : GithubUser.fromJson(json["committer"]),
        files: json["files"] == null
            ? []
            : List<DiffEntry>.from(
                json["files"]!.map((x) => DiffEntry.fromJson(x))),
        htmlUrl: json["html_url"],
        nodeId: json["node_id"],
        parents: json["parents"] == null
            ? []
            : List<Parent>.from(
                json["parents"]!.map((x) => Parent.fromJson(x))),
        sha: json["sha"],
        stats: json["stats"] == null ? null : Stats.fromJson(json["stats"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "author": author?.toJson(),
        "comments_url": commentsUrl,
        "commit": commit?.toJson(),
        "committer": committer?.toJson(),
        "files": files == null
            ? []
            : List<dynamic>.from(files!.map((x) => x.toJson())),
        "html_url": htmlUrl,
        "node_id": nodeId,
        "parents": parents == null
            ? []
            : List<dynamic>.from(parents!.map((x) => x.toJson())),
        "sha": sha,
        "stats": stats?.toJson(),
        "url": url,
      };
}

///A GitHub user.
class GithubUser {
  String? avatarUrl;
  String? email;
  String? eventsUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? gravatarId;
  String? htmlUrl;
  int? id;
  String? login;
  String? name;
  String? nodeId;
  String? organizationsUrl;
  String? receivedEventsUrl;
  String? reposUrl;
  bool? siteAdmin;
  String? starredAt;
  String? starredUrl;
  String? subscriptionsUrl;
  String? type;
  String? url;

  GithubUser({
    this.avatarUrl,
    this.email,
    this.eventsUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.gravatarId,
    this.htmlUrl,
    this.id,
    this.login,
    this.name,
    this.nodeId,
    this.organizationsUrl,
    this.receivedEventsUrl,
    this.reposUrl,
    this.siteAdmin,
    this.starredAt,
    this.starredUrl,
    this.subscriptionsUrl,
    this.type,
    this.url,
  });

  factory GithubUser.fromJson(Map<String, dynamic> json) => GithubUser(
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

  Map<String, dynamic> toJson() => {
        "avatar_url": avatarUrl,
        "email": email,
        "events_url": eventsUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "gravatar_id": gravatarId,
        "html_url": htmlUrl,
        "id": id,
        "login": login,
        "name": name,
        "node_id": nodeId,
        "organizations_url": organizationsUrl,
        "received_events_url": receivedEventsUrl,
        "repos_url": reposUrl,
        "site_admin": siteAdmin,
        "starred_at": starredAt,
        "starred_url": starredUrl,
        "subscriptions_url": subscriptionsUrl,
        "type": type,
        "url": url,
      };
}

class Commit {
  PurpleGitUser? author;
  int? commentCount;
  FluffyGitUser? committer;
  String? message;
  Tree? tree;
  String? url;
  Verification? verification;

  Commit({
    this.author,
    this.commentCount,
    this.committer,
    this.message,
    this.tree,
    this.url,
    this.verification,
  });

  factory Commit.fromJson(Map<String, dynamic> json) => Commit(
        author: json["author"] == null
            ? null
            : PurpleGitUser.fromJson(json["author"]),
        commentCount: json["comment_count"],
        committer: json["committer"] == null
            ? null
            : FluffyGitUser.fromJson(json["committer"]),
        message: json["message"],
        tree: json["tree"] == null ? null : Tree.fromJson(json["tree"]),
        url: json["url"],
        verification: json["verification"] == null
            ? null
            : Verification.fromJson(json["verification"]),
      );

  Map<String, dynamic> toJson() => {
        "author": author?.toJson(),
        "comment_count": commentCount,
        "committer": committer?.toJson(),
        "message": message,
        "tree": tree?.toJson(),
        "url": url,
        "verification": verification?.toJson(),
      };
}

///Metaproperties for Git author/committer information.
class PurpleGitUser {
  String? date;
  String? email;
  String? name;

  PurpleGitUser({
    this.date,
    this.email,
    this.name,
  });

  factory PurpleGitUser.fromJson(Map<String, dynamic> json) => PurpleGitUser(
        date: json["date"],
        email: json["email"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "email": email,
        "name": name,
      };
}

///Metaproperties for Git author/committer information.
class FluffyGitUser {
  String? date;
  String? email;
  String? name;

  FluffyGitUser({
    this.date,
    this.email,
    this.name,
  });

  factory FluffyGitUser.fromJson(Map<String, dynamic> json) => FluffyGitUser(
        date: json["date"],
        email: json["email"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "email": email,
        "name": name,
      };
}

class Tree {
  String? sha;
  String? url;

  Tree({
    this.sha,
    this.url,
  });

  factory Tree.fromJson(Map<String, dynamic> json) => Tree(
        sha: json["sha"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "sha": sha,
        "url": url,
      };
}

class Verification {
  String? payload;
  String? reason;
  String? signature;
  bool? verified;

  Verification({
    this.payload,
    this.reason,
    this.signature,
    this.verified,
  });

  factory Verification.fromJson(Map<String, dynamic> json) => Verification(
        payload: json["payload"],
        reason: json["reason"],
        signature: json["signature"],
        verified: json["verified"],
      );

  Map<String, dynamic> toJson() => {
        "payload": payload,
        "reason": reason,
        "signature": signature,
        "verified": verified,
      };
}

///Diff Entry
class DiffEntry {
  int? additions;
  String? blobUrl;
  int? changes;
  String? contentsUrl;
  int? deletions;
  String? filename;
  String? patch;
  String? previousFilename;
  String? rawUrl;
  String? sha;
  Status? status;

  DiffEntry({
    this.additions,
    this.blobUrl,
    this.changes,
    this.contentsUrl,
    this.deletions,
    this.filename,
    this.patch,
    this.previousFilename,
    this.rawUrl,
    this.sha,
    this.status,
  });

  factory DiffEntry.fromJson(Map<String, dynamic> json) => DiffEntry(
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

  Map<String, dynamic> toJson() => {
        "additions": additions,
        "blob_url": blobUrl,
        "changes": changes,
        "contents_url": contentsUrl,
        "deletions": deletions,
        "filename": filename,
        "patch": patch,
        "previous_filename": previousFilename,
        "raw_url": rawUrl,
        "sha": sha,
        "status": statusValues.reverse[status],
      };
}

// ignore: constant_identifier_names
enum Status { ADDED, CHANGED, COPIED, MODIFIED, REMOVED, RENAMED, UNCHANGED }

final statusValues = EnumValues({
  "added": Status.ADDED,
  "changed": Status.CHANGED,
  "copied": Status.COPIED,
  "modified": Status.MODIFIED,
  "removed": Status.REMOVED,
  "renamed": Status.RENAMED,
  "unchanged": Status.UNCHANGED
});

class Parent {
  String? htmlUrl;
  String? sha;
  String? url;

  Parent({
    this.htmlUrl,
    this.sha,
    this.url,
  });

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        htmlUrl: json["html_url"],
        sha: json["sha"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "html_url": htmlUrl,
        "sha": sha,
        "url": url,
      };
}

class Stats {
  int? additions;
  int? deletions;
  int? total;

  Stats({
    this.additions,
    this.deletions,
    this.total,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        additions: json["additions"],
        deletions: json["deletions"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "additions": additions,
        "deletions": deletions,
        "total": total,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
