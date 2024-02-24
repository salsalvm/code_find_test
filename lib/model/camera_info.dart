class CameraInfo {
    final List<Item> items;
    final ApiInfo apiInfo;

    CameraInfo({
        required this.items,
        required this.apiInfo,
    });

}

class ApiInfo {
    final String status;

    ApiInfo({
        required this.status,
    });

}

class Item {
    final DateTime timestamp;
    final List<Camera> cameras;

    Item({
        required this.timestamp,
        required this.cameras,
    });

}

class Camera {
    final DateTime timestamp;
    final String image;
    final Location location;
    final String cameraId;
    final ImageMetadata imageMetadata;

    Camera({
        required this.timestamp,
        required this.image,
        required this.location,
        required this.cameraId,
        required this.imageMetadata,
    });

}

class ImageMetadata {
    final int height;
    final int width;
    final String md5;

    ImageMetadata({
        required this.height,
        required this.width,
        required this.md5,
    });

}

class Location {
    final double latitude;
    final double longitude;

    Location({
        required this.latitude,
        required this.longitude,
    });

}
