import 'dart:convert';

Commit commitFromJson(String str) => Commit.fromJson(json.decode(str));

String commitToJson(Commit data) => json.encode(data.toJson());

class CommitMapper {
  CommitMapper.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      final commit = Commit.fromJson(item);
      items.add(commit);
    }
  }
  CommitMapper();

  List<Commit> items = [];
}

class Commit {
  factory Commit.fromJson(Map<String, dynamic> json) => Commit(
        sha: json['sha'],
        nodeId: json['node_id'],
        commit: CommitClass.fromJson(json['commit']),
        url: json['url'],
        htmlUrl: json['html_url'],
        commentsUrl: json['comments_url'],
        author: CommitAuthor.fromJson(json['author']),
        committer: CommitAuthor.fromJson(json['committer']),
        parents: List<dynamic>.from(json['parents'].map((x) => x)),
      );

  Commit({
    required this.sha,
    required this.nodeId,
    required this.commit,
    required this.url,
    required this.htmlUrl,
    required this.commentsUrl,
    required this.author,
    required this.committer,
    required this.parents,
  });

  String sha;
  String nodeId;
  CommitClass commit;
  String url;
  String htmlUrl;
  String commentsUrl;
  CommitAuthor author;
  CommitAuthor committer;
  List<dynamic> parents;

  Map<String, dynamic> toJson() => {
        'sha': sha,
        'node_id': nodeId,
        'commit': commit.toJson(),
        'url': url,
        'html_url': htmlUrl,
        'comments_url': commentsUrl,
        'author': author.toJson(),
        'committer': committer.toJson(),
        'parents': List<dynamic>.from(parents.map((x) => x)),
      };
}

class CommitAuthor {
  factory CommitAuthor.fromJson(Map<String, dynamic> json) => CommitAuthor(
        login: json['login'],
        id: json['id'],
        nodeId: json['node_id'],
        avatarUrl: json['avatar_url'],
        gravatarId: json['gravatar_id'],
        url: json['url'],
        htmlUrl: json['html_url'],
        followersUrl: json['followers_url'],
        followingUrl: json['following_url'],
        gistsUrl: json['gists_url'],
        starredUrl: json['starred_url'],
        subscriptionsUrl: json['subscriptions_url'],
        organizationsUrl: json['organizations_url'],
        reposUrl: json['repos_url'],
        eventsUrl: json['events_url'],
        receivedEventsUrl: json['received_events_url'],
        type: json['type'],
        siteAdmin: json['site_admin'],
      );

  CommitAuthor({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });

  String login;
  int id;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  String type;
  bool siteAdmin;

  Map<String, dynamic> toJson() => {
        'login': login,
        'id': id,
        'node_id': nodeId,
        'avatar_url': avatarUrl,
        'gravatar_id': gravatarId,
        'url': url,
        'html_url': htmlUrl,
        'followers_url': followersUrl,
        'following_url': followingUrl,
        'gists_url': gistsUrl,
        'starred_url': starredUrl,
        'subscriptions_url': subscriptionsUrl,
        'organizations_url': organizationsUrl,
        'repos_url': reposUrl,
        'events_url': eventsUrl,
        'received_events_url': receivedEventsUrl,
        'type': type,
        'site_admin': siteAdmin,
      };
}

class CommitClass {
  factory CommitClass.fromJson(Map<String, dynamic> json) => CommitClass(
        author: CommitAuthorClass.fromJson(json['author']),
        committer: CommitAuthorClass.fromJson(json['committer']),
        message: json['message'],
        tree: Tree.fromJson(json['tree']),
        url: json['url'],
        commentCount: json['comment_count'],
        verification: Verification.fromJson(json['verification']),
      );
  CommitClass({
    required this.author,
    required this.committer,
    required this.message,
    required this.tree,
    required this.url,
    required this.commentCount,
    required this.verification,
  });

  CommitAuthorClass author;
  CommitAuthorClass committer;
  String message;
  Tree tree;
  String url;
  int commentCount;
  Verification verification;

  Map<String, dynamic> toJson() => {
        'author': author.toJson(),
        'committer': committer.toJson(),
        'message': message,
        'tree': tree.toJson(),
        'url': url,
        'comment_count': commentCount,
        'verification': verification.toJson(),
      };
}

class CommitAuthorClass {
  factory CommitAuthorClass.fromJson(Map<String, dynamic> json) =>
      CommitAuthorClass(
        name: json['name'],
        email: json['email'],
        date: json['date'],
      );

  CommitAuthorClass({
    required this.name,
    required this.email,
    required this.date,
  });

  String name;
  String email;
  String date;

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'date': date,
      };
}

class Tree {
  factory Tree.fromJson(Map<String, dynamic> json) => Tree(
        sha: json['sha'],
        url: json['url'],
      );

  Tree({
    required this.sha,
    required this.url,
  });

  String sha;
  String url;

  Map<String, dynamic> toJson() => {
        'sha': sha,
        'url': url,
      };
}

class Verification {
  factory Verification.fromJson(Map<String, dynamic> json) => Verification(
        verified: json['verified'],
        reason: json['reason'],
        signature: json['signature'],
        payload: json['payload'],
      );

  Verification({
    required this.verified,
    required this.reason,
    required this.signature,
    required this.payload,
  });

  bool verified;
  String reason;
  dynamic signature;
  dynamic payload;

  Map<String, dynamic> toJson() => {
        'verified': verified,
        'reason': reason,
        'signature': signature,
        'payload': payload,
      };
}
