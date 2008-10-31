unit msefadeedit_mfm;
{$ifdef FPC}{$mode objfpc}{$h+}{$endif}

interface

implementation
uses
 mseclasses,msefadeedit;

const
 objdata: record size: integer; data: array[0..3602] of byte end =
      (size: 3603; data: (
  84,80,70,48,11,116,102,97,100,101,101,100,105,116,102,111,10,102,97,100,
  101,101,100,105,116,102,111,13,111,112,116,105,111,110,115,119,105,100,103,101,
  116,11,13,111,119,95,97,114,114,111,119,102,111,99,117,115,11,111,119,95,
  115,117,98,102,111,99,117,115,17,111,119,95,100,101,115,116,114,111,121,119,
  105,100,103,101,116,115,9,111,119,95,104,105,110,116,111,110,12,111,119,95,
  97,117,116,111,115,99,97,108,101,0,8,98,111,117,110,100,115,95,120,3,
  160,0,8,98,111,117,110,100,115,95,121,3,221,0,9,98,111,117,110,100,
  115,95,99,120,3,152,1,9,98,111,117,110,100,115,95,99,121,3,24,1,
  8,116,97,98,111,114,100,101,114,2,1,7,118,105,115,105,98,108,101,8,
  23,99,111,110,116,97,105,110,101,114,46,111,112,116,105,111,110,115,119,105,
  100,103,101,116,11,13,111,119,95,109,111,117,115,101,102,111,99,117,115,11,
  111,119,95,116,97,98,102,111,99,117,115,13,111,119,95,97,114,114,111,119,
  102,111,99,117,115,11,111,119,95,115,117,98,102,111,99,117,115,19,111,119,
  95,109,111,117,115,101,116,114,97,110,115,112,97,114,101,110,116,17,111,119,
  95,100,101,115,116,114,111,121,119,105,100,103,101,116,115,12,111,119,95,97,
  117,116,111,115,99,97,108,101,0,18,99,111,110,116,97,105,110,101,114,46,
  98,111,117,110,100,115,95,120,2,0,18,99,111,110,116,97,105,110,101,114,
  46,98,111,117,110,100,115,95,121,2,0,19,99,111,110,116,97,105,110,101,
  114,46,98,111,117,110,100,115,95,99,120,3,152,1,19,99,111,110,116,97,
  105,110,101,114,46,98,111,117,110,100,115,95,99,121,3,24,1,21,99,111,
  110,116,97,105,110,101,114,46,102,114,97,109,101,46,100,117,109,109,121,2,
  0,7,111,112,116,105,111,110,115,11,13,102,111,95,99,108,111,115,101,111,
  110,101,115,99,15,102,111,95,97,117,116,111,114,101,97,100,115,116,97,116,
  16,102,111,95,97,117,116,111,119,114,105,116,101,115,116,97,116,10,102,111,
  95,115,97,118,101,112,111,115,12,102,111,95,115,97,118,101,115,116,97,116,
  101,0,8,115,116,97,116,102,105,108,101,7,10,116,115,116,97,116,102,105,
  108,101,49,7,99,97,112,116,105,111,110,6,9,70,97,100,101,32,101,100,
  105,116,8,111,110,99,114,101,97,116,101,7,8,99,114,101,97,116,101,101,
  118,15,109,111,100,117,108,101,99,108,97,115,115,110,97,109,101,6,8,116,
  109,115,101,102,111,114,109,0,11,116,112,105,99,107,119,105,100,103,101,116,
  7,112,111,115,101,100,105,116,13,111,112,116,105,111,110,115,119,105,100,103,
  101,116,11,17,111,119,95,100,101,115,116,114,111,121,119,105,100,103,101,116,
  115,12,111,119,95,97,117,116,111,115,99,97,108,101,0,8,98,111,117,110,
  100,115,95,120,2,8,8,98,111,117,110,100,115,95,121,2,8,9,98,111,
  117,110,100,115,95,99,120,3,138,1,9,98,111,117,110,100,115,95,99,121,
  2,50,12,102,114,97,109,101,46,108,101,118,101,108,105,2,255,19,102,114,
  97,109,101,46,102,114,97,109,101,105,95,98,111,116,116,111,109,2,2,16,
  102,114,97,109,101,46,108,111,99,97,108,112,114,111,112,115,11,10,102,114,
  108,95,108,101,118,101,108,105,12,102,114,108,95,102,105,98,111,116,116,111,
  109,0,11,102,114,97,109,101,46,100,117,109,109,121,2,0,7,97,110,99,
  104,111,114,115,11,7,97,110,95,108,101,102,116,6,97,110,95,116,111,112,
  8,97,110,95,114,105,103,104,116,0,8,116,97,98,111,114,100,101,114,2,
  2,18,111,110,99,108,105,101,110,116,109,111,117,115,101,101,118,101,110,116,
  7,7,109,111,117,115,101,101,118,7,111,110,112,97,105,110,116,7,10,112,
  111,115,112,97,105,110,116,101,118,8,111,110,114,101,115,105,122,101,7,8,
  114,101,115,105,122,101,101,118,16,111,110,103,101,116,99,117,114,115,111,114,
  115,104,97,112,101,7,16,103,101,116,99,117,114,115,111,114,115,104,97,112,
  101,101,118,16,111,110,103,101,116,112,105,99,107,111,98,106,101,99,116,115,
  7,15,103,101,116,112,105,99,107,111,98,106,101,99,116,101,118,13,111,110,
  101,110,100,112,105,99,107,109,111,118,101,7,9,101,110,100,112,105,99,107,
  101,118,13,111,110,112,97,105,110,116,120,111,114,112,105,99,7,10,112,97,
  105,110,116,120,111,116,101,118,0,13,116,115,105,109,112,108,101,119,105,100,
  103,101,116,8,102,97,100,101,100,105,115,112,13,111,112,116,105,111,110,115,
  119,105,100,103,101,116,11,13,111,119,95,109,111,117,115,101,102,111,99,117,
  115,11,111,119,95,116,97,98,102,111,99,117,115,13,111,119,95,97,114,114,
  111,119,102,111,99,117,115,19,111,119,95,109,111,117,115,101,116,114,97,110,
  115,112,97,114,101,110,116,17,111,119,95,100,101,115,116,114,111,121,119,105,
  100,103,101,116,115,12,111,119,95,97,117,116,111,115,99,97,108,101,0,8,
  98,111,117,110,100,115,95,120,2,1,8,98,111,117,110,100,115,95,121,2,
  0,9,98,111,117,110,100,115,95,99,120,3,136,1,9,98,111,117,110,100,
  115,95,99,121,2,40,5,99,111,108,111,114,4,5,0,0,160,10,102,97,
  99,101,46,100,117,109,109,121,2,0,7,97,110,99,104,111,114,115,11,6,
  97,110,95,116,111,112,0,7,118,105,115,105,98,108,101,9,0,0,0,11,
  116,119,105,100,103,101,116,103,114,105,100,4,103,114,105,100,13,111,112,116,
  105,111,110,115,119,105,100,103,101,116,11,13,111,119,95,109,111,117,115,101,
  102,111,99,117,115,11,111,119,95,116,97,98,102,111,99,117,115,13,111,119,
  95,97,114,114,111,119,102,111,99,117,115,17,111,119,95,102,111,99,117,115,
  98,97,99,107,111,110,101,115,99,13,111,119,95,109,111,117,115,101,119,104,
  101,101,108,17,111,119,95,100,101,115,116,114,111,121,119,105,100,103,101,116,
  115,18,111,119,95,102,111,110,116,103,108,121,112,104,104,101,105,103,104,116,
  12,111,119,95,97,117,116,111,115,99,97,108,101,0,8,98,111,117,110,100,
  115,95,120,2,8,8,98,111,117,110,100,115,95,121,2,64,9,98,111,117,
  110,100,115,95,99,120,3,65,1,9,98,111,117,110,100,115,95,99,121,3,
  178,0,11,102,114,97,109,101,46,100,117,109,109,121,2,0,7,97,110,99,
  104,111,114,115,11,7,97,110,95,108,101,102,116,6,97,110,95,116,111,112,
  8,97,110,95,114,105,103,104,116,9,97,110,95,98,111,116,116,111,109,0,
  8,116,97,98,111,114,100,101,114,2,1,11,111,112,116,105,111,110,115,103,
  114,105,100,11,14,111,103,95,114,111,119,100,101,108,101,116,105,110,103,19,
  111,103,95,102,111,99,117,115,99,101,108,108,111,110,101,110,116,101,114,9,
  111,103,95,115,111,114,116,101,100,20,111,103,95,99,111,108,99,104,97,110,
  103,101,111,110,116,97,98,107,101,121,12,111,103,95,97,117,116,111,112,111,
  112,117,112,17,111,103,95,109,111,117,115,101,115,99,114,111,108,108,99,111,
  108,0,14,100,97,116,97,99,111,108,115,46,99,111,117,110,116,2,2,14,
  100,97,116,97,99,111,108,115,46,105,116,101,109,115,14,1,5,119,105,100,
  116,104,2,63,10,119,105,100,103,101,116,110,97,109,101,6,5,112,111,115,
  101,100,0,1,5,119,105,100,116,104,3,252,0,7,111,112,116,105,111,110,
  115,11,7,99,111,95,102,105,108,108,12,99,111,95,115,97,118,101,118,97,
  108,117,101,12,99,111,95,115,97,118,101,115,116,97,116,101,10,99,111,95,
  114,111,119,102,111,110,116,11,99,111,95,114,111,119,99,111,108,111,114,13,
  99,111,95,122,101,98,114,97,99,111,108,111,114,9,99,111,95,110,111,115,
  111,114,116,17,99,111,95,109,111,117,115,101,115,99,114,111,108,108,114,111,
  119,0,8,119,105,100,116,104,109,105,110,2,63,10,119,105,100,103,101,116,
  110,97,109,101,6,7,99,111,108,111,114,101,100,0,0,13,100,97,116,97,
  114,111,119,104,101,105,103,104,116,2,16,13,111,110,114,111,119,115,100,101,
  108,101,116,101,100,7,11,114,111,119,100,101,108,101,116,101,101,118,13,114,
  101,102,102,111,110,116,104,101,105,103,104,116,2,14,0,9,116,114,101,97,
  108,101,100,105,116,5,112,111,115,101,100,13,111,112,116,105,111,110,115,119,
  105,100,103,101,116,11,13,111,119,95,109,111,117,115,101,102,111,99,117,115,
  11,111,119,95,116,97,98,102,111,99,117,115,13,111,119,95,97,114,114,111,
  119,102,111,99,117,115,13,111,119,95,109,111,117,115,101,119,104,101,101,108,
  17,111,119,95,100,101,115,116,114,111,121,119,105,100,103,101,116,115,18,111,
  119,95,102,111,110,116,103,108,121,112,104,104,101,105,103,104,116,0,11,111,
  112,116,105,111,110,115,115,107,105,110,11,19,111,115,107,95,102,114,97,109,
  101,98,117,116,116,111,110,111,110,108,121,0,8,98,111,117,110,100,115,95,
  120,2,0,8,98,111,117,110,100,115,95,121,2,0,9,98,111,117,110,100,
  115,95,99,120,2,63,9,98,111,117,110,100,115,95,99,121,2,16,12,102,
  114,97,109,101,46,108,101,118,101,108,111,2,0,17,102,114,97,109,101,46,
  99,111,108,111,114,99,108,105,101,110,116,4,3,0,0,128,16,102,114,97,
  109,101,46,108,111,99,97,108,112,114,111,112,115,11,10,102,114,108,95,108,
  101,118,101,108,111,10,102,114,108,95,108,101,118,101,108,105,15,102,114,108,
  95,99,111,108,111,114,99,108,105,101,110,116,0,11,102,114,97,109,101,46,
  100,117,109,109,121,2,0,8,116,97,98,111,114,100,101,114,2,1,7,118,
  105,115,105,98,108,101,8,13,111,110,100,97,116,97,101,110,116,101,114,101,
  100,7,13,100,97,116,97,101,110,116,101,116,101,114,101,118,10,102,111,114,
  109,97,116,101,100,105,116,6,5,48,46,48,48,48,10,102,111,114,109,97,
  116,100,105,115,112,6,5,48,46,48,48,48,13,114,101,102,102,111,110,116,
  104,101,105,103,104,116,2,14,2,109,105,5,0,0,0,0,0,0,0,0,
  0,0,2,109,97,5,0,0,0,0,0,0,0,128,255,63,0,0,10,116,
  99,111,108,111,114,101,100,105,116,7,99,111,108,111,114,101,100,11,111,112,
  116,105,111,110,115,115,107,105,110,11,19,111,115,107,95,102,114,97,109,101,
  98,117,116,116,111,110,111,110,108,121,0,8,98,111,117,110,100,115,95,120,
  2,64,8,98,111,117,110,100,115,95,121,2,0,9,98,111,117,110,100,115,
  95,99,120,3,252,0,9,98,111,117,110,100,115,95,99,121,2,16,12,102,
  114,97,109,101,46,108,101,118,101,108,111,2,0,17,102,114,97,109,101,46,
  99,111,108,111,114,99,108,105,101,110,116,4,3,0,0,128,16,102,114,97,
  109,101,46,108,111,99,97,108,112,114,111,112,115,11,10,102,114,108,95,108,
  101,118,101,108,111,10,102,114,108,95,108,101,118,101,108,105,15,102,114,108,
  95,99,111,108,111,114,99,108,105,101,110,116,0,18,102,114,97,109,101,46,
  98,117,116,116,111,110,46,99,111,108,111,114,4,5,0,0,144,25,102,114,
  97,109,101,46,98,117,116,116,111,110,101,108,108,105,112,115,101,46,99,111,
  108,111,114,4,5,0,0,144,27,102,114,97,109,101,46,98,117,116,116,111,
  110,101,108,108,105,112,115,101,46,105,109,97,103,101,110,114,2,17,11,102,
  114,97,109,101,46,100,117,109,109,121,2,0,8,116,97,98,111,114,100,101,
  114,2,2,7,118,105,115,105,98,108,101,8,13,111,110,100,97,116,97,101,
  110,116,101,114,101,100,7,13,100,97,116,97,101,110,116,101,116,101,114,101,
  118,12,118,97,108,117,101,100,101,102,97,117,108,116,4,3,0,0,144,16,
  100,114,111,112,100,111,119,110,46,111,112,116,105,111,110,115,11,16,100,101,
  111,95,97,117,116,111,100,114,111,112,100,111,119,110,15,100,101,111,95,107,
  101,121,100,114,111,112,100,111,119,110,0,13,114,101,102,102,111,110,116,104,
  101,105,103,104,116,2,14,0,0,0,13,116,115,105,109,112,108,101,119,105,
  100,103,101,116,8,102,97,100,101,118,101,114,116,13,111,112,116,105,111,110,
  115,119,105,100,103,101,116,11,19,111,119,95,109,111,117,115,101,116,114,97,
  110,115,112,97,114,101,110,116,17,111,119,95,100,101,115,116,114,111,121,119,
  105,100,103,101,116,115,12,111,119,95,97,117,116,111,115,99,97,108,101,0,
  8,98,111,117,110,100,115,95,120,3,80,1,8,98,111,117,110,100,115,95,
  121,2,64,9,98,111,117,110,100,115,95,99,120,2,66,9,98,111,117,110,
  100,115,95,99,121,3,178,0,5,99,111,108,111,114,4,5,0,0,160,12,
  102,114,97,109,101,46,108,101,118,101,108,105,2,255,16,102,114,97,109,101,
  46,108,111,99,97,108,112,114,111,112,115,11,10,102,114,108,95,108,101,118,
  101,108,105,0,11,102,114,97,109,101,46,100,117,109,109,121,2,0,19,102,
  97,99,101,46,102,97,100,101,95,100,105,114,101,99,116,105,111,110,7,7,
  103,100,95,100,111,119,110,15,102,97,99,101,46,108,111,99,97,108,112,114,
  111,112,115,11,15,102,97,108,95,102,97,100,105,114,101,99,116,105,111,110,
  0,10,102,97,99,101,46,100,117,109,109,121,2,0,7,97,110,99,104,111,
  114,115,11,6,97,110,95,116,111,112,8,97,110,95,114,105,103,104,116,9,
  97,110,95,98,111,116,116,111,109,0,8,116,97,98,111,114,100,101,114,2,
  3,7,118,105,115,105,98,108,101,9,0,0,7,116,98,117,116,116,111,110,
  8,116,98,117,116,116,111,110,49,8,98,111,117,110,100,115,95,120,3,7,
  1,8,98,111,117,110,100,115,95,121,3,248,0,9,98,111,117,110,100,115,
  95,99,120,2,66,9,98,111,117,110,100,115,95,99,121,2,28,7,97,110,
  99,104,111,114,115,11,8,97,110,95,114,105,103,104,116,9,97,110,95,98,
  111,116,116,111,109,0,8,116,97,98,111,114,100,101,114,2,4,5,115,116,
  97,116,101,11,10,97,115,95,100,101,102,97,117,108,116,15,97,115,95,108,
  111,99,97,108,100,101,102,97,117,108,116,15,97,115,95,108,111,99,97,108,
  99,97,112,116,105,111,110,0,7,99,97,112,116,105,111,110,6,2,79,75,
  11,109,111,100,97,108,114,101,115,117,108,116,7,5,109,114,95,111,107,0,
  0,7,116,98,117,116,116,111,110,8,116,98,117,116,116,111,110,50,8,98,
  111,117,110,100,115,95,120,3,81,1,8,98,111,117,110,100,115,95,121,3,
  248,0,9,98,111,117,110,100,115,95,99,120,2,65,9,98,111,117,110,100,
  115,95,99,121,2,28,7,97,110,99,104,111,114,115,11,8,97,110,95,114,
  105,103,104,116,9,97,110,95,98,111,116,116,111,109,0,5,115,116,97,116,
  101,11,15,97,115,95,108,111,99,97,108,99,97,112,116,105,111,110,0,7,
  99,97,112,116,105,111,110,6,6,67,97,110,99,101,108,11,109,111,100,97,
  108,114,101,115,117,108,116,7,11,109,114,95,99,97,110,99,108,111,115,101,
  0,0,9,116,115,116,97,116,102,105,108,101,10,116,115,116,97,116,102,105,
  108,101,49,8,102,105,108,101,110,97,109,101,6,14,102,97,100,101,101,100,
  105,116,111,114,46,115,116,97,7,111,112,116,105,111,110,115,11,10,115,102,
  111,95,109,101,109,111,114,121,17,115,102,111,95,97,99,116,105,118,97,116,
  111,114,114,101,97,100,18,115,102,111,95,97,99,116,105,118,97,116,111,114,
  119,114,105,116,101,0,4,108,101,102,116,2,96,3,116,111,112,3,136,0,
  0,0,0)
 );

initialization
 registerobjectdata(@objdata,tfadeeditfo,'');
end.
