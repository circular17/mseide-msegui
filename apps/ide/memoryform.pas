unit memoryform;
{$ifdef FPC}{$mode objfpc}{$h+}{$endif}
interface
uses
 mseglob,mseguiglob,mseapplication,msestat,msemenus,msegui,msegraphics,
 msegraphutils,mseevent,mseclasses,mseforms,msedock,msegrids,msestrings,
 msetypes,msedataedits,mseedit,msegraphedits,msesplitter;

type
 tmemoryfo = class(tdockform)
   grid: tstringgrid;
   tlayouter1: tlayouter;
   memon: tbooleanedit;
   bitwidth: tenumedit;
   cnt: tintegeredit;
   add: tint64edit;
   procedure adent(const sender: TObject);
   procedure drawfixcol(const sender: tcol; const canvas: tcanvas;
                                               var cellinfo: cellinfoty);
   procedure updatelayoutexe(const sender: TObject);
   procedure formshow(const sender: TObject);
   procedure cellsetvalue(const sender: TObject; var avalue: msestring;
                   var accept: Boolean);
  private
   firstadd: card64;
   fhexwidth: int32;
   procedure updatecolwidth();
  public
   procedure refresh;
 end;
var
 memoryfo: tmemoryfo;
implementation
uses
 memoryform_mfm,mseformatstr,msedrawtext,main,msegdbutils,msewidgets;

type
 bitwidthty = (bw_8,bw_16,bw_32,bw_64);

procedure tmemoryfo.adent(const sender: TObject);
begin
 updatelayoutexe(nil);
end;

procedure tmemoryfo.refresh;
var
 linecount: integer;
 int1,int2,int3: integer;
 bytes: bytearty;
 words: wordarty;
 longwords: longwordarty;
 qwords: card64arty;
begin
 add.bitcount:= mainfo.gdb.pointersize*8;
 updatecolwidth();
 if memon.value and isvisible then begin
  firstadd:= add.value and $fffffffffffffff0;
  linecount:= ((add.value + cnt.value + $f)-firstadd) div $10;
  if linecount < 0 then begin
   linecount:= 0;
   cnt.value:= 0;
  end;
  if (linecount > 1000) then begin
   linecount:= 1000;
   cnt.value:= linecount * $10;
  end;
  grid.rowcount:= linecount;
  if mainfo.gdb.cancommand then begin
   case bitwidthty(bitwidth.value) of
    bw_8: begin
     bytes:= nil;
     mainfo.gdb.readmemorybytes(add.value,cnt.value,bytes);
     int3:= -(add.value and $f);
     for int1:= 0 to linecount-1 do begin        //todo: optimize
      for int2:= 0 to 15 do begin
       if (int3 < 0) or (int3 > high(bytes)) then begin
        grid[int2][int1]:= '';
       end
       else begin
        grid[int2][int1]:= hextostrmse(bytes[int3],2);
       end;
       inc(int3);
      end;
     end;
    end;
    bw_16: begin
     words:= nil;
     mainfo.gdb.readmemorywords(add.value,cnt.value div 2,words);
     int3:= -(add.value and $f) div 2;
     for int1:= 0 to linecount-1 do begin        //todo: optimize
      for int2:= 0 to 7 do begin
       if (int3 < 0) or (int3 > high(words)) then begin
        grid[int2][int1]:= '';
       end
       else begin
        grid[int2][int1]:= hextostrmse(words[int3],4);
       end;
       inc(int3);
      end;
     end;
    end;
    bw_32: begin
     longwords:= nil;
     mainfo.gdb.readmemorylongwords(add.value,cnt.value div 4,longwords);
     int3:= -(add.value and $f) div 4;
     for int1:= 0 to linecount-1 do begin        //todo: optimize
      for int2:= 0 to 3 do begin
       if (int3 < 0) or (int3 > high(longwords)) then begin
        grid[int2][int1]:= '';
       end
       else begin
        grid[int2][int1]:= hextostrmse(longwords[int3],8);
       end;
       inc(int3);
      end;
     end;
    end;
    bw_64: begin
     qwords:= nil;
     mainfo.gdb.readmemoryqwords(add.value,cnt.value div 8,qwords);
     int3:= -(add.value and $f) div 8;
     for int1:= 0 to linecount-1 do begin        //todo: optimize
      for int2:= 0 to 1 do begin
       if (int3 < 0) or (int3 > high(qwords)) then begin
        grid[int2][int1]:= '';
       end
       else begin
        grid[int2][int1]:= hextostrmse(qwords[int3],16);
       end;
       inc(int3);
      end;
     end;
    end;
   end;
  end;
  grid.invalidate;
 end
 else begin
  grid.rowcount:= 0;
 end;
end;

procedure tmemoryfo.drawfixcol(const sender: tcol; const canvas: tcanvas;
                                                   var cellinfo: cellinfoty);
begin
 drawtext(canvas,hextostrmse(card64(firstadd+cellinfo.cell.row*16),fhexwidth),
                                                      cellinfo.innerrect);
end;

procedure tmemoryfo.updatecolwidth();
var
 mstr1: msestring;
begin
 if mainfo.gdb.pointersize = 8 then begin
  mstr1:= 'WWWWWWWWWWWWWWWW';
  fhexwidth:= 16;
 end
 else begin
  mstr1:= 'WWWWWWWW';
  fhexwidth:= 8;
 end;
 grid.fixcols[-1].width:= getcanvas.getstringwidth(mstr1,grid.font)+4;
end;

procedure tmemoryfo.updatelayoutexe(const sender: TObject);
var
 int1: integer;
 mstr1: msestring;
begin
 mstr1:= '';
 case bitwidthty(bitwidth.value) of
  bw_8: begin
   mstr1:= 'WW';
   grid.datacols.count:= 16;
   for int1:= 0 to 15 do begin
    grid.fixrows[-1].captions[int1].caption:= msechar(charhex[int1]);
//    grid.datacols[int1].ondataentered:= {$ifdef FPC}@{$endif}celldataentered;
    grid.datacols[int1].onsetvalue:= {$ifdef FPC}@{$endif}cellsetvalue;
   end;
  end;
  bw_16: begin
   mstr1:= 'WWWW';
   grid.datacols.count:= 8;
   for int1:= 0 to 7 do begin
    grid.fixrows[-1].captions[int1].caption:= msechar(charhex[int1*2]);
//    grid.datacols[int1].ondataentered:= {$ifdef FPC}@{$endif}celldataentered;
    grid.datacols[int1].onsetvalue:= {$ifdef FPC}@{$endif}cellsetvalue;
   end;
   add.value:= add.value and not 3;
  end;
  bw_32: begin
   mstr1:= 'WWWWWWWW';
   grid.datacols.count:= 4;
   for int1:= 0 to 3 do begin
    grid.fixrows[-1].captions[int1].caption:= msechar(charhex[int1*4]);
//    grid.datacols[int1].ondataentered:= {$ifdef FPC}@{$endif}celldataentered;
    grid.datacols[int1].onsetvalue:= {$ifdef FPC}@{$endif}cellsetvalue;
   end;
   add.value:= add.value and not 7;
  end;
  bw_64: begin
   mstr1:= 'WWWWWWWWWWWWWWWW';
   grid.datacols.count:= 2;
   for int1:= 0 to 1 do begin
    grid.fixrows[-1].captions[int1].caption:= msechar(charhex[int1*8]);
//    grid.datacols[int1].ondataentered:= {$ifdef FPC}@{$endif}celldataentered;
    grid.datacols[int1].onsetvalue:= {$ifdef FPC}@{$endif}cellsetvalue;
   end;
   add.value:= add.value and not 15;
  end;
 end;
 int1:= getcanvas.getstringwidth(mstr1,grid.font);
 grid.datacols.width:= int1+4;
 updatecolwidth();
 refresh;
end;

procedure tmemoryfo.formshow(const sender: TObject);
begin
 refresh;
end;

procedure tmemoryfo.cellsetvalue(const sender: TObject; var avalue: msestring;
               var accept: Boolean);
var
 val: card64;
 res: gdbresultty;
begin
 if mainfo.gdb.cancommand then begin
  accept:= false;
  val:= strtohex64(ansistring(avalue));
  res:= gdb_error;
  case bitwidthty(bitwidth.value) of
   bw_8: begin
    res:= mainfo.gdb.writememory8(firstadd+grid.row*16+grid.col*8,val);
   end;
   bw_16: begin
    res:= mainfo.gdb.writememory16(firstadd+grid.row*16+grid.col*2,val);
   end;
   bw_32: begin
    res:= mainfo.gdb.writememory32(firstadd+grid.row*16+grid.col*4,val);
   end;
   bw_64: begin
    res:= mainfo.gdb.writememory64(firstadd+grid.row*16+grid.col*8,val);
   end;
  end;
  if res <> gdb_ok then begin
   showerror(msestring(mainfo.gdb.errormessage));
  end;
  refresh;
 end;
end;

end.
