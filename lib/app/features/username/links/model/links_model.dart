// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Links {
  final String title, link;
  final IconData icon;
  Links({
    required this.link,
    required this.icon,
    required this.title,
  });

  Links copyWith({
    String? title,
    link,
    IconData? icon,
  }) {
    return Links(
        link: link ?? this.link,
        icon: icon ?? this.icon,
        title: title ?? this.title);
  }

  onCall(String username) => launchUrl(Uri.parse(link + username));
}
