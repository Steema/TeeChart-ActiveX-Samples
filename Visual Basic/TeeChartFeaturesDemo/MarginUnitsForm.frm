VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form MarginUnitsForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2985
   ClientTop       =   2820
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5265
      Left            =   0
      TabIndex        =   0
      Top             =   1650
      Width           =   11505
      Base64          =   $"MarginUnitsForm.frx":0000
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   270
      Left            =   3990
      Max             =   0
      Min             =   100
      TabIndex        =   4
      Top             =   1230
      Value           =   10
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   3435
      TabIndex        =   3
      Text            =   "10"
      Top             =   1215
      Width           =   570
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "MarginUnitsForm.frx":057E
      Left            =   1080
      List            =   "MarginUnitsForm.frx":0588
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   1200
      Width           =   1335
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "MarginUnitsForm.frx":059D
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "pixels"
      Height          =   195
      Left            =   4305
      TabIndex        =   7
      Top             =   1275
      Width           =   390
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Margin Units:"
      Height          =   195
      Left            =   120
      TabIndex        =   6
      Top             =   1260
      Width           =   930
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Value:"
      Height          =   195
      Left            =   2880
      TabIndex        =   5
      Top             =   1260
      Width           =   450
   End
End
Attribute VB_Name = "MarginUnitsForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Combo1_Click()
  If Combo1.ListIndex = 0 Then
    TChart1.Panel.MarginUnits = muPercent
    Label2.Caption = "%"
  Else
    TChart1.Panel.MarginUnits = muPixels
    Label2.Caption = "pixels"
  End If
  VScroll1.Value = val(Text2.Text)
End Sub

Private Sub Form_Load()
    Combo1.ListIndex = 1
End Sub

Private Sub Text2_Change()
Dim v As Integer
  v = val(Text2.Text)
  If Not IsNumeric(Text2.Text) Or v < 0 Or v > 100 Then
    KeepFocus = True
    MsgBox "Please insert a numeric value between 0 and 100", , "Margin Units"
  Else
    TChart1.Panel.MarginLeft = v
    TChart1.Panel.MarginTop = v
    TChart1.Panel.MarginRight = v
    TChart1.Panel.MarginBottom = v
    If VScroll1.Value <> v Then VScroll1.Value = v
  End If
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
Dim s As String
  s = LTrim$(Str$(VScroll1.Value))
  If Text2.Text <> s Then Text2.Text = s
End Sub
