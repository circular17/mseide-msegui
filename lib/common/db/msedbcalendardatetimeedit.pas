{ MSEgui Copyright (c) 1999-2017 by Martin Schreiber

    See the file COPYING.MSE, included in this distribution,
    for details about the copyright.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
}

unit msedbcalendardatetimeedit;

{$ifdef FPC}{$mode objfpc}{$h+}{$endif}

interface
uses
 mdb,classes,mclasses,msecalendardatetimeedit,msedbedit,msedb,msegui,
 msewidgetgrid,mseevent,msegraphics,
 msedatalist,mseeditglob,msegrids,msemenus,mseguiglob,mseedit,msedataedits,
 msestrings,msetypes;

type
 tdbcalendardatetimeedit = class(tcustomcalendardatetimeedit,idbeditfieldlink,
                                      ireccontrol)
  private
   fdatalink: teditwidgetdatalink;
   procedure setdatalink(const avalue: teditwidgetdatalink);
  protected
   procedure defineproperties(filer: tfiler); override;
   function nullcheckneeded(const newfocus: twidget): boolean; override;
   procedure griddatasourcechanged; override;
   function getgriddatasource: tdatasource;
   function createdatalist(const sender: twidgetcol): tdatalist; override;
   procedure modified; override;
   procedure doshortcut(var info: keyeventinfoty;
                                      const sender: twidget); override;
//   function getoptionsedit: optionseditty; override;
//   procedure dochange; override;
//   procedure doenter; override;
//   procedure doexit; override;
   function getrowdatapo(const arow: integer): pointer; override;
    //idbeditfieldlink
   procedure valuetofield;
   procedure fieldtovalue;
   procedure getfieldtypes(var afieldtypes: fieldtypesty);
   function getfieldlink: tcustomeditwidgetdatalink;
    //ireccontrol
   procedure recchanged;
  public
   constructor create(aowner: tcomponent); override;
   destructor destroy; override;
  published
   property datalink: teditwidgetdatalink read fdatalink write setdatalink;
   property dropdown;
   property valuemin {stored false};
   property valuemax {stored false};
   property formatedit;
   property formatdisp;
   property kind;
   property options;
   property onsetvalue;
 end;

implementation
type
 teditwidgetdatalink1 = class(teditwidgetdatalink);

{ tdbcalendardatetimeedit }

constructor tdbcalendardatetimeedit.create(aowner: tcomponent);
begin
 fdatalink:= teditwidgetdatalink.Create(idbeditfieldlink(self));
 inherited;
end;

destructor tdbcalendardatetimeedit.destroy;
begin
 inherited;
 fdatalink.free;
end;

procedure tdbcalendardatetimeedit.modified;
begin
 fdatalink.modified;
 inherited;
end;

procedure tdbcalendardatetimeedit.doshortcut(var info: keyeventinfoty;
               const sender: twidget);
begin
 fdatalink.doshortcut(info,sender);
 if not (es_processed in info.eventstate) then begin
  inherited;
 end;
end;
{
function tdbcalendardatetimeedit.getoptionsedit: optionseditty;
begin
 result:= inherited getoptionsedit;
 fdatalink.updateoptionsedit(result);
end;
}
procedure tdbcalendardatetimeedit.valuetofield;
begin
 if value = emptydatetime then begin
  fdatalink.field.clear;
 end
 else begin
  fdatalink.field.asdatetime:= value;
 end;
end;

procedure tdbcalendardatetimeedit.fieldtovalue;
var
 da1: tdatetime;
begin
 if fdatalink.field.isnull then begin
  value:= 0;
 end
 else begin
  da1:= fdatalink.field.asdatetime;
  value:= da1;
 end;
end;

function tdbcalendardatetimeedit.getrowdatapo(const arow: integer): pointer;
begin
 if fgriddatalink <> nil then begin
  result:= tgriddatalink(fgriddatalink).getdatetimebuffer(
                                                fdatalink.field,arow);
 end
 else begin
  result:= nil;
 end;
end;

function tdbcalendardatetimeedit.createdatalist(const sender: twidgetcol): tdatalist;
begin
 result:= nil;
end;

procedure tdbcalendardatetimeedit.griddatasourcechanged;
begin
 fdatalink.griddatasourcechanged;
end;

function tdbcalendardatetimeedit.getgriddatasource: tdatasource;
begin
 result:= tcustomdbwidgetgrid(fgridintf.getcol.grid).datalink.datasource;
end;

procedure tdbcalendardatetimeedit.getfieldtypes(var afieldtypes: fieldtypesty);
begin
 afieldtypes:= datetimefields;
end;

function tdbcalendardatetimeedit.nullcheckneeded(const newfocus: twidget): boolean;
begin
 result:= inherited nullcheckneeded(newfocus);
 fdatalink.nullcheckneeded(result);
end;

procedure tdbcalendardatetimeedit.setdatalink(const avalue: teditwidgetdatalink);
begin
 fdatalink.assign(avalue);
end;

procedure tdbcalendardatetimeedit.defineproperties(filer: tfiler);
begin
 inherited;
 fdatalink.fixupproperties(filer);  //move values to datalink
end;

procedure tdbcalendardatetimeedit.recchanged;
begin
 fdatalink.recordchanged(nil);
end;
{
procedure tdbcalendardatetimeedit.dochange;
begin
 fdatalink.datachanged;
 inherited;
end;
}
function tdbcalendardatetimeedit.getfieldlink: tcustomeditwidgetdatalink;
begin
 result:= fdatalink;
end;
{
procedure tdbcalendardatetimeedit.doenter;
begin
 teditwidgetdatalink1(fdatalink).doenter(self);
 inherited;
end;

procedure tdbcalendardatetimeedit.doexit;
begin
 teditwidgetdatalink1(fdatalink).doexit(self);
 inherited;
end;
}
end.
