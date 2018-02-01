VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form TemplateForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5940
      Left            =   0
      TabIndex        =   1
      Top             =   975
      Width           =   11505
      Base64          =   $"TemplateForm.frx":0000
      Begin VB.Image Image1 
         Height          =   2580
         Left            =   1035
         Top             =   1215
         Width           =   4875
      End
   End
   Begin VB.TextBox AntiAliasForm 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "TemplateForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub AntiAliasForm_DblClick()
    TChart1.ShowEditor
End Sub

