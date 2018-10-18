
#include "svcall.h"


// éteint la LED
static void led_off(){
	_svc_call(SVC_LED_OFF,0,0);
}


