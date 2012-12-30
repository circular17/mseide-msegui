unit msestringenter_mfm;
{$ifdef FPC}{$mode objfpc}{$h+}{$endif}

interface

implementation
uses
 mseclasses,msestringenter;

const
 objdata: record size: integer; data: array[0..2017] of byte end =
      (size: 2018; data: (
  84,80,70,48,14,116,115,116,114,105,110,103,101,110,116,101,114,102,111,13,
  115,116,114,105,110,103,101,110,116,101,114,102,111,13,111,112,116,105,111,110,
  115,119,105,100,103,101,116,11,13,111,119,95,97,114,114,111,119,102,111,99,
  117,115,15,111,119,95,97,114,114,111,119,102,111,99,117,115,105,110,16,111,
  119,95,97,114,114,111,119,102,111,99,117,115,111,117,116,11,111,119,95,115,
  117,98,102,111,99,117,115,17,111,119,95,100,101,115,116,114,111,121,119,105,
  100,103,101,116,115,9,111,119,95,104,105,110,116,111,110,0,7,118,105,115,
  105,98,108,101,8,8,98,111,117,110,100,115,95,120,3,84,1,8,98,111,
  117,110,100,115,95,121,3,67,1,9,98,111,117,110,100,115,95,99,120,3,
  87,1,9,98,111,117,110,100,115,95,99,121,2,88,12,98,111,117,110,100,
  115,95,99,120,109,105,110,3,200,0,12,98,111,117,110,100,115,95,99,121,
  109,105,110,2,70,23,99,111,110,116,97,105,110,101,114,46,111,112,116,105,
  111,110,115,119,105,100,103,101,116,11,13,111,119,95,109,111,117,115,101,102,
  111,99,117,115,11,111,119,95,116,97,98,102,111,99,117,115,13,111,119,95,
  97,114,114,111,119,102,111,99,117,115,15,111,119,95,97,114,114,111,119,102,
  111,99,117,115,105,110,16,111,119,95,97,114,114,111,119,102,111,99,117,115,
  111,117,116,11,111,119,95,115,117,98,102,111,99,117,115,19,111,119,95,109,
  111,117,115,101,116,114,97,110,115,112,97,114,101,110,116,17,111,119,95,100,
  101,115,116,114,111,121,119,105,100,103,101,116,115,0,29,99,111,110,116,97,
  105,110,101,114,46,102,114,97,109,101,46,122,111,111,109,119,105,100,116,104,
  115,116,101,112,2,1,30,99,111,110,116,97,105,110,101,114,46,102,114,97,
  109,101,46,122,111,111,109,104,101,105,103,104,116,115,116,101,112,2,1,16,
  99,111,110,116,97,105,110,101,114,46,98,111,117,110,100,115,1,2,0,2,
  0,3,87,1,2,88,0,7,111,112,116,105,111,110,115,11,17,102,111,95,
  115,99,114,101,101,110,99,101,110,116,101,114,101,100,13,102,111,95,99,108,
  111,115,101,111,110,101,115,99,17,102,111,95,108,111,99,97,108,115,104,111,
  114,116,99,117,116,115,15,102,111,95,97,117,116,111,114,101,97,100,115,116,
  97,116,16,102,111,95,97,117,116,111,119,114,105,116,101,115,116,97,116,0,
  15,109,111,100,117,108,101,99,108,97,115,115,110,97,109,101,6,8,116,109,
  115,101,102,111,114,109,0,11,116,115,116,114,105,110,103,101,100,105,116,5,
  118,97,108,117,101,13,111,112,116,105,111,110,115,119,105,100,103,101,116,11,
  13,111,119,95,109,111,117,115,101,102,111,99,117,115,11,111,119,95,116,97,
  98,102,111,99,117,115,13,111,119,95,97,114,114,111,119,102,111,99,117,115,
  15,111,119,95,97,114,114,111,119,102,111,99,117,115,105,110,16,111,119,95,
  97,114,114,111,119,102,111,99,117,115,111,117,116,17,111,119,95,100,101,115,
  116,114,111,121,119,105,100,103,101,116,115,0,11,102,114,97,109,101,46,100,
  117,109,109,121,2,0,8,98,111,117,110,100,115,95,120,2,8,8,98,111,
  117,110,100,115,95,121,2,62,9,98,111,117,110,100,115,95,99,120,3,210,
  0,7,97,110,99,104,111,114,115,11,7,97,110,95,108,101,102,116,8,97,
  110,95,114,105,103,104,116,9,97,110,95,98,111,116,116,111,109,0,11,111,
  112,116,105,111,110,115,101,100,105,116,11,12,111,101,95,117,110,100,111,111,
  110,101,115,99,13,111,101,95,99,108,111,115,101,113,117,101,114,121,16,111,
  101,95,99,104,101,99,107,109,114,99,97,110,99,101,108,14,111,101,95,115,
  104,105,102,116,114,101,116,117,114,110,20,111,101,95,114,101,115,101,116,115,
  101,108,101,99,116,111,110,101,120,105,116,15,111,101,95,101,120,105,116,111,
  110,99,117,114,115,111,114,13,111,101,95,101,110,100,111,110,101,110,116,101,
  114,13,111,101,95,97,117,116,111,115,101,108,101,99,116,25,111,101,95,97,
  117,116,111,115,101,108,101,99,116,111,110,102,105,114,115,116,99,108,105,99,
  107,12,111,101,95,115,97,118,101,118,97,108,117,101,12,111,101,95,115,97,
  118,101,115,116,97,116,101,0,13,114,101,102,102,111,110,116,104,101,105,103,
  104,116,2,14,0,0,6,116,108,97,98,101,108,3,108,97,98,14,111,112,
  116,105,111,110,115,119,105,100,103,101,116,49,11,14,111,119,49,95,97,117,
  116,111,104,101,105,103,104,116,0,13,111,112,116,105,111,110,115,119,105,100,
  103,101,116,11,13,111,119,95,109,111,117,115,101,119,104,101,101,108,17,111,
  119,95,100,101,115,116,114,111,121,119,105,100,103,101,116,115,0,8,116,97,
  98,111,114,100,101,114,2,3,8,98,111,117,110,100,115,95,120,2,7,8,
  98,111,117,110,100,115,95,121,2,41,9,98,111,117,110,100,115,95,99,120,
  3,73,1,9,98,111,117,110,100,115,95,99,121,2,14,7,97,110,99,104,
  111,114,115,11,7,97,110,95,108,101,102,116,6,97,110,95,116,111,112,8,
  97,110,95,114,105,103,104,116,9,97,110,95,98,111,116,116,111,109,0,7,
  99,97,112,116,105,111,110,6,3,108,97,98,9,116,101,120,116,102,108,97,
  103,115,11,12,116,102,95,121,99,101,110,116,101,114,101,100,12,116,102,95,
  119,111,114,100,98,114,101,97,107,0,0,0,7,116,98,117,116,116,111,110,
  2,111,107,14,111,112,116,105,111,110,115,119,105,100,103,101,116,49,11,19,
  111,119,49,95,102,111,110,116,103,108,121,112,104,104,101,105,103,104,116,13,
  111,119,49,95,97,117,116,111,115,99,97,108,101,0,13,111,112,116,105,111,
  110,115,119,105,100,103,101,116,11,11,111,119,95,116,97,98,102,111,99,117,
  115,13,111,119,95,97,114,114,111,119,102,111,99,117,115,15,111,119,95,97,
  114,114,111,119,102,111,99,117,115,105,110,16,111,119,95,97,114,114,111,119,
  102,111,99,117,115,111,117,116,17,111,119,95,100,101,115,116,114,111,121,119,
  105,100,103,101,116,115,0,8,116,97,98,111,114,100,101,114,2,1,8,98,
  111,117,110,100,115,95,120,3,230,0,8,98,111,117,110,100,115,95,121,2,
  62,9,98,111,117,110,100,115,95,99,120,2,50,9,98,111,117,110,100,115,
  95,99,121,2,20,7,97,110,99,104,111,114,115,11,8,97,110,95,114,105,
  103,104,116,9,97,110,95,98,111,116,116,111,109,0,5,115,116,97,116,101,
  11,10,97,115,95,100,101,102,97,117,108,116,15,97,115,95,108,111,99,97,
  108,100,101,102,97,117,108,116,15,97,115,95,108,111,99,97,108,99,97,112,
  116,105,111,110,0,7,99,97,112,116,105,111,110,6,3,38,79,75,11,109,
  111,100,97,108,114,101,115,117,108,116,7,5,109,114,95,111,107,13,114,101,
  102,102,111,110,116,104,101,105,103,104,116,2,14,0,0,7,116,98,117,116,
  116,111,110,6,99,97,110,99,101,108,14,111,112,116,105,111,110,115,119,105,
  100,103,101,116,49,11,19,111,119,49,95,102,111,110,116,103,108,121,112,104,
  104,101,105,103,104,116,13,111,119,49,95,97,117,116,111,115,99,97,108,101,
  0,13,111,112,116,105,111,110,115,119,105,100,103,101,116,11,11,111,119,95,
  116,97,98,102,111,99,117,115,13,111,119,95,97,114,114,111,119,102,111,99,
  117,115,15,111,119,95,97,114,114,111,119,102,111,99,117,115,105,110,16,111,
  119,95,97,114,114,111,119,102,111,99,117,115,111,117,116,17,111,119,95,100,
  101,115,116,114,111,121,119,105,100,103,101,116,115,0,8,116,97,98,111,114,
  100,101,114,2,2,8,98,111,117,110,100,115,95,120,3,30,1,8,98,111,
  117,110,100,115,95,121,2,62,9,98,111,117,110,100,115,95,99,120,2,50,
  9,98,111,117,110,100,115,95,99,121,2,20,7,97,110,99,104,111,114,115,
  11,8,97,110,95,114,105,103,104,116,9,97,110,95,98,111,116,116,111,109,
  0,5,115,116,97,116,101,11,15,97,115,95,108,111,99,97,108,99,97,112,
  116,105,111,110,0,7,99,97,112,116,105,111,110,6,7,38,67,97,110,99,
  101,108,11,109,111,100,97,108,114,101,115,117,108,116,7,9,109,114,95,99,
  97,110,99,101,108,13,114,101,102,102,111,110,116,104,101,105,103,104,116,2,
  14,0,0,16,116,115,116,114,105,110,103,99,111,110,116,97,105,110,101,114,
  1,99,12,115,116,114,105,110,103,115,46,100,97,116,97,1,6,8,80,65,
  83,83,87,79,82,68,6,14,69,110,116,101,114,32,112,97,115,115,119,111,
  114,100,6,17,73,110,118,97,108,105,100,32,112,97,115,115,119,111,114,100,
  33,0,4,108,101,102,116,2,64,3,116,111,112,2,8,0,0,0)
 );

initialization
 registerobjectdata(@objdata,tstringenterfo,'');
end.
