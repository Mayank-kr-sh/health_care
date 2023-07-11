import 'package:flutter/material.dart';
import 'package:health_care/Frontend/constants/constants.dart';

class NotificationCard extends StatefulWidget {
  final IconData? icon;
  final String title;
  final String subtitle;
  final bool enabled;
  final ValueChanged<bool>? onChanged;

  const NotificationCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.enabled = true,
    this.onChanged,
  }) : super(key: key);

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  bool _isEnabled = false;

  @override
  void initState() {
    super.initState();
    _isEnabled = widget.enabled;
  }

  void _toggleEnabled(bool value) {
    setState(() {
      _isEnabled = value;
      widget.onChanged?.call(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        elevation: 2,
        child: ListTile(
          leading: Icon(
            widget.icon,
            color: kPrimaryColor,
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 11),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(widget.subtitle),
          ),
          trailing: Switch(
            value: _isEnabled,
            onChanged: widget.enabled ? _toggleEnabled : null,
            activeColor: kPrimaryColor,
            inactiveThumbColor: Colors.grey,
          ),
        ),
      ),
    );
  }
}
