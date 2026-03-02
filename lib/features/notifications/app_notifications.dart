import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class AppNotifications {
  AppNotifications._();
  static final AppNotifications instance = AppNotifications._();

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static const String _channelId = 'orders';
  static const String _channelName = 'Orders';
  static const String _channelDesc = 'Order notifications';

  Future<void> init({required void Function(String? payload) onTap}) async {
    tz.initializeTimeZones();

    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');

    const iosInit = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    await _plugin.initialize(
      const InitializationSettings(android: androidInit, iOS: iosInit),
      onDidReceiveNotificationResponse: (resp) => onTap(resp.payload),
    );

    final ios =
        _plugin
            .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin
            >();
    await ios?.requestPermissions(alert: true, badge: true, sound: true);

    const channel = AndroidNotificationChannel(
      _channelId,
      _channelName,
      description: _channelDesc,
      importance: Importance.max,
    );

    final android =
        _plugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >();
    await android?.createNotificationChannel(channel);

    debugPrint('Notifications initialized');
  }

  Future<void> showCourierArrived({required String documentId}) async {
    final payload = jsonEncode({
      'type': 'order_arrived',
      'documentId': documentId,
    });

    debugPrint('Scheduling notification in 10 seconds...');

    const android = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDesc,
      importance: Importance.max,
      priority: Priority.high,
    );

    const ios = DarwinNotificationDetails(
      presentAlert: true,
      presentSound: true,
      presentBadge: true,
      interruptionLevel: InterruptionLevel.active,
    );

    try {
      await _plugin.zonedSchedule(
        documentId.hashCode,
        'Courier arrived',
        'Open to confirm or decline delivery.',
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
        const NotificationDetails(android: android, iOS: ios),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: payload,
      );

      debugPrint('Notification scheduled');
    } catch (e, st) {
      debugPrint('schedule ERROR: $e');
      debugPrint('$st');
    }
  }
}
