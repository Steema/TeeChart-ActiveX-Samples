VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form OpenGLEditorFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2955
   ClientTop       =   2745
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5775
      Left            =   0
      TabIndex        =   1
      Top             =   1140
      Width           =   11505
      Base64          =   $"OpenGLEditorFormForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "OpenGL Active"
      Height          =   195
      Left            =   1020
      TabIndex        =   3
      Top             =   780
      Value           =   1  'Checked
      Width           =   1635
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Editor"
      Height          =   345
      Left            =   4140
      TabIndex        =   2
      Top             =   720
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   615
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "OpenGLEditorFormForm.frx":052C
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "OpenGLEditorFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Aspect.OpenGL.Active = Check1.Value
End Sub

Private Sub Command1_Click()
  TChart1.ShowEditor
End Sub

Private Sub Form_Load()
  With TChart1.Series(0)
    .Add 7, "", clTeeColor
    .Add 3, "", clTeeColor
    .Add -4, "", clTeeColor
    .Add -1, "", clTeeColor
    .Add -2, "", clTeeColor
    .Add 6, "", clTeeColor
    .Add 4, "", clTeeColor
  End With
  
  TChart1.Aspect.OpenGL.Active = True
End Sub

