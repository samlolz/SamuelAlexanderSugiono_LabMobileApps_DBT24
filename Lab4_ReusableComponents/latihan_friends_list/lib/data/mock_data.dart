import '../models/user_model.dart';
import '../models/message_model.dart';

List<UserModel> users = [
  const UserModel(
    name: "Hansol",
    lastMessage: "gw traktir azul",
    time: "08:30",
    photoUrl: "https://i.pinimg.com/736x/4f/6f/87/4f6f8794f8a81325f2142ace86589c8f.jpg",
  ),
  const UserModel(
    name: "Riccis",
    lastMessage: "aduh kena gigi",
    time: "09:10",
    photoUrl: "https://sinpo.id/storage/2026/02/epstein-files-dari-bocoran-email-film-kontroversial-hingga-misteri-malam-terakhir-07022026-012014.jpg",
  ),
  const UserModel(
    name: "Leon",
    lastMessage: "info poker",
    time: "Yesterday",
    photoUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJeHY9pgX79xfu-aLyC_VpRrqWUu-RpyE1yQ&s",
  ),
];

List<MessageModel> messages = [
  const MessageModel(text: "halo mok", isMe: false),
  const MessageModel(text: "Halo juga!", isMe: true),
  const MessageModel(text: "Jangan lupa tugas ya", isMe: false),
];
