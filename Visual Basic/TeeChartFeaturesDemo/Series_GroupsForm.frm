VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series_GroupsForm 
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
   Begin TeeChart.TeeListBox TeeListBox1 
      Height          =   5175
      Left            =   0
      OleObjectBlob   =   "Series_GroupsForm.frx":0000
      TabIndex        =   6
      Top             =   1710
      Width           =   2760
   End
   Begin TeeChart.TChart TChart1 
      Height          =   5175
      Left            =   2745
      TabIndex        =   0
      Top             =   1710
      Width           =   8715
      Base64          =   $"Series_GroupsForm.frx":005A
   End
   Begin TeeChart.TeeEditor TeeEditor1 
      Left            =   6345
      OleObjectBlob   =   "Series_GroupsForm.frx":048C
      Top             =   1215
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      Left            =   90
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   1275
      Width           =   1860
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Show ""All Group"" at Editor"
      Height          =   195
      Left            =   3420
      TabIndex        =   4
      Top             =   1455
      Value           =   1  'Checked
      Width           =   2625
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Show Groups at Editor"
      Height          =   195
      Left            =   3420
      TabIndex        =   3
      Top             =   1230
      Value           =   1  'Checked
      Width           =   2355
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "Series_GroupsForm.frx":04E8
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit"
      Height          =   345
      Left            =   2070
      TabIndex        =   1
      Top             =   1260
      Width           =   1065
   End
End
Attribute VB_Name = "Series_GroupsForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Combo1_Click()
  ' Hide series in current group
  TeeListBox1.SeriesGroup.Hide

  ' Change series group to show at listbox...
  TeeListBox1.SeriesGroup = TChart1.SeriesList.Groups.Items(Combo1.ListIndex)
  
  ' Show series in newly selected group
  TeeListBox1.SeriesGroup.Show
  
  TeeListBox1.UpdateSeries
End Sub

Private Sub Command1_Click()
  TeeEditor1.Chart = TChart1
  If Check1.Value Then
     TeeEditor1.Options.Groups = True
  Else
     TeeEditor1.Options.Groups = False
  End If
  If Check2.Value Then
     TeeEditor1.Options.AllGroups = True
  Else
     TeeEditor1.Options.AllGroups = False
  End If
  TeeEditor1.ShowEditor
End Sub

Private Sub Form_Load()
Dim t As Integer

  ' Create some Line series, and fill them with random values...
  For t = 0 To 9
     TChart1.AddSeries scLine
     TChart1.Series(t).Title = "Line " & t
     TChart1.Series(t).FillSampleValues (10)
  Next t
  ' Create two "Series Groups", and add some series to each group...
  TChart1.SeriesList.AddGroup "First group"

  With TChart1.SeriesList.Groups.Items(0)
    .Add (0)
    .Add (2)
    .Add (4)
    .Add (6)
    .Add (8)
  End With
  TChart1.SeriesList.AddGroup "Second group"
  With TChart1.SeriesList.Groups.Items(1)
    .Add (1)
    .Add (3)
    .Add (5)
    .Add (7)
    .Add (9)
  End With
  ' Show all series in first group
  TChart1.SeriesList.Groups.Items(0).Show

  ' Hide all series in second group
  TChart1.SeriesList.Groups.Items(1).Hide

  ' Add all groups to combo-box for selection...
  Combo1.Clear
  
  With TChart1.SeriesList.Groups
  For t = 0 To .Count - 1
      Combo1.AddItem .Items(t).Name, t
  Next t
  End With

  TeeListBox1.Chart = TChart1
  ' Tell the Chart ListBox to show the Group1 only...
  TeeListBox1.SeriesGroup = TChart1.SeriesList.Groups.Items(0)
  
  Combo1.ListIndex = 0

End Sub
