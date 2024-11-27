import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../constants/app_colors.dart';
import '../../../../model/result.dart';
import '../../../../view_model/cleaning_service_riverpod.dart';
import 'cleaning_service_card.dart';

class CleaningServiceList extends ConsumerWidget {
  const CleaningServiceList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cleaningServiceResult = ref.watch(cleaningServiceProvider);
    loadCleaningServices(cleaningServiceResult, ref);
    switch (cleaningServiceResult.status) {
      case ResultStatus.success:
        var services = cleaningServiceResult.data!;
        return Expanded(
          child: ListView.builder(
            itemCount: services.length,
            itemBuilder: (ctx, index) {
              return CleaningServiceCard(services[index]);
            },
          ),
        );
      case ResultStatus.loading:
        return Expanded(child: Center(child: SpinKitFadingCube(color: AppColors.primaryColor, size: 25)));
      case ResultStatus.failed:
        return Center(child: Text('Error : ${cleaningServiceResult.message}'));
      case ResultStatus.idle:
        return const SizedBox();
    }
  }

  void loadCleaningServices(Result cleaningServiceResult, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (cleaningServiceResult.status == ResultStatus.idle) {
        ref.read(cleaningServiceProvider.notifier).loadCleaningService();
      }
    });
  }
}
