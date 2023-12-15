import 'dart:async';

import 'package:cbj_integrations_controller/infrastructure/devices_service.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_abstract.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/entity_type_utils.dart';
import 'package:cbj_integrations_controller/infrastructure/search_devices.dart';

part 'package:cybear_jinni/infrastructure/phone_as_hub.dart';

abstract interface class IPhoneAsHub {
  static IPhoneAsHub? _instance;

  static IPhoneAsHub get instance {
    return _instance ??= _PhoneAsHubRepository();
  }

  Future searchDevices();

  void setEntityState({
    required String cbjUniqeId,
    required VendorsAndServices vendor,
    required EntityProperties property,
    required EntityActions actionType,
    dynamic value,
  });

  Future<Map<String, DeviceEntityAbstract>> get getAllEntities;

  void startListen();

  Future dispose();
}
