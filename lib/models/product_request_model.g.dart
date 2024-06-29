// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductRequestModel _$ProductRequestModelFromJson(Map<String, dynamic> json) =>
    ProductRequestModel(
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      imageUrl: json['imageUrl'] as String?,
      description: json['description'] as String?,
      salePrice: (json['salePrice'] as num?)?.toDouble(),
      type:
          $enumDecodeNullable(_$CategoryEnumEnumMap, json['productTypeEnum']) ??
              CategoryEnum.none,
    );

Map<String, dynamic> _$ProductRequestModelToJson(
        ProductRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'salePrice': instance.salePrice,
      'productTypeEnum': _$CategoryEnumEnumMap[instance.type]!,
      'description': instance.description,
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
