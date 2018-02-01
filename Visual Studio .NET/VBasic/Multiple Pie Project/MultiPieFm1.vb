Option Strict Off
Option Explicit On
Friend Class Form1
	Inherits System.Windows.Forms.Form
#Region "Windows Form Designer generated code "
	Public Sub New()
		MyBase.New()
		If m_vb6FormDefInstance Is Nothing Then
			If m_InitializingDefInstance Then
				m_vb6FormDefInstance = Me
			Else
				Try 
					'For the start-up form, the first instance created is the default instance.
					If System.Reflection.Assembly.GetExecutingAssembly.EntryPoint.DeclaringType Is Me.GetType Then
						m_vb6FormDefInstance = Me
					End If
				Catch
				End Try
			End If
		End If
		'This call is required by the Windows Form Designer.
		InitializeComponent()
	End Sub
	'Form overrides dispose to clean up the component list.
	Protected Overloads Overrides Sub Dispose(ByVal Disposing As Boolean)
		If Disposing Then
			If Not components Is Nothing Then
				components.Dispose()
			End If
		End If
		MyBase.Dispose(Disposing)
	End Sub
	'Required by the Windows Form Designer
	Private components As System.ComponentModel.IContainer
	Public ToolTip1 As System.Windows.Forms.ToolTip
  'Public WithEvents TChart1 As AxTeeChart.AxTChart
	Public WithEvents Command1 As System.Windows.Forms.Button
	Public WithEvents Check1 As System.Windows.Forms.CheckBox
	'NOTE: The following procedure is required by the Windows Form Designer
	'It can be modified using the Windows Form Designer.
	'Do not modify it using the code editor.
  Friend WithEvents TChart1 As AxTeeChart.AxTChart
  <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
    Me.components = New System.ComponentModel.Container()
    Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(Form1))
    Me.ToolTip1 = New System.Windows.Forms.ToolTip(Me.components)
    Me.Command1 = New System.Windows.Forms.Button()
    Me.Check1 = New System.Windows.Forms.CheckBox()
    Me.TChart1 = New AxTeeChart.AxTChart()
    CType(Me.TChart1, System.ComponentModel.ISupportInitialize).BeginInit()
    Me.SuspendLayout()
    '
    'Command1
    '
    Me.Command1.BackColor = System.Drawing.SystemColors.Control
    Me.Command1.Cursor = System.Windows.Forms.Cursors.Default
    Me.Command1.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
    Me.Command1.ForeColor = System.Drawing.SystemColors.ControlText
    Me.Command1.Location = New System.Drawing.Point(672, 464)
    Me.Command1.Name = "Command1"
    Me.Command1.RightToLeft = System.Windows.Forms.RightToLeft.No
    Me.Command1.Size = New System.Drawing.Size(81, 25)
    Me.Command1.TabIndex = 2
    Me.Command1.Text = "Close"
    '
    'Check1
    '
    Me.Check1.BackColor = System.Drawing.SystemColors.Control
    Me.Check1.Cursor = System.Windows.Forms.Cursors.Default
    Me.Check1.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
    Me.Check1.ForeColor = System.Drawing.SystemColors.ControlText
    Me.Check1.Location = New System.Drawing.Point(16, 472)
    Me.Check1.Name = "Check1"
    Me.Check1.RightToLeft = System.Windows.Forms.RightToLeft.No
    Me.Check1.Size = New System.Drawing.Size(65, 13)
    Me.Check1.TabIndex = 1
    Me.Check1.Text = "Animate"
    '
    'TChart1
    '
    Me.TChart1.Enabled = True
    Me.TChart1.Location = New System.Drawing.Point(8, 24)
    Me.TChart1.Name = "TChart1"
    Me.TChart1.OcxState = CType(resources.GetObject("TChart1.OcxState"), System.Windows.Forms.AxHost.State)
    Me.TChart1.Size = New System.Drawing.Size(736, 424)
    Me.TChart1.TabIndex = 3
    '
    'Form1
    '
    Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
    Me.ClientSize = New System.Drawing.Size(758, 491)
    Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.TChart1, Me.Command1, Me.Check1})
    Me.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
    Me.Location = New System.Drawing.Point(72, 127)
    Me.Name = "Form1"
    Me.StartPosition = System.Windows.Forms.FormStartPosition.Manual
    Me.Text = "Form1"
    CType(Me.TChart1, System.ComponentModel.ISupportInitialize).EndInit()
    Me.ResumeLayout(False)

  End Sub
#End Region 
#Region "Upgrade Support "
	Private Shared m_vb6FormDefInstance As Form1
	Private Shared m_InitializingDefInstance As Boolean
	Public Shared Property DefInstance() As Form1
		Get
			If m_vb6FormDefInstance Is Nothing OrElse m_vb6FormDefInstance.IsDisposed Then
				m_InitializingDefInstance = True
				m_vb6FormDefInstance = New Form1()
				m_InitializingDefInstance = False
			End If
			DefInstance = m_vb6FormDefInstance
		End Get
		Set
			m_vb6FormDefInstance = Value
		End Set
	End Property
#End Region 
	'UPGRADE_WARNING: Event Check1.CheckStateChanged may fire when form is intialized. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup2075"'
	Private Sub Check1_CheckStateChanged(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Check1.CheckStateChanged
		'Enable timer
		TChart1.TimerEnabled = Check1.CheckState
	End Sub
	
	Private Sub Command1_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command1.Click
		TChart1.TimerEnabled = False
		Form1.DefInstance.Close()
	End Sub
	
	Private Sub Form1_Load(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Load
		'Fill Pies
		With TChart1
			If .Canvas.IsScreenHighColor = False Then
				.Panel.Gradient.Visible = False
			End If
			.TimerInterval = 30
			.Legend.Visible = False
			.Aspect.View3D = False
			
			'Electricals division
			.AddSeries(TeeChart.ESeriesClass.scPie)
			.Series(0).Marks.ArrowLength = -4
			.Series(0).Marks.Font.Size = 7
			.Series(0).Marks.Style = TeeChart.EMarkStyle.smsLabelValue
			.Series(0).asPie.Circled = True
			.Series(0).Title = "Electricals"
			.Series(0).Add(3, "Lamps,", System.Convert.ToUInt32(TeeChart.EConstants.clTeeColor))
			.Series(0).Add(5, "Toasters,", System.Convert.ToUInt32(TeeChart.EConstants.clTeeColor))
			.Series(0).Add(2, "Kettles,", System.Convert.ToUInt32(TeeChart.EConstants.clTeeColor))
			
			'Computing division
			.AddSeries(TeeChart.ESeriesClass.scPie)
			.Series(1).Marks.ArrowLength = -4
			.Series(1).Marks.Style = TeeChart.EMarkStyle.smsLabelValue
			.Series(1).Marks.Font.Size = 7
			.Series(1).asPie.Circled = True
			.Series(1).Title = "Computing"
			.Series(1).Add(8, "CDRom" & Chr(13) & "drives,", System.Convert.ToUInt32(TeeChart.EConstants.clTeeColor))
			.Series(1).Add(7, "Mainboards,", System.Convert.ToUInt32(TeeChart.EConstants.clTeeColor))
			.Series(1).Add(5, "Floppy" & Chr(13) & "drives,", System.Convert.ToUInt32(TeeChart.EConstants.clTeeColor))
			.Series(1).Add(4, "Video boards,", System.Convert.ToUInt32(TeeChart.EConstants.clTeeColor))
			.Series(1).Add(4, "Hard" & Chr(13) & "drives,", System.Convert.ToUInt32(TeeChart.EConstants.clTeeColor))
			.Series(1).Add(10, "Sound" & Chr(13) & "boards,", System.Convert.ToUInt32(TeeChart.EConstants.clTeeColor))
			
			'Electrodomestics division
			.AddSeries(TeeChart.ESeriesClass.scPie)
			.Series(2).Marks.ArrowLength = -4
			.Series(2).Marks.Style = TeeChart.EMarkStyle.smsLabelValue
			.Series(2).Marks.Font.Size = 7
			.Series(2).Title = "Electrodomestics"
			.Series(2).asPie.Circled = True
			.Series(2).Add(12, "Fridges,", System.Convert.ToUInt32(TeeChart.EConstants.clTeeColor))
			.Series(2).Add(8, "Freezers,", System.Convert.ToUInt32(TeeChart.EConstants.clTeeColor))
			.Series(2).Add(8, "Washing," & Chr(13) & "machines", System.Convert.ToUInt32(TeeChart.EConstants.clTeeColor))
			.Series(2).Add(9, "Dishwashers,", System.Convert.ToUInt32(TeeChart.EConstants.clTeeColor))
			.Series(2).Add(2, "Cookers,", System.Convert.ToUInt32(TeeChart.EConstants.clTeeColor))
			
			'Electronics division
			.AddSeries(TeeChart.ESeriesClass.scPie)
			.Series(3).Marks.ArrowLength = -4
			.Series(3).Marks.Style = TeeChart.EMarkStyle.smsLabelValue
			.Series(3).Marks.Font.Size = 7
			.Series(3).Title = "Electronics"
			.Series(3).asPie.Circled = True
			.Series(3).Add(12, "Hi-fi,", System.Convert.ToUInt32(TeeChart.EConstants.clTeeColor))
			.Series(3).Add(6, "TV-Video,", System.Convert.ToUInt32(TeeChart.EConstants.clTeeColor))
			.Series(3).Add(2, "Communications,", System.Convert.ToUInt32(TeeChart.EConstants.clTeeColor))
			
			'Total sales
			.AddSeries(TeeChart.ESeriesClass.scPie)
			.Series(4).Marks.ArrowLength = -4
			.Series(4).Marks.Style = TeeChart.EMarkStyle.smsLabelValue
			.Series(4).asPie.Circled = True
			.Series(4).Title = "Total sales"
			.Series(4).Add(10, "Electricals" & Chr(13), System.Convert.ToUInt32(TeeChart.EConstants.clTeeColor))
			.Series(4).Add(38, "Computing" & Chr(13), System.Convert.ToUInt32(TeeChart.EConstants.clTeeColor))
			.Series(4).Add(39, "Electrodomestics" & Chr(13), System.Convert.ToUInt32(TeeChart.EConstants.clTeeColor))
			.Series(4).Add(20, "Electronics" & Chr(13), System.Convert.ToUInt32(TeeChart.EConstants.clTeeColor))
		End With
	End Sub
	
	Private Sub TChart1_OnAfterDraw(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles TChart1.OnAfterDraw
		Dim i As Object
		' Set Pie titles
		With TChart1
			.Canvas.Font.Bold = True
			.Canvas.Font.Color = System.Convert.ToUInt32(System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.White))
			For i = 0 To .SeriesCount - 1
				'UPGRADE_WARNING: Couldn't resolve default property of object i. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
				If i = .SeriesCount - 1 Then
					.Canvas.Font.Size = .Canvas.Font.Size + 2
					'UPGRADE_WARNING: Couldn't resolve default property of object i. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
					.Canvas.TextOut(.Series(i).asPie.XCenter - (.Canvas.TextWidth("$000's") / 2), .Series(i).asPie.YCenter + .Series(i).asPie.YRadius + 58, "$000s")
				End If
				'UPGRADE_WARNING: Couldn't resolve default property of object i. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
				.Canvas.TextOut(.Series(i).asPie.XCenter - (.Canvas.TextWidth(.Series(i).Title) / 2), .Series(i).asPie.YCenter + .Series(i).asPie.YRadius + 40, .Series(i).Title)
			Next i
		End With
	End Sub
	
	Private Sub TChart1_OnSeriesBeforeDrawValues(ByVal eventSender As System.Object, ByVal eventArgs As AxTeeChart.ITChartEvents_OnSeriesBeforeDrawValuesEvent) Handles TChart1.OnSeriesBeforeDrawValues
		'Place the new location of the Chart before painting the Series
		With TChart1
			Select Case eventArgs.SeriesIndex
				Case 0 : .ChartRect(0, 0, .Canvas.Width * 6 / 16, .Canvas.Height / 2)
				Case 1 : .ChartRect(.Canvas.Width * 5 / 16, 0, .Canvas.Width * 11 / 16, .Canvas.Height / 2)
				Case 2 : .ChartRect(0, .Canvas.Height / 2, .Canvas.Width * 6 / 16, .Canvas.Height)
				Case 3 : .ChartRect(.Canvas.Width * 5 / 16, .Canvas.Height / 2, .Canvas.Width * 11 / 16, .Canvas.Height)
				Case 4 : .ChartRect(.Canvas.Width * 9 / 16, .Canvas.Height / 5, .Canvas.Width, .Canvas.Height * 4 / 5)
			End Select
		End With
	End Sub
	
	Private Sub TChart1_OnTimer(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles TChart1.OnTimer
		Dim i As Object
		'Automate !
		For i = 0 To TChart1.SeriesCount - 1
			'UPGRADE_WARNING: Couldn't resolve default property of object i. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
			TChart1.Series(i).asPie.RotationAngle = TChart1.Series(i).asPie.RotationAngle + 1
		Next i
	End Sub
End Class