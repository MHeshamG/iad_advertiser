class AdTimeInterval {
  DateTime adStartingDateTime;
  DateTime adEndingDateTime;

  AdTimeInterval(adStartingDateTime, adEndingDateTime);

  AdTimeInterval.withoutInit();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdTimeInterval &&
          runtimeType == other.runtimeType &&
          adStartingDateTime == other.adStartingDateTime &&
          adEndingDateTime == other.adEndingDateTime;

  @override
  int get hashCode => adStartingDateTime.hashCode ^ adEndingDateTime.hashCode;

  @override
  String toString() {
    return 'AdTimeInterval from: $adStartingDateTime, to: $adEndingDateTime}';
  }

  bool overlapsWith(AdTimeInterval adTimeInterval) {
    return doesDatesOverlap(adTimeInterval) && doesTimesOverlap(adTimeInterval);
  }

  bool doesTimesOverlap(AdTimeInterval adTimeInterval) {
    bool overlaps = (
        (adStartingDateTime.hour < adTimeInterval.adEndingDateTime.hour &&
            adTimeInterval.adStartingDateTime.hour < adEndingDateTime.hour));

    return overlaps;
  }

  bool doesDatesOverlap(AdTimeInterval adTimeInterval) {
    DateTime thisAdStartingDate = DateTime(adStartingDateTime.year,
        adStartingDateTime.month, adStartingDateTime.day);
    DateTime thisAdEndingDate = DateTime(
        adEndingDateTime.year, adEndingDateTime.month, adEndingDateTime.day);
    DateTime paramAdStartingDate = DateTime(
        adTimeInterval.adStartingDateTime.year,
        adTimeInterval.adStartingDateTime.month,
        adTimeInterval.adStartingDateTime.day);
    DateTime paramAdEndingDate = DateTime(
        adTimeInterval.adEndingDateTime.year,
        adTimeInterval.adEndingDateTime.month,
        adTimeInterval.adEndingDateTime.day);

    bool overlaps = ((thisAdStartingDate.isBefore(paramAdEndingDate) && paramAdStartingDate.isBefore(thisAdEndingDate)));

    return overlaps;
  }

  int calculateTotalHours(){
    DateTime thisAdStartingDate = DateTime(adStartingDateTime.year,
        adStartingDateTime.month, adStartingDateTime.day);
    DateTime thisAdEndingDate = DateTime(
        adEndingDateTime.year, adEndingDateTime.month, adEndingDateTime.day);
    return (thisAdEndingDate.difference(thisAdStartingDate).inDays+1)*(adEndingDateTime.hour - adStartingDateTime.hour);
  }
}
