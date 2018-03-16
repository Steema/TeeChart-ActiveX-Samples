VERSION 5.00
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2018.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form Form1 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   Caption         =   "MAP Series Demo"
   ClientHeight    =   8115
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   11385
   Icon            =   "TestSHP.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   8115
   ScaleWidth      =   11385
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.CheckBox Check3 
      Caption         =   "Use palette"
      Height          =   255
      Left            =   5160
      TabIndex        =   25
      Top             =   600
      Width           =   1455
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   375
      Left            =   0
      TabIndex        =   24
      Top             =   7740
      Width           =   11385
      _ExtentX        =   20082
      _ExtentY        =   661
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
   End
   Begin TeeChart.TeeCommander TeeCommander1 
      Height          =   465
      Left            =   0
      OleObjectBlob   =   "TestSHP.frx":1242
      TabIndex        =   1
      Top             =   0
      Width           =   1500
   End
   Begin TeeChart.TChart TChart1 
      Height          =   6570
      Left            =   2340
      TabIndex        =   0
      Top             =   1035
      Width           =   9015
      Base64          =   $"TestSHP.frx":128D
   End
   Begin VB.CheckBox CView2 
      Height          =   330
      Left            =   2565
      Style           =   1  'Graphical
      TabIndex        =   22
      Top             =   540
      Width           =   465
   End
   Begin VB.CheckBox CView 
      Caption         =   "3D"
      Height          =   330
      Left            =   2070
      Style           =   1  'Graphical
      TabIndex        =   21
      Top             =   540
      Width           =   465
   End
   Begin VB.CommandButton ZoomOut 
      Caption         =   "Zoom Out"
      Height          =   285
      Left            =   990
      TabIndex        =   20
      Top             =   585
      Width           =   960
   End
   Begin VB.CommandButton ZoomIn 
      Caption         =   "Zoom In"
      Height          =   285
      Left            =   0
      TabIndex        =   19
      Top             =   585
      Width           =   960
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "TestSHP.frx":329B
      Left            =   2340
      List            =   "TestSHP.frx":32A5
      TabIndex        =   18
      Text            =   "Combo1"
      Top             =   90
      Width           =   1680
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   6720
      Left            =   0
      TabIndex        =   16
      TabStop         =   0   'False
      Top             =   1035
      Width           =   2310
      _ExtentX        =   4075
      _ExtentY        =   11853
      _Version        =   393216
      Style           =   1
      TabHeight       =   520
      TabCaption(0)   =   "Map "
      TabPicture(0)   =   "TestSHP.frx":32C3
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "List1"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).Control(1)=   "SeriesTextSource1"
      Tab(0).Control(1).Enabled=   0   'False
      Tab(0).ControlCount=   2
      TabCaption(1)   =   "Cities "
      TabPicture(1)   =   "TestSHP.frx":32DF
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "ListCities"
      Tab(1).ControlCount=   1
      TabCaption(2)   =   "Debug"
      TabPicture(2)   =   "TestSHP.frx":32FB
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "Memo"
      Tab(2).ControlCount=   1
      Begin TeeChart.SeriesTextSource SeriesTextSource1 
         Left            =   2700
         OleObjectBlob   =   "TestSHP.frx":3317
         Top             =   6480
      End
      Begin VB.ListBox List1 
         Height          =   6135
         Left            =   90
         Style           =   1  'Checkbox
         TabIndex        =   15
         Top             =   405
         Width           =   2130
      End
      Begin VB.TextBox Memo 
         Height          =   6270
         Left            =   -74910
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   23
         Top             =   360
         Width           =   2130
      End
      Begin VB.ListBox ListCities 
         Height          =   6300
         Left            =   -74955
         TabIndex        =   17
         Top             =   360
         Width           =   2175
      End
   End
   Begin VB.CheckBox CBCities 
      Caption         =   "Cities"
      Height          =   285
      Left            =   10485
      TabIndex        =   14
      Top             =   585
      Value           =   1  'Checked
      Width           =   735
   End
   Begin VB.CheckBox CDebug 
      Caption         =   "Debug"
      Height          =   285
      Left            =   9450
      TabIndex        =   13
      Top             =   585
      Width           =   915
   End
   Begin VB.CheckBox CBLegend 
      Caption         =   "Legend"
      Height          =   285
      Left            =   8505
      TabIndex        =   12
      Top             =   585
      Width           =   870
   End
   Begin VB.CheckBox CBMarks 
      Caption         =   "Marks"
      Height          =   285
      Left            =   7695
      TabIndex        =   11
      Top             =   585
      Width           =   735
   End
   Begin VB.CheckBox CBLight 
      Caption         =   "Light"
      Height          =   285
      Left            =   6930
      TabIndex        =   10
      Top             =   585
      Width           =   735
   End
   Begin VB.CheckBox CBOutLine 
      Caption         =   "OutLine"
      Height          =   285
      Left            =   3960
      TabIndex        =   9
      Top             =   585
      Value           =   1  'Checked
      Width           =   915
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Tools"
      Height          =   285
      Left            =   3150
      TabIndex        =   8
      Top             =   585
      Width           =   735
   End
   Begin VB.TextBox EditValue 
      Height          =   285
      Left            =   9855
      TabIndex        =   7
      Text            =   "POP_CNTRY"
      Top             =   90
      Width           =   1410
   End
   Begin VB.TextBox EditText 
      Height          =   285
      Left            =   7290
      TabIndex        =   6
      Text            =   "CNTRY_NAME"
      Top             =   90
      Width           =   1410
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Use DBF Table"
      Height          =   240
      Left            =   4320
      TabIndex        =   3
      Top             =   135
      Width           =   1500
   End
   Begin VB.CommandButton BLoad 
      Caption         =   "Load"
      Height          =   330
      Left            =   1575
      TabIndex        =   2
      Top             =   90
      Width           =   690
   End
   Begin VB.Line Line1 
      X1              =   0
      X2              =   11385
      Y1              =   990
      Y2              =   990
   End
   Begin VB.Label Label2 
      Caption         =   "Value Field :"
      Height          =   195
      Left            =   8865
      TabIndex        =   5
      Top             =   135
      Width           =   915
   End
   Begin VB.Label Label1 
      Caption         =   "Text Field :"
      Height          =   195
      Left            =   6255
      TabIndex        =   4
      Top             =   135
      Width           =   915
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Old As Integer
Dim OldIndex As Double
Dim DecimalSeparator As Integer
Dim List_Selecting As Boolean

Private Sub BLoad_Click()
Dim tmp As String
Dim Old As String
  Screen.MousePointer = vbHourglass
  If Memo.Visible Then
    tmp = Memo.Text
  Else
    tmp = ""
  End If
      
  Check3.Value = 1
  
  If Check1.Value Then   ' if checked then Use Table is checked
    TryLoadTable
    LoadMap 0, Combo1.Text, rst, EditText.Text, EditValue.Text
    rst.Close
    Data.Close
  Else
    LoadMap 0, Combo1.Text, rst, "", ""
  End If

  ' When loading the USA States map, set axes to zoom on 50 USA States
  If Combo1.ListIndex = 1 Then
      TChart1.Axis.Left.SetMinMax 24, 50
      TChart1.Axis.Bottom.SetMinMax -125, -67
      With SeriesTextSource1
        .Close
        .FileName = App.Path & "\Maps\" & DecimalSeparator & "USACities.txt"
        .Series = TChart1.Series(1)
        .FieldSeparator = ";"
        .HeaderLines = 0
        .AddField "Text", 1
        .AddField "X", 23
        .AddField "Y", 3
        .Active = True
      End With
  Else
      TChart1.Axis.Left.SetMinMax -90, 90
      TChart1.Axis.Bottom.SetMinMax -180, 180
      With SeriesTextSource1
        .Close
        .FileName = App.Path & "\Maps\" & DecimalSeparator & "WorldCities.txt"
        .Series = TChart1.Series(1)
        .FieldSeparator = ";"
        .HeaderLines = 0
        .AddField "Text", 1
        .AddField "X", 2
        .AddField "Y", 3
        .Active = True
    End With
  End If

  ' We need to check the decimal separator character
  If TChart1.Environment.DecimalSeparator = "," Then
    DecimalSeparator = 1
  Else
    DecimalSeparator = 2
  End If
  SeriesTextSource1.Open
  LoadCityList
  With TChart1
    .Series(1).asPoint.Pointer.HorizontalSize = 2
    .Series(1).asPoint.Pointer.VerticalSize = 2
    .Tools.Items(8).Active = False
    With .Series(0).asMap
      .UseColorRange = (Rnd * 100) < 50
      If .UseColorRange Then
        .Shapes.Polygon(0).Gradient.Visible = True
        .StartColor = vbWhite
        .MidColor = vbBlue
        .EndColor = vbRed
      Else
        .PaletteStyle = psRainbow
      End If
    End With
  End With
  List_Selecting = True
  List1.Visible = False
  frmSplash.Show
  DoEvents
  FillShapes
  Unload frmSplash
  List_Selecting = False
  List1.Visible = True
  List1_Click
  Screen.MousePointer = vbDefault
End Sub

Private Sub CBCities_Click()
  TChart1.Series(1).Active = CBCities.Value
  If Not CBCities.Value Then
    TChart1.Tools.Items(8).Active = False
    SSTab1.TabIndex = 0
  Else
    SSTab1.TabIndex = 2
    LoadCityList
  End If
End Sub



Private Sub CBLegend_Click()
With TChart1
  .Legend.Visible = CBLegend.Value
End With
End Sub

Private Sub CBLight_Click()
    TChart1.Tools.Items(5).Active = CBLight.Value
End Sub

Private Sub CBMarks_Click()
    TChart1.Series(1).Marks.Font.Size = 8
    TChart1.Series(1).Marks.Visible = CBMarks.Value
End Sub

Private Sub CBOutLine_Click()
  'Now Hover property is used
  'CBOutLineColor.Enabled = CBOutLine.Value
  TChart1.Hover.Visible = CBOutLine.Value
End Sub

Private Sub CBOutLineColor_Click()

End Sub

Private Sub CDebug_Click()
    ' Show or hide the "debug" tab
    SSTab1.TabVisible(2) = CDebug.Value
    Memo.Visible = CDebug.Value
    If SSTab1.TabVisible(2) Then
        SSTab1.TabIndex = 2
    End If
End Sub

Private Sub Check2_Click()
    TChart1.Tools.Active = Check2.Value
End Sub

Private Sub Check3_Click()
With TChart1
  .Series(0).asMap.UsePalette = Check3.Value
  If .Series(0).asMap.UsePalette Then
    .Series(0).asMap.UsePaletteMin = True
    .Series(0).asMap.UsePalette = True
    .Series(0).asMap.PaletteStyle = psRainbow
    .Series(0).asMap.PaletteMin = 0
    .Series(0).asMap.PaletteSteps = 21
    .Series(0).asMap.PaletteStep = TeeSHPMaxRandom / 20
  Else
    .Series(0).asMap.UsePaletteMin = False
    .Series(0).asMap.UseColorRange = False
  End If
End With
End Sub

Private Sub Combo1_Change()
Select Case Combo1.TabIndex
    Case 0
        EditText.Text = "CNTRY_NAME"
        EditValue.Text = "POP_CNTRY"
    Case 1
        EditText.Text = "STATE"
        EditValue.Text = ""
End Select
End Sub

Private Sub CView_Click()
  TChart1.Aspect.View3D = CView.Value
  CView2.Enabled = CView.Value
  If Not CView.Value Then
     CView2.Value = False
  End If
  TChart1.Tools.Items(6).Active = CView2.Value
End Sub

Private Sub CView2_Click()
  TChart1.Aspect.Orthogonal = Not CView2.Value
  TChart1.Tools.Items(6).Active = CView2.Value
End Sub

Private Sub Form_Load()
 ' Setup toolbar buttons, axes properties, and
 ' add all map shapes onto listbox
  Old = -1
  StatusBar1.SimpleText = ""
  SSTab1.TabIndex = 0
  SSTab1.TabVisible(2) = False
  Memo.Visible = False
  NL = Chr$(13) & Chr$(10)
  OldIndex = 999999
  List_Selecting = False
  TeeCommander1.Chart = TChart1
  TChart1.Axis.Bottom.Labels.Style = talValue
  
  ' We need to check the decimal separator character
  If TChart1.Environment.DecimalSeparator = "," Then
    DecimalSeparator = 1
  Else
    DecimalSeparator = 2
  End If
     
  TeeDefaultCapacity = 100
  With TeeCommander1
    .Button3D.Hide
    .ButtonDepth.Hide
    .ButtonZoom.Hide
    .ButtonRotate.Hide
    .ButtonMove.Hide
    .ButtonSave.Hide
    .ButtonNormal.Hide
    .RepositionControls
  End With

  With TChart1
    .Axis.FastCalc = True ' bypass range checking to improve speed
    .Axis.Left.Minimum = -90
    .Axis.Left.Maximum = 90

    .Axis.Left.Labels.ValueFormat = "0" & Chr(186)
    .Axis.Bottom.Labels.ValueFormat = "0" & Chr(186)

    .Axis.Left.GridPen.Style = psSolid
    Dim olecolor1 As OLE_COLOR
    
    .Axis.Left.GridPen.Style = psSmallDots
    .Axis.Bottom.GridPen.Style = psSmallDots
    
    List_Selecting = True
    List1.Visible = False
    frmSplash.Show
    DoEvents
    FillShapes
    Unload frmSplash
    List_Selecting = False
    List1.Visible = True
    .Aspect.Perspective = 175
    LoadCityList
  End With
End Sub

Function ExtractFilePath(ByVal S As String) As String
    Dim i As Long
    i = InStrRev(S, "\")
    If i = 0 Then
        i = InStrRev(S, ":")
    End If
    ExtractFilePath = Left(S, i)
End Function

Public Function ExtractFileNameName(FileName As String) As String
' Extracts the name WITHOUT extension parts of a full file name
' uses ExtractFileName()
Dim pos As Integer
Dim sTemp As String
  sTemp = ExtractFileName(FileName)
  pos = InStrRev(sTemp, ".")
  If pos = 0 Then
    ExtractFileNameName = sTemp
  Else
    ExtractFileNameName = Left(sTemp, pos - 1)
  End If
End Function

Function ExtractFileName(PathName As String) As String
    Dim X As Integer
    For X = Len(PathName) To 1 Step -1
        If Mid$(PathName, X, 1) = "\" Then Exit For
    Next
    ExtractFileName = Right$(PathName, Len(PathName) - X)
End Function

Private Sub TryLoadTable()
  Dim tmp As String
  Dim sdbname, sfilename As String
    tmp = App.Path & "\Maps\Coordinates.mdb"
    If FileExists(tmp) Then
      sdbname = ExtractFilePath(tmp)
      sfilename = ExtractFileName(tmp)
      tablename = ExtractFileNameName(Combo1.Text)
      Data.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & App.Path _
               & "\Maps\coordinates.mdb;Persist Security Info=False"
      rst.Open "select * from " & tablename, Data, 1, 1
    End If
End Sub
  
' Add all map shapes to listbox
Private Sub FillShapes()
Dim t As Integer
Dim tmpS As String
    List1.Clear
    For t = 0 To TChart1.Series(0).asMap.Shapes.Count - 1
        tmpS = TChart1.Series(0).PointLabel(t)
        If tmpS = "" Then
            tmpS = Int(t) ' Series1[t].Index);
        End If
        List1.AddItem tmpS
        List1.Selected(t) = True
    Next t
End Sub

Private Sub DrawShapeOutline(Index As Integer) ' Only for 2D

'Now this is done by using the Hover property
'Dim i As Integer
  'If CBOutLine.Value And TChart1.Series(0).asMap.Shapes.Polygon(Index).Visible = True Then
  'With TChart1.Canvas
    '.Pen.Color = vbRed
    '.Pen.Style = psSolid
    
    'If TChart1.Series(0).asMap.Shapes.Polygon(Index).Pen.Visible = True Then
    '    .Pen.Width = TChart1.Series(0).asMap.Shapes.Polygon(Index).Pen.Width
    'Else
    '   .Pen.Width = 2
    'End If
       
    'If CBOutLineColor.Value Then
    '  If OldIndex <> 999999 Then
    '    TChart1.Series(0).asMap.Shapes.Polygon(OldIndex).Gradient.Visible = True
    '  End If
    '  OldIndex = Index
    '  TChart1.Series(0).asMap.Shapes.Polygon(Index).Gradient.Visible = False
    'Else
    '  .Brush.Style = bsClear
    '  .Pen.Width = 2
    'End If

    'If CBClipOutline.Value Then
    'With TChart1
    '    .Canvas.ClipRectangle .Axis.Left.Position, .Axis.Top.Position, _
    '        .Axis.Right.Position, .Axis.Bottom.Position
    'End With
    'End If
    
    'If Index <> o Then
    'TChart1.Repaint
    'For i = 0 To TChart1.Series(0).asMap.Shapes.Polygon(Index).GetPoints.Count - 1
    '  If i = 0 Then
    '    TChart1.Canvas.MoveTo TChart1.Series(0).asMap.Shapes.Polygon(Index).GetPoints.Item(i).X, _
    '        TChart1.Series(0).asMap.Shapes.Polygon(Index).GetPoints.Item(i).Y
    '  Else
    '    TChart1.Canvas.LineTo TChart1.Series(0).asMap.Shapes.Polygon(Index).GetPoints.Item(i).X, _
    '        TChart1.Series(0).asMap.Shapes.Polygon(Index).GetPoints.Item(i).Y
    '  End If
    'Next i
    
    'TChart1.Canvas.LineTo TChart1.Series(0).asMap.Shapes.Polygon(Index).GetPoints.Item(0).X, _
    '    TChart1.Series(0).asMap.Shapes.Polygon(Index).GetPoints.Item(0).Y
    'End If
    'If CBClipOutline.Value Then
    '    TChart1.Canvas.UnClipRectangle
    'End If
  'End With
  'End If
End Sub

' Removes previously displayed outline and draws a new outline
' around a map shape
Private Sub OutlineShape(Index As Integer)
  If Index <> Old Then
    If Old <> -1 Then
        DrawShapeOutline Old
    End If
    Old = Index
    If Old <> -1 Then
        DrawShapeOutline Old
    End If
  End If
End Sub

Public Function FileExists(fName As String) As Boolean
  If fName = "" Or Right(fName, 1) = "\" Then
    FileExists = False: Exit Function
  End If
  FileExists = (Dir(fName) <> "")
End Function

Private Sub Form_Paint()
  If ParamCount > 0 Then
    BLoad_Click
  Else
    If FileExists(App.Path & "\Maps\World.shp") Then
      Combo1.Text = "world.shp"
      BLoad_Click
    Else
      If FileExists("USAStates.shp") Then
        Combo1.Text = "USAStates.shp"
        BLoad_Click
      End If
    End If
  End If
End Sub

Private Sub Form_Resize()
  If Form1.ScaleHeight <> 0 And Form1.ScaleWidth <> 0 Then
    TChart1.Width = Form1.ScaleWidth - TChart1.Left
    TChart1.Height = Form1.ScaleHeight - TChart1.Top - 300
    SSTab1.Height = Form1.ScaleHeight - SSTab1.Top - 300
    Line1.X2 = Form1.ScaleWidth - Line1.X1
    ListCities.Height = SSTab1.Height - ListCities.Top
    Memo.Height = SSTab1.Height - Memo.Top - 100
  End If
End Sub

Private Sub List1_Click()
Dim tmp As Integer
If List_Selecting = False Then
  If List1.TabIndex <> -1 Then
    tmp = List1.ListIndex
    OutlineShape (tmp)
  End If
End If
End Sub

Private Sub List1_ItemCheck(Item As Integer)
' Makes Visible or invisible the selected polygon
If List_Selecting = False Then
  TChart1.Series(0).asMap.Shapes.Polygon(Item).Active = List1.Selected(Item)
End If
End Sub

Private Sub ListCities_Click()
Dim tmp As Integer
  tmp = CurrentCity
  TChart1.Tools.Items(8).Active = True
  With TChart1.Tools.Items(8).asAnnotation
    .Text = TChart1.Series(1).PointLabel(tmp)
    .Callout.XPosition = TChart1.Series(1).CalcXPos(tmp)
    .Callout.YPosition = TChart1.Series(1).CalcYPos(tmp)
    .Callout.Arrow.Color = vbgray
    .Callout.Arrow.Visible = True
  End With
End Sub

Private Sub SSTab1_Click(PreviousTab As Integer)
  LoadCityList
End Sub

Private Sub TChart1_OnAfterDraw()
  If Old <> -1 Then
    DrawShapeOutline Old
  End If
End Sub

Private Sub TChart1_OnClickSeries(ByVal SeriesIndex As Long, ByVal ValueIndex As Long, ByVal Button As TeeChart.EMouseButton, ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
If SeriesIndex = 0 Then
  List1.ListIndex = TChart1.Series(0).asMap.Shapes.Polygon(ValueIndex).Index
  List1.SetFocus
  TChart1.StopMouse
Else
  If ListCities.ListCount > 0 Then
    ListCities.ListIndex = ValueIndex
    ListCities_Click
  End If
End If
End Sub

Private Sub TChart1_OnMouseMove(ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
' When moving the mouse, determine which shape is under the cursor
'' to outline it and to display info at status bar
Dim tmp, City As Integer
Dim tmpHint, CityName As String
Dim tmpX, tmpY As Double
  
With TChart1
  tmp = .Series(0).Clicked(X, Y)
  City = .Series(1).Clicked(X, Y)
  If City <> -1 Then
    CytyName = .Series(1).PointLabel(City)
  Else
     CityName = ""
  End If
  
  If tmp <> -1 Then
     StatusBar1.SimpleText = StatusBar1.SimpleText & _
        TChart1.Series(0).PointLabel(tmp) & " " & TChart1.Series(0).asMap.ZValue(tmp) & _
        " ID: " & TChart1.Series(0).asMap.Shapes.Polygon(tmp).Index
  End If

  If City = -1 Then
    If tmp = -1 Then
       tmpHint = ""
    Else
      If TChart1.Series(0).PointLabel(tmp) = "" Then
        tmpHint = "ID: " & TChart1.Series(0).asMap.Shapes.Polygon(tmp).Index
      Else
        tmpHint = TChart1.Series(0).PointLabel(tmp)
      End If
    End If
    TChart1.Hint = tmpHint
  End If
  OutlineShape (tmp)
End With
End Sub

Private Sub TChart1_OnResize()
  ResetCitySize (36)
  RefreshCityArrow
End Sub

Private Sub TChart1_OnScroll()
  RefreshCityArrow
End Sub

Private Sub TChart1_OnUndoZoom()
  If Combo1.TabIndex = 1 Then
    TChart1.Axis.Left.SetMinMax 24, 50
    TChart1.Axis.Bottom.SetMinMax -125, -67
  End If
  TChart1.Series(1).asPoint.Pointer.HorizontalSize = 2
  TChart1.Series(1).asPoint.Pointer.VerticalSize = 2

  RefreshCityArrow
End Sub

Private Sub TChart1_OnZoom()
  'MakeIsoAxis
  If Combo1.TabIndex = 1 Then
    ResetCitySize (10)
  Else
    ResetCitySize (36)
  End If
  RefreshCityArrow
End Sub

' After zooming, make sure both the vertical and horizontal axes
' are "isometric", that is, both have an equal pixel to value size
Private Sub MakeIsoAxis()
Dim tmpX, tmpY, XRange, YRange, offset, XYScreen As Double
  With TChart1
  If (.Height > 0) And (.Width > 0) Then
    With .Axis.Bottom
        XRange = .Maximum - .Minimum
    End With
    With .Axis.Left
        YRange = .Maximum - .Minimum
    End With

    tmpX = (XRange / .Width)
    tmpY = (YRange / .Height) * 0.94

    If tmpX > tmpY Then
      If tmpY <> 0 Then
        offset = ((YRange * tmpX / tmpY) - YRange) / 2#
        With .Axis.Left
            .SetMinMax Minimum - offset, Maximum + offset
        End With
      Else
       If tmpX <> 0 Then
         offset = ((XRange * tmpY / tmpX) - XRange) / 2#
         With .Axis.Bottom
            .SetMinMax Minimum - offset, Maximum + offset
         End With
       End If
      End If
    End If
End If
End With
End Sub

Private Sub RefreshCityArrow()
  If TChart1.Tools.Items(8).Active Then
    With TChart1
        .Axis.Left.AdjustMaxMin
        .Axis.Bottom.AdjustMaxMin
        .Tools.Items(8).asAnnotation.Callout.XPosition = TChart1.Series(1).CalcXPos(CurrentCity)
        .Tools.Items(8).asAnnotation.Callout.YPosition = TChart1.Series(1).CalcYPos(CurrentCity)
    End With
  End If
End Sub

Private Sub ResetCitySize(Ratio As Double)
  'Zoom Series2 Marks as Chart Zooms
  TChart1.Axis.Bottom.AdjustMaxMin

  With TChart1.Series(1).asPoint.Pointer
     .HorizontalSize = 2
     .VerticalSize = 2
  End With
End Sub

Private Sub LoadCityList()
Dim t As Integer
  ListCities.Clear
  If CBCities.Value Then
    For t = 0 To TChart1.Series(1).Count - 1
        ListCities.AddItem TChart1.Series(1).PointLabel(t)
    Next t
  End If
End Sub

Function CurrentCity() As Integer
    CurrentCity = ListCities.ListIndex
End Function

Private Sub ZoomIn_Click()
    TChart1.Zoom.ZoomPercent 110
End Sub

Private Sub ZoomOut_Click()
    TChart1.Zoom.ZoomPercent 90
End Sub

