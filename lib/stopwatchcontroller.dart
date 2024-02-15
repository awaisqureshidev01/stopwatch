import 'dart:async';

import 'package:get/get.dart';

class StopWatchController extends GetxController{
  RxInt seconds = 0.obs;
  RxInt minutes = 0.obs;
  RxInt hours = 0.obs;
  RxString digitSeconds = "00".obs;
  RxString digitMinutes = "00".obs;
  RxString digitHours = "00".obs;
  Rx<Timer?> timer = Rx<Timer?>(null);
  RxBool started = false.obs;
  RxList laps = [].obs;

  void stopTimer(){
    timer.value!.cancel();
    started.value = false;
  }

  void resetTimer(){
    timer.value!.cancel();
    seconds.value = 0;
    minutes.value = 0;
    hours.value = 0;
    digitSeconds.value = "00";
    digitMinutes.value = "00";
    digitHours.value = "00";
    started.value=false;
  }

  void addLaps(){
    String lapValue = "${digitHours.value}:${digitMinutes.value}:${digitSeconds.value}";
    laps.add(lapValue);
  }
  void clearLapsList(){
    laps.clear();
  }

  void startTimer(){
    started.value = true;
    timer.value =Timer.periodic(const Duration(seconds: 1), (timer) {
      int localSeconds = seconds.value +1;
      int localMinutes = minutes.value;
      int localHours = hours.value;
      if(localSeconds > 59){
        if(localMinutes > 59){
          localHours++;
          localMinutes = 0;
        } else{
          localMinutes++;
          localSeconds =0;

        }
      }
      seconds.value = localSeconds;
      minutes.value = localMinutes;
      hours.value = localHours;
      digitSeconds.value = (seconds.value >= 10) ? "${seconds.value}" :"0${seconds.value}";
      digitMinutes.value = (minutes.value >= 10) ? "${minutes.value}" :"0${minutes.value}";
      digitHours.value = (hours.value >= 10) ? "${hours.value}" :"0${hours.value}";
    });



  }

}