#include <stdio.h>
#include <wchar.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include "hidapi.h"

#define MAX_STR 255


const unsigned char thinkpad_seq_fnlock_on[] = {0x18, 0x05, 0x01};
const unsigned char thinkpad_seq_fnlock_off[] = {0x18, 0x05, 0x00};


#define HID_VENDOR_ID_THINKPAD              0x17ef
#define HID_DEVICE_ID_THINKPAD_BLUETOOTH    0x6048

int main(int argc, char* argv[]) {
  const unsigned char *sequence;
  hid_device *handle = NULL;
  char *result;
  int res;

  sequence = thinkpad_seq_fnlock_on;
  result = "on";

  if(argc == 2 && strcmp("off", argv[1]) == 0) {
    sequence = thinkpad_seq_fnlock_off;
    result = "off";
  }

  res = hid_init();

  do {
    handle = hid_open(HID_VENDOR_ID_THINKPAD, HID_DEVICE_ID_THINKPAD_BLUETOOTH, NULL);
    res = hid_write(handle, sequence, 3);
    hid_close(handle);
  } while (res < 0);

  printf("Fkeys %s\n", result);

}
