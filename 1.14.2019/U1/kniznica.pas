unit kniznica;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

function mocnina(z:real;exp:integer):real;
function dlzka_r(r:shortstring):integer;
function male(r:shortstring):shortstring;
function velke(r:shortstring):shortstring;
function p_vyskyt(r:shortstring;h:shortstring):integer;  //pocet vyskytov
function kopy(r:shortstring;a,b:integer;bo:boolean):shortstring;  //true(od do), false(od pocet)
function vyskyt(r:shortstring;h:shortstring):integer;

implementation

function mocnina(z:real;exp:integer):real;
var
  i:integer;
  m:real;
begin
  m:=1;
  if exp=0 then
    mocnina:=1;
  for i:=1 to exp do
    m:=m*z;
  mocnina:=m;
end;

function dlzka_r(r:shortstring):integer;
begin
  dlzka_r:=ord(r[0]);
end;

function male(r:shortstring):shortstring;
var
  i:integer;
begin
  for i:=1 to dlzka_r(r) do
    case ord(r[i]) of
      65..90:r[i]:=chr(ord(r[i])+32);
    end;
  male:=r;
end;

function velke(r:shortstring):shortstring;
var
  i:integer;
begin
  for i:=1 to dlzka_r(r) do
    case ord(r[i]) of
      97..122:r[i]:=chr(ord(r[i])-32);
    end;
  velke:=r;
end;

function p_vyskyt(r:shortstring;h:shortstring):integer;
var
  v,i:integer;
begin
  v:=0;
  for i:=1 to dlzka_r(r) do
    if r[i]=h[1] then
      if copy(r,i,dlzka_r(h))=h then
        inc(v);
  p_vyskyt:=v;
end;

function kopy(r:shortstring;a,b:integer;bo:boolean):shortstring;
var
  i:integer;
  k:shortstring;
begin
  k:='';
  if bo then
    for i:=a to b-1 do
      k:=k+r[i];
  if not bo then
    for i:=a to (a+b)-1 do
      k:=k+r[i];
  kopy:=k;
end;

function vyskyt(r:shortstring;h:shortstring):integer;
var
  v,i:integer;
begin
  v:=0;
  for i:=1 to dlzka_r(r) do
    if r[i]=h[1] then
      if copy(r,i,dlzka_r(h))=h then begin
        vyskyt:=i;
        exit;
      end;
  vyskyt:=0;
end;

end.

