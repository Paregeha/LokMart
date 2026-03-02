import 'package:latlong2/latlong.dart';

sealed class TrackOrderEvent {
  const TrackOrderEvent();
}

final class TrackOrderBoot extends TrackOrderEvent {
  const TrackOrderBoot();
}

final class TrackOrderPollTick extends TrackOrderEvent {
  const TrackOrderPollTick();
}

final class TrackOrderDragUpdate extends TrackOrderEvent {
  const TrackOrderDragUpdate({required this.rawPoint});
  final LatLng rawPoint;
}

final class TrackOrderDragEnd extends TrackOrderEvent {
  const TrackOrderDragEnd();
}

final class TrackOrderDialogOpened extends TrackOrderEvent {
  const TrackOrderDialogOpened();
}

final class TrackOrderNotificationShown extends TrackOrderEvent {
  const TrackOrderNotificationShown();
}

final class TrackOrderFinishAndLock extends TrackOrderEvent {
  const TrackOrderFinishAndLock();
}
