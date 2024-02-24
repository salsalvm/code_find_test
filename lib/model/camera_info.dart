
import 'dart:convert';

CameraInfo cameraInfoFromJson(String str) => CameraInfo.fromJson(json.decode(str));

String cameraInfoToJson(CameraInfo data) => json.encode(data.toJson());

class CameraInfo {
    List<Item> items;

    CameraInfo({
        required this.items,
    });

    factory CameraInfo.fromJson(Map<String, dynamic> json) => CameraInfo(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class ApiInfo {
    String status;

    ApiInfo({
        required this.status,
    });

    factory ApiInfo.fromJson(Map<String, dynamic> json) => ApiInfo(
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
    };
}

class Item {
    List<Camera> cameras;

    Item({
        required this.cameras,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        cameras: List<Camera>.from(json["cameras"].map((x) => Camera.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cameras": List<dynamic>.from(cameras.map((x) => x.toJson())),
    };
}

class Camera {
    String image;
    Location location;
    String cameraId;

    Camera({
        required this.image,
        required this.location,
        required this.cameraId,
    });

    factory Camera.fromJson(Map<String, dynamic> json) => Camera(
        image: json["image"],
        location: Location.fromJson(json["location"]),
        cameraId: json["camera_id"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "location": location.toJson(),
        "camera_id": cameraId,
    };
}

class ImageMetadata {
    int height;
    int width;
    String md5;

    ImageMetadata({
        required this.height,
        required this.width,
        required this.md5,
    });

    factory ImageMetadata.fromJson(Map<String, dynamic> json) => ImageMetadata(
        height: json["height"],
        width: json["width"],
        md5: json["md5"],
    );

    Map<String, dynamic> toJson() => {
        "height": height,
        "width": width,
        "md5": md5,
    };
}

class Location {
    double latitude;
    double longitude;

    Location({
        required this.latitude,
        required this.longitude,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
    };
}