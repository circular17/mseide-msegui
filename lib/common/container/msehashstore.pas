{ MSEgui Copyright (c) 2016 by Martin Schreiber

    See the file COPYING.MSE, included in this distribution,
    for details about the copyright.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
}
unit msehashstore;
{$ifdef FPC}{$mode objfpc}{$h+}{$goto on}{$endif}
interface
uses
 msehash,msetypes;

const
 maxidentvector = 200;
 
type
 identarty = card32arty;
 identvecty = record
  high: integer;
  d: array[0..maxidentvector] of identty;
 end;
 
 elementheaderty = record
  path: identty; //key, sum of names to root
  name: identty;
  parent: hashoffsetty; //offset in data array
  parentlevel: int32;      //max = maxidentvector-1
  refcount: int32;
 end;
 
 elementdataty = record
  header: elementheaderty;
  data: record
  end;
 end;
 pelementdataty = ^elementdataty;
 elementhashdataty = record
  header: hashheaderty;
  data: elementdataty;
 end;
 pelementhashdataty = ^elementhashdataty;

 thashstore = class(thashdatalist)
  protected
   function find(const aele: elementdataty): pelementhashdataty;
   function hashkey(const akey): hashvaluety override;
   function checkkey(const akey; const aitemdata): boolean override;
  public
   constructor create(const datasize: int32);
   function add(const idents: identvecty): pointer;
   function find(const idents: identvecty): pointer;
   procedure delete(const idents: identvecty);
 end;

implementation

{ thashstore }

constructor thashstore.create(const datasize: int32);
begin
 inherited create(sizeof(elementdataty)+datasize);
end;

function thashstore.add(const idents: identvecty): pointer;
var
 p1,pe: pidentty;
 ele: elementdataty;
 p2: pelementhashdataty;
 off1: hashoffsetty;
begin
 result:= nil;
 if idents.high >= 0 then begin
  ele.header.path:= 0;
  ele.header.parent:= 0;
  ele.header.parentlevel:= 0;
  ele.header.refcount:= 0;
  p1:= @idents.d;
  pe:= p1+idents.high;
  off1:= 0; //parent
  while p1 <= pe do begin
   ele.header.path:= ele.header.path+p1^;
   ele.header.name:= p1^;
   p2:= find(ele);
   if p2 = nil then begin
    p2:= pointer(internaladdhash(ele.header.path));
    p2^.data.header:= ele.header;
    if off1 <> 0 then begin
     inc(pelementhashdataty(fdata+off1)^.data.header.refcount);
    end;
   end;
   inc(ele.header.parentlevel);
   ele.header.parent:= getdataoffset(p2);
   off1:= p2-fdata;
   inc(p1);
  end;
  inc(p2^.data.header.refcount);
  result:= @p2^.data.data;
 end;
end;

function thashstore.find(const aele: elementdataty): pelementhashdataty;
var
 p1: pelementhashdataty;
 uint1: ptruint;
begin
 result:= nil;
 p1:= fdata;
 if count > 0 then begin
  uint1:= fhashtable[aele.header.path and fmask];
  while uint1 <> 0 do begin
   p1:= pelementhashdataty(fdata + uint1);
   with p1^ do begin
    if (data.header.path = aele.header.path) and 
                   (data.header.parent = aele.header.parent) then begin
     result:= p1;
     break;
    end;
   end;
   uint1:= p1^.header.nexthash;
  end;
 end;
end;

function thashstore.hashkey(const akey): hashvaluety;
begin
 result:= elementdataty(akey).header.path;
end;

function thashstore.checkkey(const akey; const aitemdata): boolean;
begin
 result:= elementdataty(akey).header.path =
                   elementdataty(aitemdata).header.path;
end;

function thashstore.find(const idents: identvecty): pointer;
var
 c1: card32;
 p1,p2,pe,ps: pidentty;
 ph1,ph2: pelementhashdataty;
 uint1: ptruint;
label
 nextlab;
begin
 result:= nil;
 if (count > 0) and (idents.high >= 0) then begin
  ps:= @idents.d;
  p1:= ps;
  pe:= p1+idents.high;
  c1:= 0;
  while p1 <= pe do begin
   c1:= c1 + p1^;
   inc(p1);
  end;
  uint1:= fhashtable[c1 and fmask];
  while uint1 <> 0 do begin
   ph1:= pelementhashdataty(fdata + uint1);
   with ph1^ do begin
    if (data.header.path = c1) and 
                   (data.header.parentlevel = idents.high) then begin
     ph2:= ph1;
     p2:= pe;
     while p2 >= ps do begin
      if p2^ <> ph2^.data.header.name then begin
       goto nextlab;
      end;
      ph2:= fdata+ph2^.data.header.parent;
      dec(p2);
     end;
     result:= @ph1^.data.data;
     exit;
    end;
   end;
nextlab:
   uint1:= ph1^.header.nexthash;
  end;
 end;
end;

procedure thashstore.delete(const idents: identvecty);
var
 p1: pelementhashdataty;
begin
 p1:= find(idents);
 if p1 <> nil then begin
  p1:= pointer(p1)-sizeof(elementhashdataty);
  while true do begin
   dec(p1^.data.header.refcount);
   if p1^.data.header.refcount > 0 then begin
    break;
   end;
   internaldeleteitem(phashdataty(pointer(p1))); //memory still valid
   if p1^.data.header.parent = 0 then begin
    break;
   end;
   p1:= fdata+p1^.data.header.parent;
  end;
 end;
end;

end.
