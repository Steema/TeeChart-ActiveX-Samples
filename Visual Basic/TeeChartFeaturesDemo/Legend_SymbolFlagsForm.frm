VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "comctl32.ocx"
Begin VB.Form Legend_SymbolFlagsForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3570
   ClientTop       =   4440
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5850
      Left            =   0
      TabIndex        =   0
      Top             =   1065
      Width           =   11505
      Base64          =   $"Legend_SymbolFlagsForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Draw Flags"
      Height          =   195
      Left            =   225
      TabIndex        =   3
      Top             =   705
      Value           =   1  'Checked
      Width           =   1410
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   570
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "Legend_SymbolFlagsForm.frx":042E
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Border...  --"
      Height          =   345
      Left            =   1935
      TabIndex        =   1
      Top             =   630
      Width           =   1275
   End
   Begin ComctlLib.ImageList ImageList1 
      Left            =   4680
      Top             =   720
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   31
      ImageHeight     =   19
      MaskColor       =   12632256
      _Version        =   327682
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   8
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "Legend_SymbolFlagsForm.frx":04BF
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "Legend_SymbolFlagsForm.frx":0C31
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "Legend_SymbolFlagsForm.frx":13A3
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "Legend_SymbolFlagsForm.frx":1B15
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "Legend_SymbolFlagsForm.frx":2287
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "Legend_SymbolFlagsForm.frx":29F9
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "Legend_SymbolFlagsForm.frx":316B
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "Legend_SymbolFlagsForm.frx":38DD
            Key             =   ""
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "Legend_SymbolFlagsForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
    TChart1.Repaint
End Sub

Private Sub Command2_Click()
    TChart1.Legend.ShowEditorLegend
End Sub

Private Sub Form_Load()
With TChart1
    .AddSeries scPie
    With .Series(0)
      .Clear
      .Add Rnd(100) * 100, "USA", clTeeColor
      .Add Rnd(100) * 100, "France", clTeeColor
      .Add Rnd(100) * 100, "Germany", clTeeColor
      .Add Rnd(100) * 100, "India", clTeeColor
      .Add Rnd(100) * 100, "Italy", clTeeColor
      .Add Rnd(100) * 100, "Japan", clTeeColor
      .Add Rnd(100) * 100, "Portugal", clTeeColor
      .Add Rnd(100) * 100, "U.K.", clTeeColor
    End With
      .Aspect.Chart3DPercent = 50
      ' Make space bigger for flags
      .Legend.Font.Size = 10
      .Legend.Vertspacing = 8
      .Legend.Symbol.Width = 30
      .Legend.Symbol.WidthUnits = lcsPixels
End With
End Sub

Private Sub TChart1_OnLegendDrawSymbol(ByVal Series As Long, ByVal ValueIndex As Long, ByVal Left As Long, ByVal Top As Long, ByVal Right As Long, ByVal Bottom As Long)
Dim Flag As Image
Dim R As TeeRect

 If Check1.Value Then
  With TChart1
   If Series <> -1 Then
     ImageList1.ListImages(ValueIndex + 1).Draw .Canvas.HandleDC, _
                                                Screen.TwipsPerPixelX * Left, _
                                                Screen.TwipsPerPixelY * (Top - 5)
   End If
  End With
 End If
End Sub






