class ChatMessageModel {
  final String avatarUrl; //ユーザのアイコンURL
  final String name; //名前
  final String datetime; //メッセージの日時
  final String message; //メッセージ本文
  final bool isMine; //メッセージの自身のものか?

  ChatMessageModel({
    required this.avatarUrl,
    required this.name,
    required this.datetime,
    required this.message,
    required this.isMine,
  });
}
