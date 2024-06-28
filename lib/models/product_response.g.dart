// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      salePrice: (json['salePrice'] as num?)?.toDouble(),
      dateCreated: json['dateCreated'] == null
          ? null
          : DateTime.parse(json['dateCreated'] as String),
      type:
          $enumDecodeNullable(_$CategoryEnumEnumMap, json['productTypeEnum']) ??
              CategoryEnum.none,
      description: json['description'] as String?,
      images: (json['productImages'] as List<dynamic>?)
          ?.map((e) => ProductImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      productId: json['productId'] as String?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      newArrival: json['newArrival'] as bool?,
      featured: json['featured'] as bool?,
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'salePrice': instance.salePrice,
      'dateCreated': instance.dateCreated?.toIso8601String(),
      'productTypeEnum': _$CategoryEnumEnumMap[instance.type]!,
      'description': instance.description,
      'productImages': instance.images?.map((e) => e.toJson()).toList(),
      'newArrival': instance.newArrival,
      'featured': instance.featured,
    };

const _$CategoryEnumEnumMap = {
  CategoryEnum.none: 'NONE',
  CategoryEnum.laptop: 'LAPTOP',
  CategoryEnum.desktop: 'DESKTOP',
  CategoryEnum.camera: 'CAMERA',
  CategoryEnum.mouse: 'MOUSE',
  CategoryEnum.monitor: 'MONITOR',
  CategoryEnum.keyboard: 'KEYBOARD',
  CategoryEnum.tablet: 'TABLET',
  CategoryEnum.smartphone: 'SMARTPHONE',
  CategoryEnum.printer: 'PRINTER',
  CategoryEnum.scanner: 'SCANNER',
  CategoryEnum.speaker: 'SPEAKER',
  CategoryEnum.headphones: 'HEADPHONES',
  CategoryEnum.microphone: 'MICROPHONE',
  CategoryEnum.smartwatch: 'SMARTWATCH',
  CategoryEnum.router: 'ROUTER',
  CategoryEnum.modem: 'MODEM',
  CategoryEnum.hardDrive: 'HARD_DRIVE',
  CategoryEnum.solidStateDrive: 'SOLID_STATE_DRIVE',
  CategoryEnum.usbDrive: 'USB_DRIVE',
  CategoryEnum.memoryCard: 'MEMORY_CARD',
  CategoryEnum.projector: 'PROJECTOR',
  CategoryEnum.graphicsCard: 'GRAPHICS_CARD',
  CategoryEnum.motherboard: 'MOTHERBOARD',
  CategoryEnum.cpu: 'CPU',
  CategoryEnum.ram: 'RAM',
  CategoryEnum.powerSupply: 'POWER_SUPPLY',
  CategoryEnum.casePc: 'CASE_PC',
  CategoryEnum.coolingFan: 'COOLING_FAN',
  CategoryEnum.webcam: 'WEBCAM',
  CategoryEnum.drone: 'DRONE',
  CategoryEnum.vrHeadset: 'VR_HEADSET',
  CategoryEnum.gameConsole: 'GAME_CONSOLE',
};

ProductImage _$ProductImageFromJson(Map<String, dynamic> json) => ProductImage(
      src: json['source'] as String?,
    );

Map<String, dynamic> _$ProductImageToJson(ProductImage instance) =>
    <String, dynamic>{
      'source': instance.src,
    };
