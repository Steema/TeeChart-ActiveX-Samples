VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2018.ocx"
Begin VB.Form Form1 
   Caption         =   "TeeChart Pro -- HotSpot HTML MAPS Example"
   ClientHeight    =   6720
   ClientLeft      =   1500
   ClientTop       =   1335
   ClientWidth     =   6945
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   6720
   ScaleWidth      =   6945
   Begin TeeChart.TChart TChart1 
      Height          =   3075
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   5295
      Base64          =   $"FormHotSpot.frx":0000
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   5520
      Max             =   100
      Min             =   1
      TabIndex        =   11
      Top             =   1860
      Value           =   70
      Width           =   1335
   End
   Begin VB.CheckBox Check1 
      Caption         =   "View &3D"
      Height          =   255
      Left            =   5580
      TabIndex        =   10
      Top             =   3300
      Value           =   1  'Checked
      Width           =   1035
   End
   Begin VB.Frame Frame1 
      Caption         =   "&Bar Style:"
      Height          =   1275
      Left            =   5460
      TabIndex        =   6
      Top             =   60
      Width           =   1455
      Begin VB.OptionButton Option3 
         Caption         =   "&Inv. Pyramid"
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   900
         Width           =   1275
      End
      Begin VB.OptionButton Option2 
         Caption         =   "&Pyramid"
         Height          =   315
         Left            =   120
         TabIndex        =   8
         Top             =   540
         Width           =   1095
      End
      Begin VB.OptionButton Option1 
         Caption         =   "&Rectangle"
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   240
         Value           =   -1  'True
         Width           =   1095
      End
   End
   Begin VB.CommandButton Command3 
      Caption         =   "2) &Save and run HTML browser"
      Height          =   495
      Left            =   2520
      TabIndex        =   5
      Top             =   3240
      Width           =   2775
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Close"
      Height          =   435
      Left            =   5640
      TabIndex        =   4
      Top             =   6180
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "1) &Generate HotSpot MAP !"
      Height          =   495
      Left            =   120
      TabIndex        =   2
      Top             =   3240
      Width           =   2295
   End
   Begin VB.TextBox Text1 
      Height          =   1935
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   1
      Top             =   4080
      Width           =   6735
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   180
      Top             =   6120
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      DefaultExt      =   "htm"
      DialogTitle     =   "Save Chart as HTML"
      FileName        =   "test.htm"
      Filter          =   "*.htm"
      Flags           =   6
   End
   Begin VB.Label Label2 
      Caption         =   "Bar width:"
      Height          =   195
      Left            =   5520
      TabIndex        =   12
      Top             =   1620
      Width           =   975
   End
   Begin VB.Label Label1 
      Caption         =   "HotSpot MAP:"
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   3840
      Width           =   1455
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function ShellExecute Lib _
    "shell32.dll" Alias "ShellExecuteA" _
    (ByVal hwnd As Long, _
    ByVal lpOperation As String, _
    ByVal lpFile As String, _
    ByVal lpParameters As String, _
    ByVal lpDirectory As String, _
    ByVal nShowCmd As Long) As Long
    
Private Sub SaveChartHotSpot(AChart As TChart, ByVal AName As String)
Const vbQuote = """"
Dim tempPath, tempName, tempNameOnly As String, Pos As Integer
Pos = InStr(AName, ".")

If Pos > 0 Then
  tempPath = Left$(AName, Pos - 1)
Else
  tempPath = AName
End If
tempName = tempPath
tempNameOnly = ""
While Right$(tempName, 1) <> "\"
  tempNameOnly = Right$(tempName, 1) + tempNameOnly
  tempName = Left$(tempName, Len(tempName) - 1)
Wend
AChart.Export.SaveToJPEGFile tempPath + ".jpg", False, jpegBestQuality, 95, AChart.Canvas.Width, AChart.Canvas.Height

Open tempPath + ".htm" For Output As #1
  Print #1, "<html>"
  Print #1, "<SCRIPT LANGUAGE=JAVASCRIPT>function RunCode(){alert('hotspot clicked');}</SCRIPT>"
  Print #1, "<body>"
  Print #1, "<H1>Welcome to TeeChart Pro ActiveX !</H1>"
  Print #1, "<H2>Click on a point to see the hot spot area...</H2>"
  Print #1, "<img USEMAP=" + vbQuote + "#MAP1" + vbQuote + " src=" + vbQuote + tempNameOnly + ".jpg" + vbQuote + " border=0>"
  Print #1, GenerateChartHotSpot(AChart, "MAP1")
  Print #1, "</body>"
  Print #1, "</html>"
Close #1

End Sub

Private Function GenerateChartHotSpot(AChart As TChart, ByVal AMapName As String) As String
Const vbQuote = """"
Dim t, tempWidth, tempHeight As Integer
Dim Height3D, Width3D, StartHeightZ, StartWidthZ, ZCount As Integer
Dim SeriesHeight3D, SeriesWidth3D As Integer
Dim result As String

Height3D = TChart1.Aspect.Height3D 'Total Chart Z space Height displacement (pixels)
Width3D = TChart1.Aspect.Width3D 'Total Chart Z space Width displacement (pixels)
ZCount = TChart1.SeriesCount 'Series Count to subdivide Z space
SeriesHeight3D = Height3D / ZCount 'Z space Height of each Series
SeriesWidth3D = Width3D / ZCount 'Z space Width of each Series

result = "<MAP name=" + vbQuote + AMapName + vbQuote + " > " + vbCrLf

For TheSeries = (TChart1.SeriesCount - 1) To 0 Step -1
StartHeightZ = (ZCount - (TheSeries + 1)) * (Height3D / ZCount)
StartWidthZ = (ZCount - (TheSeries + 1)) * (Width3D / ZCount)
With TChart1.Series(TheSeries)
  Select Case .SeriesType
     Case scLine, scPoint, scArea, scBubble, scFastLine, scPolar:
       tempWidth = .asLine.Pointer.HorizontalSize
       tempHeight = .asLine.Pointer.VerticalSize
       For t = 0 To .Count - 1
         X = .CalcXPos(t) + StartWidthZ
         Y = .CalcYPos(t) - StartHeightZ
         result = result + "<AREA shape=" + vbQuote + "poly" + vbQuote + " coords=" + _
                      vbQuote + Str$(X - tempWidth) + "," + Str$(Y - tempHeight) + "," + _
                      Str$(X - tempWidth + SeriesWidth3D) + "," + Str$(Y - tempHeight - SeriesHeight3D) + "," + _
                      Str$(X + tempWidth + SeriesWidth3D) + "," + Str$(Y - tempHeight - SeriesHeight3D) + "," + _
                      Str$(X + tempWidth + SeriesWidth3D) + "," + Str$(Y + tempHeight - SeriesHeight3D) + "," + _
                      Str$(X + tempWidth) + "," + Str$(Y + tempHeight) + "," + _
                      Str$(X - tempWidth) + "," + Str$(Y + tempHeight) + vbQuote + _
                      " HREF=" + vbQuote + "javascript:RunCode();" + vbQuote + ">" + vbCrLf
       Next
    Case scBar:
      tempWidth = .asBar.BarWidth
      For t = 0 To .Count - 1
        tempStartY = .asBar.GetOriginPos(t) - StartHeightZ
        tempEndY = .CalcYPos(t) - StartHeightZ
        X = .CalcXPos(t) + StartWidthZ
        Select Case .asBar.BarStyle
          Case bsPyramid:
             result = result + "<AREA shape=" + vbQuote + "poly" + vbQuote + " coords=" + _
                      vbQuote + Str$(X) + "," + Str$(tempStartY) + "," + _
                      Str$(X + tempWidth) + "," + Str$(tempStartY) + "," + _
                      Str$(X + tempWidth + SeriesWidth3D) + "," + Str$(tempStartY - SeriesHeight3D) + "," + _
                      Str$(X + (tempWidth \ 2)) + "," + Str$(tempEndY) + vbQuote + _
                      " HREF=" + vbQuote + "javascript:RunCode();" + vbQuote + ">" + vbCrLf
          Case bsInvPyramid:
             result = result + "<AREA shape=" + vbQuote + "poly" + vbQuote + " coords=" + _
                      vbQuote + Str$(X) + "," + Str$(tempEndY) + "," + _
                      Str$(X + SeriesWidth3D) + "," + Str$(tempEndY - SeriesHeight3D) + "," + _
                      Str$(X + tempWidth + SeriesWidth3D) + "," + Str$(tempEndY - SeriesHeight3D) + "," + _
                      Str$(X + (tempWidth \ 2)) + "," + Str$(tempStartY) + vbQuote + _
                      " HREF=" + vbQuote + "javascript:RunCode();" + vbQuote + ">" + vbCrLf
          Case Else
             result = result + "<AREA shape=" + vbQuote + "poly" + vbQuote + " coords=" + _
                      vbQuote + Str$(X) + "," + Str$(tempStartY) + "," + _
                      Str$(X + tempWidth) + "," + Str$(tempStartY) + "," + _
                      Str$(X + tempWidth + SeriesWidth3D) + "," + Str$(tempStartY - SeriesHeight3D) + "," + _
                      Str$(X + tempWidth + SeriesWidth3D) + "," + Str$(tempEndY - SeriesHeight3D) + "," + _
                      Str$(X + SeriesWidth3D) + "," + Str$(tempEndY - SeriesHeight3D) + "," + _
                      Str$(X) + "," + Str$(tempEndY) + "," + _
                      vbQuote + _
                      " HREF=" + vbQuote + "javascript:RunCode();" + vbQuote + ">" + vbCrLf
          
        End Select
      Next
  End Select
End With
Next

result = result + "<AREA shape=" + vbQuote + "default" + vbQuote + " nohref>" + vbCrLf + "</MAP>"
GenerateChartHotSpot = result
End Function


Private Sub Check1_Click()
 TChart1.Aspect.View3D = Check1.Value
End Sub

Private Sub Command1_Click()
  Text1.Text = GenerateChartHotSpot(TChart1, "MAP1")
End Sub

Private Sub Command2_Click()
  End
End Sub


Private Sub Command3_Click()
On Error Resume Next ' Set up error handler
CommonDialog1.CancelError = True

CommonDialog1.ShowSave
If Err.Number <> cdlCancel Then
  SaveChartHotSpot TChart1, CommonDialog1.FileName
  ShellExecute Me.hwnd, vbNullString, CommonDialog1.FileName, vbNullString, "", 1
End If
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues (8)
  TChart1.Series(1).FillSampleValues (6)
End Sub


Private Sub HScroll1_Change()
TChart1.Series(0).asBar.BarWidthPercent = HScroll1.Value
End Sub

Private Sub Option1_Click()
 TChart1.Series(0).asBar.BarStyle = bsRectangle
End Sub

Private Sub Option2_Click()
 TChart1.Series(0).asBar.BarStyle = bsPyramid
End Sub

Private Sub Option3_Click()
 TChart1.Series(0).asBar.BarStyle = bsInvPyramid
End Sub



