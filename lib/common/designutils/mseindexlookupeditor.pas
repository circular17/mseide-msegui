unit mseindexlookupeditor;
{$ifdef FPC}{$mode objfpc}{$h+}{$endif}
interface
uses
 msetypes,mseglob,mseguiglob,mseguiintf,mseapplication,msestat,msemenus,msegui,
 msegraphics,msegraphutils,mseevent,mseclasses,msewidgets,mseforms,msesplitter,
 msesimplewidgets,msedataedits,mseedit,mseificomp,mseificompglob,mseifiglob,
 msestatfile,msestream,msestrings,sysutils,msegrids,msewidgetgrid,msegraphedits,
 msescrollbar,msebitmap;
type
 tmseindexlookupeditorfo = class(tmseform)
   tsplitter1: tsplitter;
   tbutton2: tbutton;
   tbutton1: tbutton;
   tspacer2: tspacer;
   grid: twidgetgrid;
   indexed: tintegeredit;
   tstockglyphdatabutton1: tstockglyphdatabutton;
   icondi: tdataicon;
   statfile1: tstatfile;
   procedure rowdatacha(const sender: tcustomgrid; const acell: gridcoordty);
   procedure createexe(const sender: TObject);
   procedure closequexe(const sender: tcustommseform;
                   var amodalresult: modalresultty);
   procedure selectexe(const sender: TObject);
   procedure iconpaintexe(const sender: tcustomintegergraphdataedit;
                   const acanvas: tcanvas; const avalue: Integer;
                   const arow: Integer);
  protected
   findexlist: pmsestring;
   fimagelist: timagelist;
   ffacelist: tfacelist;
   fok: pboolean;
  public
   constructor create(var indexlist: msestring; const imagelist: timagelist;
                          const facelist: tfacelist; out ok: boolean);
 end;

function editlookupindex(var indexlist: msestring; const imagelist: timagelist;
                                            const facelist: tfacelist): boolean;

implementation
uses
 mseindexlookupeditor_mfm,mseimageselectorform,msefaceselectorform;

function editlookupindex(var indexlist: msestring;
               const imagelist: timagelist; const facelist: tfacelist): boolean;
begin
 tmseindexlookupeditorfo.create(indexlist,imagelist,facelist,result);
end;

{ tmseindexlookupeditorfo }

constructor tmseindexlookupeditorfo.create(var indexlist: msestring;
               const imagelist: timagelist; const facelist: tfacelist;
                                                           out ok: boolean);
begin
 findexlist:= @indexlist;
 fimagelist:= imagelist;
 ffacelist:= facelist;
 fok:= @ok;
 inherited create(nil);
end;

procedure tmseindexlookupeditorfo.rowdatacha(const sender: tcustomgrid;
               const acell: gridcoordty);
begin
 icondi[acell.row]:= indexed[acell.row];
end;

procedure tmseindexlookupeditorfo.createexe(const sender: TObject);
var
 i1: int32;
 po1: pint16;
begin
 grid.beginupdate();
 icondi.imagelist:= fimagelist;
 if fimagelist = nil then begin
  grid[1].visible:= false;
  grid[2].visible:= false;
 end;
 grid.rowcount:= length(findexlist^);
 po1:= pointer(findexlist^);
 for i1:= 0 to grid.rowhigh do begin
  indexed[i1]:= po1[i1];
 end;
 grid.endupdate();
end;

procedure tmseindexlookupeditorfo.closequexe(const sender: tcustommseform;
               var amodalresult: modalresultty);
var
 i1: int32;
 po1: pint16;
begin
 fok^:= amodalresult = mr_ok;
 if fok^ then begin
  setlength(findexlist^,grid.rowcount);
  po1:= pointer(findexlist^);
  for i1:= 0 to grid.rowhigh do begin
   po1[i1]:= indexed[i1];
  end;
 end;
end;

procedure tmseindexlookupeditorfo.selectexe(const sender: TObject);
var
 i1: int32;
begin
 i1:= indexed.value;
 if fimagelist <> nil then begin
  timageselectorfo.create(nil,fimagelist,i1);
 end
 else begin
  if ffacelist <> nil then begin
   tfaceselectorfo.create(nil,ffacelist,i1);
  end;
 end;
 indexed.value:= i1;
end;

procedure tmseindexlookupeditorfo.iconpaintexe(
              const sender: tcustomintegergraphdataedit; const acanvas: tcanvas;
               const avalue: Integer; const arow: Integer);
begin
 if ffacelist <> nil then begin
  ffacelist.paint(acanvas,avalue,sender.clientrect);
 end;
end;

end.
