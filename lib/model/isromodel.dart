// To parse this JSON data, do
//
//     final isromodel = isromodelFromJson(jsonString);

import 'dart:convert';

List<Isromodel> isromodelFromJson(String str) => List<Isromodel>.from(json.decode(str).map((x) => Isromodel.fromJson(x)));

String isromodelToJson(List<Isromodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Isromodel {
    String uuid;
    String name;
    String serialNumber;
    DateTime launchDate;
    String launchType;
    String payload;
    String link;
    MissionStatus missionStatus;

    Isromodel({
        required this.uuid,
        required this.name,
        required this.serialNumber,
        required this.launchDate,
        required this.launchType,
        required this.payload,
        required this.link,
        required this.missionStatus,
    });

    factory Isromodel.fromJson(Map<String, dynamic> json) => Isromodel(
        uuid: json["UUID"],
        name: json["Name"],
        serialNumber: json["SerialNumber"],
        launchDate: DateTime.parse(json["LaunchDate"]),
        launchType: json["LaunchType"],
        payload: json["Payload"],
        link: json["Link"],
        missionStatus: missionStatusValues.map[json["MissionStatus"]]!,
    );

    Map<String, dynamic> toJson() => {
        "UUID": uuid,
        "Name": name,
        "SerialNumber": serialNumber,
        "LaunchDate": "${launchDate.year.toString().padLeft(4, '0')}-${launchDate.month.toString().padLeft(2, '0')}-${launchDate.day.toString().padLeft(2, '0')}",
        "LaunchType": launchType,
        "Payload": payload,
        "Link": link,
        "MissionStatus": missionStatusValues.reverse[missionStatus],
    };
}

enum MissionStatus {
    MISSION_SUCCESSFUL,
    MISSION_UNSUCCESSFUL
}

final missionStatusValues = EnumValues({
    "MISSION SUCCESSFUL": MissionStatus.MISSION_SUCCESSFUL,
    "MISSION UNSUCCESSFUL": MissionStatus.MISSION_UNSUCCESSFUL
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
