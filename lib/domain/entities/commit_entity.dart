import 'package:equatable/equatable.dart';

class CommitEntity extends Equatable {
  const CommitEntity({
    required this.sha,
    required this.nodeId,
    required this.url,
    required this.htmlUrl,
    required this.commentsUrl,
    required this.parents,
  });

  final String sha;
  final String nodeId;
  final String url;
  final String htmlUrl;
  final String commentsUrl;
  final List<dynamic> parents;

  @override
  List<Object?> get props => [
        sha,
        nodeId,
        url,
        htmlUrl,
        commentsUrl,
        parents,
      ];
}
