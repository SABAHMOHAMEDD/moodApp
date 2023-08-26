import 'package:flutter/material.dart';

import '../cache_helper.dart';

const String KLogo = "assets/images/lovemessage.png";
const String usersCollection = "users";

const String privateChatCollection = "chats";
const String privateMessagesCollection = "messages";
const Color KPrimaryColor = Color(0xFFDBA39A);

const Color KFontColor = Color(0xFF404642);
const Color KLightFontColor = Color(0xFFA3ADAF);
const Color KSecondryColor = Color(0xFFF5EBE0);
const Color KAppBarColor = Color(0xFFF5EBE0);

const Color KScaffoldColor = Colors.white;
const String kCreatedAt = "createdAt";
final String? uId = CacheHelper.getData(key: 'uId');
