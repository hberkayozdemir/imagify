// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Website {
  final String title, link;
  final IconData icon;
  Website({
    required this.link,
    required this.icon,
    required this.title,
  });

  Website copyWith({
    String? title,
    link,
    IconData? icon,
  }) {
    return Website(
        link: link ?? this.link,
        icon: icon ?? this.icon,
        title: title ?? this.title);
  }

  onCall(String username) => launchUrl(Uri.parse(link + username));
}
