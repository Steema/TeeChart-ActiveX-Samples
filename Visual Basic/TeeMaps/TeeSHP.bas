Attribute VB_Name = "TeeSHP"
Option Explicit

Public Data As New ADODB.Connection
Public rst As New ADODB.Recordset
Public NL

Dim ShapeType As Long
Dim tmpShape As Integer

Private Declare Sub CopyMemory Lib "kernel32" _
Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal _
Length As Long)

Public Type FloatPoint
  X As Double
  Y As Double
End Type
    
    Public Type SHPHeader
        FileCode As Long
        Unused1 As Long
        Unused2 As Long
        Unused3 As Long
        Unused4 As Long
        Unused5 As Long
        FileLength As Long
        Version As Long
        ShapeType As Long
        XMin As Double
        YMin As Double
        XMax As Double
        YMax As Double
        ZMin As Double
        ZMax As Double
        MMin As Double
        MMax As Double
    End Type

    Public Type SHPRecordHeader
        RecordNumber As Long
        RecordLength As Long
    End Type

    Const a = 10
    Const SHP_NULL As Integer = 0
    Const SHP_POINT  As Integer = 1
    Const SHP_POLYLINE  As Integer = 3
    Const SHP_POLYGON  As Integer = 5
    Const SHP_MULTIPOINT  As Integer = 8
    Const SHP_POINTZ  As Integer = 11
    Const SHP_POLYLINEZ  As Integer = 13
    Const SHP_POLYGONZ  As Integer = 15
    Const SHP_MULTIPOINTZ  As Integer = 18
    Const SHP_POINTM  As Integer = 21
    Const SHP_POLYLINEM  As Integer = 23
    Const SHP_POLYGONM  As Integer = 25
    Const SHP_MULTIPOINTM  As Integer = 28
    Const SHP_MULTIPATCH  As Integer = 31
    Const SHPMaxRandom  As Double = 1000000
       
'    Public Type IntegerBytes
'        IntegerByes(3) As Byte
'    End Type
        
'        Function IntegerBytes(Value As Long) As Byte()
'            Dim result(4) As Byte
'            result(0) = CByte(Value)
'            result(1) = CByte(Value / 2 ^ 8)
'            result(2) = CByte(Value / 2 ^ 16)
'            result(3) = CByte(Value / 2 ^ 24)
'            IntegerBytes = result
'        End Function
        
'Example:
'dim bytArr() as Byte
'dim iCtr as Integer
'bytArr = LongToByteArray(90121)
'For iCtr = 0 to Ubound(bytArr)
   'Debug.Print bytArr(iCtr)
'Next
'******************************************

Public Function IntegerBytes(ByVal lng As Long) As Byte()
  Dim ByteArray(0 To 3) As Byte
  CopyMemory ByteArray(0), ByVal VarPtr(lng), Len(lng)
  IntegerBytes = ByteArray
End Function

'Series must be TMapSeries
Public Sub LoadMap(Series As Integer, FileName As String, _
                  ByVal rst2 As ADODB.Recordset, FieldName As String, _
                  FieldValue As String)

    Dim xshpheader As SHPHeader
    Dim xSHPRecordHeader As SHPRecordHeader
    Dim file_length, offset As Long
    Dim t, NumRecords As Integer
    Dim tmpName, fName, fNameX As String
    Dim fnum1, fnum2 As Integer
         
    Form1.TChart1.Series(0).Clear
    Form1.Memo.Text = ""
    tmpName = FileName
    If ExtractFileExt(tmpName) = "" Then
     tmpName = tmpName & ".shp"
    End If
    fName = App.Path & "\maps\" & tmpName
    
    Dim bytes() As Byte
    file_length = FileLen(fName)
    ReDim bytes(1 To file_length)

    fnum1 = FreeFile
    Open fName For Binary As fnum1
    Get fnum1, , xshpheader
       
    VerifySignature xshpheader.FileCode, fName '& ".shp"
    ShowHeader xshpheader
    tmpName = ChangeFileExt(tmpName, ".shx")
    
    fNameX = App.Path & "\maps\" & tmpName
    fnum2 = FreeFile
    Open fNameX For Binary As fnum2
    Get fnum2, , xshpheader
    
    VerifySignature xshpheader.FileCode, fNameX

    If Form1.CDebug.Value Then
        Form1.Memo.Text = Form1.Memo.Text & NL & ""
        Form1.Memo.Text = Form1.Memo.Text & NL & _
        "Real File size: " & file_length
    End If

    NumRecords = ShowHeader(xshpheader)
    Form1.TChart1.Series(Series).Clear
        
    Form1.TChart1.AutoRepaint = False

    For t = 1 To NumRecords
      ReadRecordHeader fnum2, xSHPRecordHeader

     If Form1.CDebug.Value Then
        Form1.Memo.Text = Form1.Memo.Text & NL & _
        "Record Num: " & t & " Offset: " & 2 * xSHPRecordHeader.RecordNumber & _
        "Length: " & xSHPRecordHeader.RecordLength
     End If

      Seek fnum1, (xSHPRecordHeader.RecordNumber * 2) + 1 '+1 not zero indexed
      ReadRecordHeader fnum1, xSHPRecordHeader
      
     If Form1.CDebug.Value Then
        Form1.Memo.Text = Form1.Memo.Text & NL & _
        "Record Num: " & xSHPRecordHeader.RecordNumber
     End If
      
      Get fnum1, , ShapeType

      LoadShape fnum1, Series, FileName, rst2, FieldName, FieldValue
    Next
    Form1.TChart1.AutoRepaint = True
Close 1
Close 2
End Sub

Private Sub VerifySignature(Value As Long, ByVal FileName As String)
  Dim B() As Byte
  B() = IntegerBytes(Value)
  
  If (B(0) <> 0) Or (B(1) <> 0) Or (B(2) <> 39) Or _
     ((B(3) <> 10) And (B(3) <> 13)) Then
        MsgBox "Invalid file: " & FileName
  End If
End Sub

Function ShowHeader(ByRef ASHPHeader As SHPHeader) As Long
 Dim B() As Byte
    B() = IntegerBytes(ASHPHeader.FileLength)
    
    Dim ff As Double
    ShowHeader = B(3) + (B(2) * 256) + (B(1) * 256# * 256#) + (B(0) * 256# * 256# * 256#)

    If Form1.CDebug.Value Then
        Form1.Memo.Text = Form1.Memo.Text & _
        "FileCode: " & ASHPHeader.FileCode & " " & ASHPHeader.FileCode & NL & _
        "Filelength: " & ASHPHeader.FileLength & " " & ASHPHeader.FileLength & NL & _
        "FileSize: " & 2 * ShowHeader
    End If

    ShowHeader = (ShowHeader * 2 - 100) / 8

    If Form1.CDebug.Value Then
        Form1.Memo.Text = Form1.Memo.Text & NL & _
        "NumRecords: " & Str(ShowHeader) & NL & _
        "Version: " & Str(ASHPHeader.Version) & NL & _
        "ShapeType: " & Str(ASHPHeader.ShapeType) & NL & _
        "XMin: " & Str(ASHPHeader.XMin) & NL & _
        "YMin: " & Str(ASHPHeader.YMin) & NL & _
        "XMax: " & Str(ASHPHeader.XMax) & NL & _
        "YMax: " & Str(ASHPHeader.YMax) & NL & _
        "ZMin: " & Str(ASHPHeader.ZMin) & NL & _
        "ZMax: " & Str(ASHPHeader.ZMax) & NL & _
        "MMin: " & Str(ASHPHeader.MMin) & NL & _
        "MMax: " & Str(ASHPHeader.MMax)
    End If
End Function

Function Reverse(ByVal Value As Long) As Long
  Dim B() As Byte
  B() = IntegerBytes(Value)
  Reverse = (B(0) * 256# * 256# * 256#) + (B(1) * 256# * 256#) + (B(2) * 256#) + B(3)
End Function

Private Sub ReadRecordHeader(ByVal fNum As Integer, Header As SHPRecordHeader)
  Get fNum, , Header.RecordNumber
  Get fNum, , Header.RecordLength
  
  Header.RecordNumber = Reverse(Header.RecordNumber)
  Header.RecordLength = Reverse(Header.RecordLength)
End Sub

Private Sub ReadPoints(ByVal fNum As Long, ByVal UpTo As Long, ByRef po As Long, shape As IMapPolygon)
Dim tmpPoints() As FloatPoint
Dim tmpPoint As FloatPoint
Dim i, ff As Integer

    ReDim tmpPoints(UpTo - po - 1)
    Get fNum, , tmpPoints
    For i = 0 To ((UpTo - po) - 1)
      shape.AddXY tmpPoints(i).X, tmpPoints(i).Y
    Next i
    po = UpTo
End Sub

Private Sub LoadShape(ByVal fNum As Integer, Series As Integer, FileName As String, _
                  rst As ADODB.Recordset, FieldName As String, _
                  FieldValue As String)
Dim po As Long
Const MaxNumParts = 10000
Dim Box(4) As Double
Dim NumParts  As Long
Dim NumPoints As Long
Dim Parts(MaxNumParts - 1) As Long
Dim p As Integer
Dim ff As Integer
Dim tmpText As String
Dim tmpZ As Double


    Select Case ShapeType
    Case SHP_POLYLINE
    Case SHP_POLYGON
        Get fNum, , Box(0)
        Get fNum, , Box(1)
        Get fNum, , Box(2)
        Get fNum, , Box(3)
        Get fNum, , NumParts
        Get fNum, , NumPoints
        If Form1.CDebug.Value Then
            Form1.Memo.Text = Form1.Memo.Text & NL & _
            "NumParts: " & NumParts & " NumPoints: " & NumPoints
        End If
        If NumParts > MaxNumParts Then
            MsgBox "Maximum number of parts exceeded: " & NumParts, vbOKOnly
        End If
        For p = 0 To NumParts - 1
            Get fNum, , Parts(p)
        Next p
        If Form1.CDebug.Value Then
          For p = 0 To NumParts - 1
              Form1.Memo.Text = Form1.Memo.Text & NL & Parts(p)
          Next p
        End If
        
        If Form1.Check1.Value Then
        If rst.RecordCount > 0 Then
            
          tmpText = rst.Fields(Form1.EditText.Text)
          
          If FieldValue <> "" Then
             tmpZ = rst.Fields(Form1.EditValue.Text)
          Else
             tmpZ = Rnd * SHPMaxRandom
          End If

          rst.MoveNext
        Else
          tmpText = ""
          tmpZ = Rnd * SHPMaxRandom
        End If
        End If

        po = 0

          For p = 1 To NumParts
           tmpShape = Form1.TChart1.Series(0).asMap.Shapes.Add
           Dim shape As TeeChart.IMapPolygon
           Set shape = Form1.TChart1.Series(0).asMap.Shapes.Polygon(tmpShape)
           
           If tmpZ = 0 Then
             tmpZ = Rnd * SHPMaxRandom
           End If
           
           With shape
             .Closed = ShapeType = SHP_POLYGON
             .Z = tmpZ
             .Text = tmpText
             .Gradient.Visible = True
           End With
           
           If p = NumParts Then
              ReadPoints fNum, NumPoints, po, shape
           Else
              ReadPoints fNum, Parts(p), po, shape
           End If
          Next p
    Case Else
        MsgBox "Invalid ShapeType " & ShapeType
    End Select
End Sub


Public Function ExtractFileExt(ByVal FileName As Variant) As String
' VB6 specific, since it uses InStrRev()
' Returns:
' File extension without the "dot" (unlike the equiv Delphi function)
' Empty string if no extension exists.
' FileName should not contain path info (actually it's ok
' unless the path contains a dot and the filename
' has no extension!
Dim pos As Integer
Dim PrevPos As Integer

pos = InStrRev(FileName, ".") ' locate last dot
If pos = 0 Then 'no dots found
ExtractFileExt = ""
Else
ExtractFileExt = Right(FileName, Len(FileName) - pos)
End If
End Function

Public Function ChangeFileExt(ByVal FileName As String, ByVal NewExtension As String) As String
' uses ExtractFileExt()
' If NewExtension starts with a dot or not it's ok.
' If NewExtension is empty the extension will be removed.
' FileName should not contain path info (actually it's ok
' unless the path contains a dot and the filename
' has no extension!

Dim OldExt As String
Dim sTemp As String

OldExt = ExtractFileExt(FileName)

If Left(NewExtension, 1) = "." Then
'if "dot" exists remove it, var is ByVal so it will not change
NewExtension = Right(NewExtension, Len(NewExtension) - 1)
End If

If OldExt = "" Then ' if file has no extension
NewExtension = "." & NewExtension
End If
sTemp = Left(FileName, Len(FileName) - Len(OldExt)) & NewExtension
If Right(sTemp, 1) = "." Then 'extension was empty, so remove dot
sTemp = Left(sTemp, Len(sTemp) - 1)
End If
ChangeFileExt = sTemp
End Function
