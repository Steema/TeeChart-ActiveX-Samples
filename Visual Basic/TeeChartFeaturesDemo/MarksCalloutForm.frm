VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form MarksCalloutForm 
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
      Base64          =   $"MarksCalloutForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Visible"
      Height          =   195
      Left            =   4905
      TabIndex        =   5
      Top             =   1290
      Value           =   1  'Checked
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   3480
      TabIndex        =   4
      Top             =   1230
      Width           =   1215
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "MarksCalloutForm.frx":07DE
      Left            =   840
      List            =   "MarksCalloutForm.frx":0806
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   1245
      Width           =   2415
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "MarksCalloutForm.frx":088C
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Style:"
      Height          =   195
      Left            =   360
      TabIndex        =   2
      Top             =   1290
      Width           =   390
   End
End
Attribute VB_Name = "MarksCalloutForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Combo1_Click()
  TChart1.Series(0).Marks.Callout.Style = Combo1.ListIndex
End Sub

Private Sub Command1_Click()
  TChart1.Series(0).Marks.ShowEditorMarks
End Sub

Private Sub Check1_Click()
  TChart1.Series(0).Marks.Callout.Visible = (Check1.Value = 1)
End Sub

Private Sub Form_Load()
  Combo1.ListIndex = 3
  TChart1.Series(0).FillSampleValues 6
End Sub
