import 'package:firemaintenance/domain/status/status.dart';
import 'package:firemaintenance/service/maintenance/maintentanceService.dart';
import 'package:firemaintenance/widgets/util_widgets/decored_button/decored_button.dart';
import 'package:flutter/material.dart';
import 'package:firemaintenance/domain/equipment/equipment.dart';
import 'package:firemaintenance/service/status/status_service.dart';
import 'package:firemaintenance/widgets/equipment_screen/equipment_app_bar/equipment_app_bar.dart';
import 'package:firemaintenance/widgets/equipment_screen/status_box/future_status_box.dart';
import 'package:firemaintenance/widgets/equipment_screen/statuses_button/statuses_button.dart';
import '../maintenance_list/maintenance_list.dart';

class EquipmentScreen extends StatefulWidget {
  final Equipment equipment;
  final MaintenanceService maintenanceService;
  final StatusService statusService;

  const EquipmentScreen(
     this.equipment,
     this.maintenanceService,
     this.statusService,
  );

  @override
  State<EquipmentScreen> createState() => _EquipmentScreenState();
}

class _EquipmentScreenState extends State<EquipmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          EquipmentAppBar(widget.equipment),
          const SubTitle(title: "Status"),
          _buildFutureStatusBox(),
          _buildStatusesButton(),
          const SubTitle(title: "Mantenimiento"),
          _buildMaintenanceSection(),
          _buildMaintenanceButton(),
        ],
      )
    );
  }


  SliverToBoxAdapter _buildFutureStatusBox() {
    return SliverToBoxAdapter(
      child: FutureStatusBox(widget.statusService.getLastOne(widget.equipment)),
    );
  }

  SliverToBoxAdapter _buildStatusesButton() {
    return SliverToBoxAdapter(
      child: StatusesButton(widget.statusService, widget.equipment),
    );
  }

  SliverToBoxAdapter _buildMaintenanceSection() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 150,
        child: FutureMaintenanceList(widget.maintenanceService.getFrom(widget.equipment)),
      ),
    );
  }

  SliverToBoxAdapter _buildMaintenanceButton() {
    return SliverToBoxAdapter(
      child: DecoratedButton.hollow(
        context: context,
        text: "Dar mantenimiento",
        onPressed: _handleMaintenance,
      ),
    );
  }

  void _handleMaintenance() async {
    await widget.maintenanceService.maintain(widget.equipment);
    final lastStatus = await widget.statusService.getLastOne(widget.equipment);
    if (lastStatus.status == StatusType.notOk) {
      await widget.statusService.create(widget.equipment, StatusType.ok);
    }
    setState(() {});
  }
}

class SubTitle extends StatelessWidget {
  final String title;
  const SubTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
