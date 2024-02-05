///CommitEntity
class CommitListEntity {
  GithubUserEntity? author;
  String? commentsUrl;
  CommitEntity? commit;
  GithubUserEntity? committer;
  List<DiffEntryEntity>? files;
  String? htmlUrl;
  String? nodeId;
  List<ParentEntity>? parents;
  String? sha;
  StatsEntity? stats;
  String? url;

  CommitListEntity({
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
}

///A GitHub user.
class GithubUserEntity {
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

  GithubUserEntity({
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
}

class CommitEntity {
  GitUserEntity? author;
  int? commentCount;
  GitUserEntity? committer;
  String? message;
  TreeEntity? tree;
  String? url;
  VerificationEntity? verification;

  CommitEntity({
    this.author,
    this.commentCount,
    this.committer,
    this.message,
    this.tree,
    this.url,
    this.verification,
  });
}

///Metaproperties for Git author/committer information.
class GitUserEntity {
  String? date;
  String? email;
  String? name;

  GitUserEntity({
    this.date,
    this.email,
    this.name,
  });
}

class TreeEntity {
  String? sha;
  String? url;

  TreeEntity({
    this.sha,
    this.url,
  });
}

class VerificationEntity {
  String? payload;
  String? reason;
  String? signature;
  bool? verified;

  VerificationEntity({
    this.payload,
    this.reason,
    this.signature,
    this.verified,
  });
}

///Diff Entry
class DiffEntryEntity {
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

  DiffEntryEntity({
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
}

// ignore: constant_identifier_names
enum Status { ADDED, CHANGED, COPIED, MODIFIED, REMOVED, RENAMED, UNCHANGED }

final statusValues = EnumValuesEntity({
  "added": Status.ADDED,
  "changed": Status.CHANGED,
  "copied": Status.COPIED,
  "modified": Status.MODIFIED,
  "removed": Status.REMOVED,
  "renamed": Status.RENAMED,
  "unchanged": Status.UNCHANGED
});

class ParentEntity {
  String? htmlUrl;
  String? sha;
  String? url;

  ParentEntity({
    this.htmlUrl,
    this.sha,
    this.url,
  });
}

class StatsEntity {
  int? additions;
  int? deletions;
  int? total;

  StatsEntity({
    this.additions,
    this.deletions,
    this.total,
  });
}

class EnumValuesEntity<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValuesEntity(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
