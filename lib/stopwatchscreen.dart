import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stopwatch/app_colors.dart';
import 'package:stopwatch/stopwatchcontroller.dart';

import 'main.dart';

class StopWatchScreen extends StatelessWidget {
  StopWatchScreen({super.key});
  final stopWatchController = Get.put(StopWatchController());

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "StopWatch",
                style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: mq.height * .02,
            ),
            Obx(
              ()=> Center(
                child: Text(
                  '${stopWatchController.digitHours.value}:${stopWatchController.digitMinutes.value}:${stopWatchController.digitSeconds.value}',
                  style:
                      GoogleFonts.poppins(color: AppColors.white, fontSize: 60),
                ),
              ),
            ),
            Container(
              height: mq.height * .4,
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                border: Border.all(color: AppColors.white),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Obx(
                  ()=> ListView.builder(
                    itemCount: stopWatchController.laps.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Lap #${index + 1}',
                              style: GoogleFonts.poppins(
                                  color: AppColors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '${stopWatchController.laps[index]}',
                              style: GoogleFonts.poppins(
                                  color: AppColors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
            SizedBox(
              height: mq.height * .02,
            ), Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Obx(
          ()=> RawMaterialButton(
                          onPressed: () {
                            (!stopWatchController.started.value) ?stopWatchController.startTimer():stopWatchController.stopTimer();

                          },
                          shape: const StadiumBorder(
                            side: BorderSide(color: AppColors.lightBlue),
                          ),
                          child: Text(
                            (!stopWatchController.started.value) ?
                            'Start':'Pause',
                            style: GoogleFonts.poppins(color: AppColors.white),
                          ),

                                            ),
                      ),
                  ),
                  SizedBox(
                    width: mq.width * .008,
                  ),
                  IconButton(
                        onPressed: () {
                          stopWatchController.addLaps();
                        },
                        icon: const Icon(
                          Icons.flag,
                          color: AppColors.white,
                        )),

                  SizedBox(
                    width: mq.width * .008,
                  ),
                   Expanded(
                      child: RawMaterialButton(
                        onPressed: () {
                          stopWatchController.resetTimer();
                          stopWatchController.clearLapsList();
                        },
                        fillColor: Colors.blue,
                        shape: const StadiumBorder(),
                        child: Text(
                          'Reset',
                          style: GoogleFonts.poppins(color: AppColors.white),
                        ),
                      ),
                    ),

                ],
              ),

          ],
        ),
      )),
    );
  }
}
