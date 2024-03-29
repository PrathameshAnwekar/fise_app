import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/app_theme.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          "manage notifications",
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PushNotificationTile(),
            //
            WhatsappNotificationTile(),
            //
            EmailNotificationTile(),
          ],
        ),
      ),
    );
  }
}

class subTile extends StatefulWidget {
  const subTile(
      {Key? key,
      required this.title,
      required this.boolvalue,
      required this.Style})
      : super(key: key);
  final String title;
  final TextStyle Style;
  final bool boolvalue;
  @override
  State<subTile> createState() => _subTileState();
}

class _subTileState extends State<subTile> {
  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: ListTile(
        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
        title: Text(
          widget.title,
          style: widget.Style,
        ),
        trailing: Transform.scale(
          scale: 0.7,
          child: CupertinoSwitch(
            activeColor: AppThemeData.lightColorScheme.primary,
            value: widget.boolvalue,
            onChanged: (bool value) {
              setState(() {});
            },
          ),
        ),
        onTap: () {
          //
        },
      ),
    );
  }
}

class PushNotificationTile extends StatelessWidget {
  const PushNotificationTile({super.key});

  @override
  Widget build(BuildContext context) {
    bool _PushNoti = false;
    bool _PushTransactional = false;
    bool _PushAccRelated = false;
    bool _PushPromo = false;
    return Column(
      children: [
        subTile(
            title: "Push Notification",
            boolvalue: _PushNoti,
            Style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500)),
        Divider(
          endIndent: 160,
          indent: 18.0,
          thickness: 1,
          color: Colors.black.withOpacity(0.2),
        ),
        subTile(
            title: 'Transactional',
            boolvalue: _PushTransactional,
            Style: TextStyle(fontSize: 18)),
        subTile(
            title: 'AccountRelated',
            boolvalue: _PushAccRelated,
            Style: TextStyle(fontSize: 18)),
        subTile(
            title: 'Promotional',
            boolvalue: _PushPromo,
            Style: TextStyle(fontSize: 18)),
        const SizedBox(height: 24),
        //
        Divider(
          endIndent: 15,
          indent: 15,
          thickness: 1,
          color: Colors.black.withOpacity(0.2),
        ),
      ],
    );
  }
}

class WhatsappNotificationTile extends StatelessWidget {
  const WhatsappNotificationTile({super.key});

  @override
  Widget build(BuildContext context) {
    bool _WhatsappNoti = false;
    bool _WhatsappTransactional = false;
    bool _WhatsappAccRealated = false;
    bool _WhatsappPromo = false;
    return Column(
      children: [
        subTile(
            title: "Whatsapp Notification",
            boolvalue: _WhatsappNoti,
            Style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500)),
        Divider(
          endIndent: 160,
          indent: 18.0,
          thickness: 1,
          color: Colors.black.withOpacity(0.2),
        ),
        subTile(
            title: 'Transactional',
            boolvalue: _WhatsappTransactional,
            Style: TextStyle(fontSize: 18)),
        subTile(
            title: 'AccountRelated',
            boolvalue: _WhatsappAccRealated,
            Style: TextStyle(fontSize: 18)),
        subTile(
            title: 'Promotional',
            boolvalue: _WhatsappPromo,
            Style: TextStyle(fontSize: 18)),
        const SizedBox(height: 24),

        //
        Divider(
          endIndent: 15,
          indent: 15,
          thickness: 1,
          color: Colors.black.withOpacity(0.2),
        ),
      ],
    );
  }
}

class EmailNotificationTile extends StatelessWidget {
  const EmailNotificationTile({super.key});

  @override
  Widget build(BuildContext context) {
    bool _EmailNoti = false;
    bool _EmailTransactional = false;
    bool _EmailAccRelated = false;
    bool _EmailPromo = false;

    return Column(
      children: [
        subTile(
            title: "Email Notification",
            boolvalue: _EmailNoti,
            Style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500)),
        Divider(
          endIndent: 160,
          indent: 18.0,
          thickness: 1,
          color: Colors.black.withOpacity(0.2),
        ),
        subTile(
            title: 'Transactional',
            boolvalue: _EmailTransactional,
            Style: TextStyle(fontSize: 18)),
        subTile(
            title: 'AccountRelated',
            boolvalue: _EmailAccRelated,
            Style: TextStyle(fontSize: 18)),
        subTile(
            title: 'Promotional',
            boolvalue: _EmailPromo,
            Style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
