VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2012.ocx"
Begin VB.Form AxisLabelsFormatForm 
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
      Height          =   5235
      Left            =   0
      TabIndex        =   0
      Top             =   1680
      Width           =   11505
      Base64          =   $"AxisLabelsFormatForm.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   4440
      TabIndex        =   5
      Top             =   1230
      Width           =   1095
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Transparent"
      Height          =   195
      Left            =   2745
      TabIndex        =   4
      Top             =   1290
      Value           =   1  'Checked
      Width           =   1455
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "AxisLabelsFormatForm.frx":13A8
      Left            =   615
      List            =   "AxisLabelsFormatForm.frx":13B8
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   1245
      Width           =   1815
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "AxisLabelsFormatForm.frx":13D6
      Top             =   0
      Width           =   11400
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Axis:"
      Height          =   195
      Left            =   135
      TabIndex        =   2
      Top             =   1290
      Width           =   330
   End
End
Attribute VB_Name = "AxisLabelsFormatForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Combo1_Click()
  Select Case Combo1.ListIndex
    Case 0: Check1.Value = IIf(TChart1.Axis.Left.Labels.Format.Transparent, 1, 0)
    Case 1: Check1.Value = IIf(TChart1.Axis.Top.Labels.Format.Transparent, 1, 0)
    Case 2: Check1.Value = IIf(TChart1.Axis.Right.Labels.Format.Transparent, 1, 0)
    Case 3: Check1.Value = IIf(TChart1.Axis.Bottom.Labels.Format.Transparent, 1, 0)
  End Select
End Sub

Private Sub Command1_Click()
  Select Case Combo1.ListIndex
    Case 0: TChart1.Axis.Left.Labels.Format.ShowEditorShape
    Case 1: TChart1.Axis.Top.Labels.Format.ShowEditorShape
    Case 2: TChart1.Axis.Right.Labels.Format.ShowEditorShape
    Case 3: TChart1.Axis.Bottom.Labels.Format.ShowEditorShape
  End Select
End Sub

Private Sub Check1_Click()
  Select Case Combo1.ListIndex
    Case 0: TChart1.Axis.Left.Labels.Format.Transparent = Check1.Value
    Case 1: TChart1.Axis.Top.Labels.Format.Transparent = Check1.Value
    Case 2: TChart1.Axis.Right.Labels.Format.Transparent = Check1.Value
    Case 3: TChart1.Axis.Bottom.Labels.Format.Transparent = Check1.Value
  End Select
End Sub

Private Sub Form_Load()
    Combo1.ListIndex = 0
    TChart1.Series(0).FillSampleValues (5)
End Sub
