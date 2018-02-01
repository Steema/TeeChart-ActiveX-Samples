Attribute VB_Name = "Module1"
'{**********************************************}
'{   TeeMaps                                    }
'{   Copyright (c) 2003-2014 by David Berneda   }
'{**********************************************}
' module TeeSHP;

type
  TSHPHeader=packed record
    FileCode : Integer;
    Unused1  : Integer;
    Unused2  : Integer;
    Unused3  : Integer;
    Unused4  : Integer;
    Unused5  : Integer;
    FileLength : Integer;
    Version    : Integer;  // 1000
    ShapeType  : Integer;
    XMin       : Double;
    YMin       : Double;
    XMax       : Double;
    YMax       : Double;
    ZMin       : Double;
    ZMax       : Double;
    MMin       : Double;  // Measured
    MMax       : Double;
  end;

  TSHPRecordHeader=packed record
    RecordNumber : Integer;
    RecordLength : Integer;
  end;

const
  SHP_NULL       = 0;
  SHP_POINT      = 1;
  SHP_POLYLINE   = 3;
  SHP_POLYGON    = 5;
  SHP_MULTIPOINT = 8;
  SHP_POINTZ     = 11;
  SHP_POLYLINEZ  = 13;
  SHP_POLYGONZ   = 15;
  SHP_MULTIPOINTZ = 18;
  SHP_POINTM     = 21;
  SHP_POLYLINEM  = 23;
  SHP_POLYGONM   = 25;
  SHP_MULTIPOINTM = 28;
  SHP_MULTIPATCH = 31;

procedure LoadMap( Series:TMapSeries; const FileName:String;
                   Table:TDataSet=nil; const FieldName:String='';
                   const FieldValue:String='';
                   Debug:TStrings=nil);

Const TeeSHPMaxRandom=1000000;

implementation

uses
  {$IFDEF CLR}
  Variants,
  {$ENDIF}
  SysUtils;

type
  {$IFDEF CLR}
  IntegerBytes=Array[0..3] of Byte;
  {$ELSE}
  TIntegerBytes=Array[0..3] of Byte;
  {$ENDIF}

{$IFDEF CLR}
function TIntegerBytes(Value:Integer):IntegerBytes;
begin
  result[0]:=Byte(Value);
  result[1]:=Byte(Value shr 8);
  result[2]:=Byte(Value shr 16);
  result[3]:=Byte(Value shr 24);
(*
  result[0]:=Value mod 255;
  result[1]:=(Value div 256) mod 255;
  result[2]:=(Value div 65536) mod 255;
  result[3]:=(Value div (256*65536)) mod 255;
  *)
end;

procedure ReadSHPHeader(f:TStream; var Header:TSHPHeader);
begin
  with Header do
  begin
    f.ReadBuffer(FileCode);
    f.ReadBuffer(Unused1);
    f.ReadBuffer(Unused2);
    f.ReadBuffer(Unused3);
    f.ReadBuffer(Unused4);
    f.ReadBuffer(Unused5);
    f.ReadBuffer(FileLength);
    f.ReadBuffer(Version);  // 1000
    f.ReadBuffer(ShapeType);
    f.ReadBuffer(XMin);
    f.ReadBuffer(YMin);
    f.ReadBuffer(XMax);
    f.ReadBuffer(YMax);
    f.ReadBuffer(ZMin);
    f.ReadBuffer(ZMax);
    f.ReadBuffer(MMin);  // Measured
    f.ReadBuffer(MMax);
  end;
end;
{$ENDIF}

procedure LoadMap(Series:TMapSeries; const FileName:String;
                  Table:TDataSet=nil; const FieldName:String='';
                  const FieldValue:String='';
                  Debug:TStrings=nil);

  Procedure AddDebug(const S:String);
  begin
    if Assigned(Debug) then Debug.Add(S);
  end;

  Function BytesToStr(Value:Integer):String;
  var B : {$IFNDEF CLR}TIntegerBytes{$ELSE}IntegerBytes{$ENDIF};
  begin
    B:=TIntegerBytes(Value);
    result:=IntToStr(B[0])+' '+IntToStr(B[1])+' '+IntToStr(B[2])+' '+IntToStr(B[3]);
  end;

  procedure VerifySignature(Value:Integer; const FileName:String);
  var B : {$IFNDEF CLR}TIntegerBytes{$ELSE}IntegerBytes{$ENDIF};
  begin
    B:=TIntegerBytes(Value);
    if (B[0]<>0) or (B[1]<>0) or (B[2]<>$27) or
       ( (B[3]<>$0A) and (B[3]<>$0D) ) then
          raise Exception.Create('Invalid file: '+FileName);
  end;

  Function ShowHeader(const SHPHeader:TSHPHeader):Integer;
  var B : {$IFNDEF CLR}TIntegerBytes{$ELSE}IntegerBytes{$ENDIF};
  begin
    B:=TIntegerBytes(SHPHeader.FileLength);
    result:=B[3] + (B[2] * 256) + (B[1]*256*256) + (B[0]* 256 * 256 * 256);

    if Assigned(Debug) then
    begin
      AddDebug('FileCode: '+IntToStr(SHPHeader.FileCode)+' '+BytesToStr(SHPHeader.FileCode));
      AddDebug('Filelength: '+IntToStr(SHPHeader.FileLength)+' '+BytesToStr(SHPHeader.FileLength));
      AddDebug('FileSize: '+IntToStr(2*result));
    end;

    result:=(result*2 - 100) div 8;

    if Assigned(Debug) then
    begin
      AddDebug('NumRecords: '+IntToStr(result));
      AddDebug('Version: '+IntToStr(SHPHeader.Version));
      AddDebug('ShapeType: '+IntToStr(SHPHeader.ShapeType));
      AddDebug('XMin: '+FloatToStr(SHPHeader.XMin));
      AddDebug('YMin: '+FloatToStr(SHPHeader.YMin));
      AddDebug('XMax: '+FloatToStr(SHPHeader.XMax));
      AddDebug('YMax: '+FloatToStr(SHPHeader.YMax));
      AddDebug('ZMin: '+FloatToStr(SHPHeader.ZMin));
      AddDebug('ZMax: '+FloatToStr(SHPHeader.ZMax));
      AddDebug('MMin: '+FloatToStr(SHPHeader.MMin));
      AddDebug('MMax: '+FloatToStr(SHPHeader.MMax));
    end;
  end;

  Function Reverse(Value:Integer):Integer;
  var B : {$IFNDEF CLR}TIntegerBytes{$ELSE}IntegerBytes{$ENDIF};
  begin
    B:=TIntegerBytes(Value);
    result:=(B[0]*256*256*256)+(B[1]*256*256)+(B[2]*256)+B[3];
  end;

  procedure ReadRecordHeader(s:TStream; var Header:TSHPRecordHeader);
  begin
    {$IFDEF CLR}
    s.ReadBuffer(Header.RecordNumber);
    s.ReadBuffer(Header.RecordLength);
    {$ELSE}
    s.ReadBuffer(Header,SizeOf(TSHPRecordHeader));
    {$ENDIF}
    Header.RecordNumber:=Reverse(Header.RecordNumber);
    Header.RecordLength:=Reverse(Header.RecordLength);
  end;

Var
  ShapeType : Integer;
  f         : TFileStream;
  tmpPoints : Array of TFloatPoint;

  procedure LoadShape;
  var tmpShape : TTeePolygon;
      po       : Integer;

    procedure ReadPoints(UpTo:Integer);
    var {$IFDEF CLR}
        tmpPoint : TFloatPoint;
        {$ELSE}
        t         : Integer;
        {$ENDIF}
    begin
      tmpShape.Points.BeginUpdate;
      try
        {$IFNDEF CLR}
        SetLength(tmpPoints,UpTo-po);
        f.Read(tmpPoints[0],(UpTo-po)*SizeOf(TFloatPoint));
        for t:=0 to UpTo-po-1 do
            tmpShape.Points.AddXY(tmpPoints[t].X,tmpPoints[t].Y);
        po:=UpTo;
        {$ELSE}

        repeat
           {$IFDEF CLR}
           f.Read(tmpPoint.X);
           f.Read(tmpPoint.Y);
           {$ELSE}
           f.Read(tmpPoint,SizeOf(TFloatPoint));
           {$ENDIF}
           tmpShape.AddXY(tmpPoint);
           Inc(po);
        until po=UpTo;
        {$ENDIF}
      finally
        tmpShape.Points.EndUpdate;
      end;
    end;

  const
       MaxNumParts = 10000;
  var Box : Array[0..3] of Double;
      NumParts,
      NumPoints: Integer;
      Parts : Array[0..MaxNumParts-1] of Integer;
      p : Integer;
      tmpText:String;
      tmpZ : Double;
  begin
    case ShapeType of
      SHP_POLYLINE,
SHP_POLYGON:
       begin
         {$IFDEF CLR}
         f.ReadBuffer(Box[0]);
         f.ReadBuffer(Box[1]);
         f.ReadBuffer(Box[2]);
         f.ReadBuffer(Box[3]);
         f.ReadBuffer(NumParts);
         f.ReadBuffer(NumPoints);
         {$ELSE}
         f.ReadBuffer(Box,SizeOf(Box));
         f.ReadBuffer(NumParts,SizeOf(NumParts));
         f.ReadBuffer(NumPoints,SizeOf(NumPoints));
         {$ENDIF}

         if Assigned(Debug) then
            AddDebug('NumParts: '+IntToStr(NumParts)+' NumPoints: '+IntToStr(NumPoints));

         If NumParts > MaxNumParts Then
            raise Exception.Create('Maximum number of parts exceeded: '+IntToStr(NumParts));

         {$IFDEF CLR}
         for p:=0 to NumParts-1 do
             f.ReadBuffer(Parts[p]);
         {$ELSE}
         f.ReadBuffer(Parts,SizeOf(Integer)*NumParts);
         {$ENDIF}

         if Assigned(Debug) then
            for p:=0 to NumParts-1 do
                AddDebug(IntToStr(Parts[p]));

         If Assigned(Table) And Table.Active Then
         begin
           tmpText:=Table.FieldValues[FieldName];

           if FieldValue<>'' then
              tmpZ:=Table.FieldValues[FieldValue]
           Else
              tmpZ:=Random(TeeSHPMaxRandom);

           Table.Next;
         End
         Else
         begin
           tmpText:='';
           tmpZ:=Random(TeeSHPMaxRandom);
         end;

         po:=0;

         for p:=1 to NumParts do
         begin
           tmpShape:=Series.Shapes.Add;

           with tmpShape do
           begin
             Closed:=ShapeType=SHP_POLYGON;
             Z:=tmpZ;
             Text:=tmpText;
             //Gradient.Visible:=True;
           end;

           If p = NumParts Then
              ReadPoints (NumPoints)
           Else
              ReadPoints(Parts[p]);
         end;
       end;
    Else
        raise Exception.Create('Invalid ShapeType '+IntToStr(ShapeType));
    end;
  end;

var fx: TFileStream;
    SHPHeader : TSHPHeader;
    SHPRecordHeader : TSHPRecordHeader;
    t, NumRecords : Integer;
    tmpName : String;
begin
  Series.Clear;

  tmpName:=FileName;
  if ExtractFileExt(tmpName)='' then
     tmpName:=tmpName+'.shp';

  f:=TFileStream.Create(tmpName,fmOpenRead);
  try
    if Assigned(Debug) then
    begin
      Debug.Clear;
      Debug.BeginUpdate;
    end;

    if Assigned(Debug) then
       AddDebug('Real File size: '+IntToStr(f.Size));

    f.Position:=0;
    {$IFDEF CLR}
    ReadSHPHeader(f,SHPHeader);
    {$ELSE}
    f.ReadBuffer(SHPHeader,SizeOf(TSHPHeader));
    {$ENDIF}

    VerifySignature(SHPHeader.FileCode,FileName+'.shp');

    ShowHeader(SHPHeader);

    tmpName:=ChangeFileExt(FileName,'.shx');

    fx:=TFileStream.Create( tmpName,fmOpenRead);
    try
      fx.Position:=0;
      {$IFDEF CLR}
      ReadSHPHeader(fx,SHPHeader);
      {$ELSE}
      fx.ReadBuffer(SHPHeader,SizeOf(TSHPHeader));
      {$ENDIF}

      VerifySignature(SHPHeader.FileCode,tmpName);

      if Assigned(Debug) then
      begin
        AddDebug('');
        AddDebug('Real File size: '+IntToStr(fx.Size));
      end;

      NumRecords:=ShowHeader(SHPHeader);

      Series.Clear;
      Series.BeginUpdate;
      Series.ParentChart.AutoRepaint:=False;

      for t:=1 to NumRecords do
      begin
        ReadRecordHeader(fx,SHPRecordHeader);

        if Assigned(Debug) then
        begin
          AddDebug('');
          AddDebug('Record Num: '+IntToStr(t)+' Offset: '+IntToStr(2*SHPRecordHeader.RecordNumber)+
             ' Length: '+IntToStr(SHPRecordHeader.RecordLength));
        end;

        f.Position:=2*SHPRecordHeader.RecordNumber;
        ReadRecordHeader(f,SHPRecordHeader);

        if Assigned(Debug) then
           AddDebug('Record Num: '+IntToStr(SHPRecordHeader.RecordNumber));

        {$IFDEF CLR}
        f.Read(ShapeType);
        {$ELSE}
        f.Read(ShapeType,SizeOf(ShapeType));
        {$ENDIF}

        LoadShape;
      end;

      if Assigned(Debug) then
         Debug.EndUpdate;

      Series.EndUpdate;
      Series.ParentChart.AutoRepaint:=True;
    finally
      fx.Free;
    end;
  finally
    f.Free;
    tmpPoints:=nil;
  end;
end;

end.
