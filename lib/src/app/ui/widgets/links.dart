import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum SocialMediaType {
  WIKIPEDIA,
  YOUTUBE,
  WEB,
}

class LinksBuilder extends StatefulWidget {
  const LinksBuilder({
    Key? key,
    this.url,
    required this.socialMediaType,
  }) : super(key: key);

  final String? url;
  final SocialMediaType socialMediaType;

  @override
  State<LinksBuilder> createState() => _LinksBuilderState();
}

class _LinksBuilderState extends State<LinksBuilder> {
  late IconData _iconData;
  Color _iconColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    createStyle();
    return Row(
      children: [
        Icon(_iconData, color: _iconColor, size: 16.sp,),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: Text(
            widget.url ?? 'No disponible',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 1,
          ),
        )
      ],
    );
  }

  void createStyle() {
    switch (widget.socialMediaType) {
      case SocialMediaType.WIKIPEDIA:
        // TODO: Handle this case.
        _iconData = FontAwesomeIcons.wikipediaW;
        _iconColor = Colors.black;
        break;
      case SocialMediaType.YOUTUBE:
        // TODO: Handle this case.
        _iconData = FontAwesomeIcons.youtube;
        _iconColor = Colors.red;
        break;
      case SocialMediaType.WEB:
        // TODO: Handle this case.
        _iconData = FontAwesomeIcons.globe;
        _iconColor = Colors.blue;
        break;
    }
  }
}
