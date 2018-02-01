VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2015.ocx"
Begin VB.Form SupportForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   1590
   ClientTop       =   1200
   ClientWidth     =   7080
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   7080
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   1  'Align Top
      Height          =   780
      Left            =   0
      TabIndex        =   5
      Top             =   0
      Width           =   7080
      Base64          =   $"SupportForm.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Search !"
      Enabled         =   0   'False
      Height          =   420
      Left            =   135
      TabIndex        =   1
      Top             =   4500
      Width           =   1410
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2835
      Left            =   90
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   1575
      Width           =   6765
   End
   Begin VB.Label Label3 
      Height          =   240
      Left            =   810
      TabIndex        =   4
      Top             =   900
      Width           =   4245
   End
   Begin VB.Label Label2 
      Caption         =   "Topic :"
      Height          =   240
      Left            =   135
      TabIndex        =   3
      Top             =   900
      Width           =   555
   End
   Begin VB.Label Label1 
      Caption         =   "Type words here :"
      Height          =   240
      Left            =   135
      TabIndex        =   2
      Top             =   1305
      Width           =   2490
   End
End
Attribute VB_Name = "SupportForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
#If Win32 Then

Private Declare Function ShellExecute Lib _
"shell32.dll" Alias "ShellExecuteA" _
(ByVal hwnd As Long, _
ByVal lpOperation As String, _
ByVal lpFile As String, _
ByVal lpParameters As String, _
ByVal lpDirectory As String, _
ByVal nShowCmd As Long) As Long

#Else

Private Declare Function ShellExecute Lib _
"shell.dll" _
(ByVal hwnd As Integer, _
ByVal lpOperation As String, _
ByVal lpFile As String, _
ByVal lpParameters As String, _
ByVal lpDirectory As String, _
ByVal nShowCmd As Integer) As Integer

#End If

Private Const SW_SHOWNORMAL = 1

Private Sub Command1_Click()
Dim iret As Long
' Go to do a search in to Steema Support Web page
iret = ShellExecute(Me.hwnd, vbNullString, _
"http://www.teechart.net/support/search.php?keywords=" & Text1.Text, vbNullString, _
"c:\", SW_SHOWNORMAL)
End Sub

Private Sub Form_Load()

Select Case Form1.SSTab1.Tab
Case 0: Label3.Caption = Form1.Outline1.SelectedItem.Tag
Case 1: Label3.Caption = Form1.Outline3.SelectedItem.Tag
Case 2: Label3.Caption = ""
End Select

If Label3.Caption = "LogoForm" Then Label3.Caption = ""
End Sub

Private Sub Text1_Change()
If Text1.Text <> "" Then
    Command1.Enabled = True
Else
    Command1.Enabled = False
End If
End Sub
