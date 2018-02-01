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
	Public WithEvents TChart1 As AxTeeChart.AxTChart
	Public WithEvents TeeCommander1 As AxTeeChart.AxTeeCommander
	Public WithEvents Check2 As System.Windows.Forms.CheckBox
	Public WithEvents Check1 As System.Windows.Forms.CheckBox
	Public WithEvents Command2 As System.Windows.Forms.Button
	Public WithEvents Command1 As System.Windows.Forms.Button
	Public WithEvents Frame1 As System.Windows.Forms.GroupBox
	'NOTE: The following procedure is required by the Windows Form Designer
	'It can be modified using the Windows Form Designer.
	'Do not modify it using the code editor.
	<System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
    Me.components = New System.ComponentModel.Container()
    Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(Form1))
    Me.ToolTip1 = New System.Windows.Forms.ToolTip(Me.components)
    Me.TChart1 = New AxTeeChart.AxTChart()
    Me.TeeCommander1 = New AxTeeChart.AxTeeCommander()
    Me.Frame1 = New System.Windows.Forms.GroupBox()
    Me.Check2 = New System.Windows.Forms.CheckBox()
    Me.Check1 = New System.Windows.Forms.CheckBox()
    Me.Command2 = New System.Windows.Forms.Button()
    Me.Command1 = New System.Windows.Forms.Button()
    CType(Me.TChart1, System.ComponentModel.ISupportInitialize).BeginInit()
    CType(Me.TeeCommander1, System.ComponentModel.ISupportInitialize).BeginInit()
    Me.Frame1.SuspendLayout()
    Me.SuspendLayout()
    '
    'TChart1
    '
    Me.TChart1.Enabled = True
    Me.TChart1.Location = New System.Drawing.Point(0, 37)
    Me.TChart1.Name = "TChart1"
    Me.TChart1.OcxState = CType(resources.GetObject("TChart1.OcxState"), System.Windows.Forms.AxHost.State)
    Me.TChart1.Size = New System.Drawing.Size(569, 329)
    Me.TChart1.TabIndex = 6
    '
    'TeeCommander1
    '
    Me.TeeCommander1.Dock = System.Windows.Forms.DockStyle.Top
    Me.TeeCommander1.Name = "TeeCommander1"
    Me.TeeCommander1.OcxState = CType(resources.GetObject("TeeCommander1.OcxState"), System.Windows.Forms.AxHost.State)
    Me.TeeCommander1.Size = New System.Drawing.Size(571, 33)
    Me.TeeCommander1.TabIndex = 3
    '
    'Frame1
    '
    Me.Frame1.BackColor = System.Drawing.SystemColors.Control
    Me.Frame1.Controls.AddRange(New System.Windows.Forms.Control() {Me.Check2, Me.Check1, Me.Command2, Me.Command1})
    Me.Frame1.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
    Me.Frame1.ForeColor = System.Drawing.SystemColors.ControlText
    Me.Frame1.Location = New System.Drawing.Point(-1, 367)
    Me.Frame1.Name = "Frame1"
    Me.Frame1.RightToLeft = System.Windows.Forms.RightToLeft.No
    Me.Frame1.Size = New System.Drawing.Size(623, 45)
    Me.Frame1.TabIndex = 0
    Me.Frame1.TabStop = False
    '
    'Check2
    '
    Me.Check2.BackColor = System.Drawing.SystemColors.Control
    Me.Check2.Cursor = System.Windows.Forms.Cursors.Default
    Me.Check2.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
    Me.Check2.ForeColor = System.Drawing.SystemColors.ControlText
    Me.Check2.Location = New System.Drawing.Point(450, 17)
    Me.Check2.Name = "Check2"
    Me.Check2.RightToLeft = System.Windows.Forms.RightToLeft.No
    Me.Check2.Size = New System.Drawing.Size(43, 18)
    Me.Check2.TabIndex = 5
    Me.Check2.Text = "2D"
    '
    'Check1
    '
    Me.Check1.BackColor = System.Drawing.SystemColors.Control
    Me.Check1.Cursor = System.Windows.Forms.Cursors.Default
    Me.Check1.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
    Me.Check1.ForeColor = System.Drawing.SystemColors.ControlText
    Me.Check1.Location = New System.Drawing.Point(322, 14)
    Me.Check1.Name = "Check1"
    Me.Check1.RightToLeft = System.Windows.Forms.RightToLeft.No
    Me.Check1.Size = New System.Drawing.Size(117, 22)
    Me.Check1.TabIndex = 4
    Me.Check1.Text = "Move Grid to front"
    '
    'Command2
    '
    Me.Command2.BackColor = System.Drawing.SystemColors.Control
    Me.Command2.Cursor = System.Windows.Forms.Cursors.Default
    Me.Command2.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
    Me.Command2.ForeColor = System.Drawing.SystemColors.ControlText
    Me.Command2.Location = New System.Drawing.Point(156, 11)
    Me.Command2.Name = "Command2"
    Me.Command2.RightToLeft = System.Windows.Forms.RightToLeft.No
    Me.Command2.Size = New System.Drawing.Size(151, 28)
    Me.Command2.TabIndex = 2
    Me.Command2.Text = "Then add Axes for Series2"
    '
    'Command1
    '
    Me.Command1.BackColor = System.Drawing.SystemColors.Control
    Me.Command1.Cursor = System.Windows.Forms.Cursors.Default
    Me.Command1.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
    Me.Command1.ForeColor = System.Drawing.SystemColors.ControlText
    Me.Command1.Location = New System.Drawing.Point(9, 12)
    Me.Command1.Name = "Command1"
    Me.Command1.RightToLeft = System.Windows.Forms.RightToLeft.No
    Me.Command1.Size = New System.Drawing.Size(143, 27)
    Me.Command1.TabIndex = 1
    Me.Command1.Text = "Scale Axes for Series1"
    '
    'Form1
    '
    Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
    Me.ClientSize = New System.Drawing.Size(571, 413)
    Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.TChart1, Me.TeeCommander1, Me.Frame1})
    Me.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
    Me.Location = New System.Drawing.Point(4, 23)
    Me.Name = "Form1"
    Me.Text = "Form1"
    CType(Me.TChart1, System.ComponentModel.ISupportInitialize).EndInit()
    CType(Me.TeeCommander1, System.ComponentModel.ISupportInitialize).EndInit()
    Me.Frame1.ResumeLayout(False)
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
	Private Sub Check1_CheckStateChanged(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Check1.CheckStateChanged
		If Check1.CheckState = 1 Then
			TChart1.Axis.DrawAxesBeforeSeries = False
		Else
			TChart1.Axis.DrawAxesBeforeSeries = True
		End If
		TChart1.Repaint()
	End Sub
	
	Private Sub Check2_CheckStateChanged(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Check2.CheckStateChanged
		With TChart1.Aspect
			If Check2.CheckState = 1 Then
				.View3D = False
				.Rotation = 360
				.Elevation = 360
			Else
				.View3D = True
			End If
		End With
	End Sub
	
	Private Sub Command1_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command1.Click
		Dim numVertaxis, numHorizaxis As Object
		
		With TChart1.Axis
			'reserve the lower part of the Chart for the Bar Series
			.Left.StartPosition = 50
			'Create a vertical Custom Axis
			numVertaxis = .AddCustom(False)
			numHorizaxis = .AddCustom(True)
			With .Custom(numVertaxis)
				.EndPosition = 40
				.AxisPen.Color = System.Convert.ToUInt32(System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.Cyan))
				.Title.Angle = 90
				.Ticks.Color = System.Convert.ToUInt32(System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.Cyan))
				.Title.Caption = "Deliveries (tons)"
                .Labels.Font.Color = System.Convert.ToUInt32(System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.Gray))

                .Title.Font.Color = System.Convert.ToUInt32(System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.Gray))
			End With
			With .Custom(numHorizaxis)
				.EndPosition = 35
				.AxisPen.Color = System.Convert.ToUInt32(System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.Cyan))
				.Ticks.Color = System.Convert.ToUInt32(System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.Cyan))
				.PositionPercent = 60
                .Labels.Font.Color = System.Convert.ToUInt32(System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.Gray))
			End With
			'Associate Series(1)
			TChart1.Series(1).VerticalAxisCustom = numVertaxis
			TChart1.Series(1).HorizontalAxisCustom = numHorizaxis
		End With
	End Sub
	
	Private Sub Command2_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command2.Click
		Dim numVertaxis, numHorizaxis As Object
		
		With TChart1.Axis
			'Create independantly scaled axes for Series(2)
			'UPGRADE_WARNING: Couldn't resolve default property of object numVertaxis. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
			numVertaxis = .AddCustom(False)
			'UPGRADE_WARNING: Couldn't resolve default property of object numHorizaxis. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
			numHorizaxis = .AddCustom(True)
			'UPGRADE_WARNING: Couldn't resolve default property of object numVertaxis. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
			With .Custom(numVertaxis)
				'UPGRADE_WARNING: Couldn't resolve default property of object numVertaxis. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
				.EndPosition = 45
				'UPGRADE_WARNING: Couldn't resolve default property of object numVertaxis. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
				.PositionPercent = 7 / 15 * 100
				'UPGRADE_WARNING: Couldn't resolve default property of object numVertaxis. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
				.AxisPen.Color = System.Convert.ToUInt32(System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.White))
				'UPGRADE_WARNING: Couldn't resolve default property of object numVertaxis. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
				.Ticks.Color = System.Convert.ToUInt32(System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.White))
				'UPGRADE_WARNING: Couldn't resolve default property of object numVertaxis. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
				.Title.Angle = 90
				'UPGRADE_WARNING: Couldn't resolve default property of object numVertaxis. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
				.Title.Font.Color = System.Convert.ToUInt32(System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.White))
				'UPGRADE_WARNING: Couldn't resolve default property of object numVertaxis. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
				.Title.Caption = "Variance"
				'UPGRADE_WARNING: Couldn't resolve default property of object numVertaxis. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
				.Title.Font.Color = System.Convert.ToUInt32(System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.White))
				'UPGRADE_WARNING: Couldn't resolve default property of object numVertaxis. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
                .Labels.Font.Color = System.Convert.ToUInt32(System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.Gray))
			End With
			'UPGRADE_WARNING: Couldn't resolve default property of object numHorizaxis. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
			With .Custom(numHorizaxis)
				'UPGRADE_WARNING: Couldn't resolve default property of object numHorizaxis. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
				.StartPosition = 7 / 15 * 100
				'UPGRADE_WARNING: Couldn't resolve default property of object numHorizaxis. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
				.AxisPen.Color = System.Convert.ToUInt32(System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.White))
				'UPGRADE_WARNING: Couldn't resolve default property of object numHorizaxis. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
				.Ticks.Color = System.Convert.ToUInt32(System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.White))
				'UPGRADE_WARNING: Couldn't resolve default property of object numHorizaxis. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
				.PositionPercent = 55
				'UPGRADE_WARNING: Couldn't resolve default property of object numHorizaxis. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
                .Labels.Font.Color = System.Convert.ToUInt32(System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.Gray))
			End With
			'Associate Series(2)
			'UPGRADE_WARNING: Couldn't resolve default property of object numVertaxis. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
			TChart1.Series(2).VerticalAxisCustom = numVertaxis
			'UPGRADE_WARNING: Couldn't resolve default property of object numHorizaxis. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
			TChart1.Series(2).HorizontalAxisCustom = numHorizaxis
		End With
	End Sub
	
	Private Sub Form1_Load(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Load
		Dim i As Object
		'Fill Series
		With TChart1
			For i = 1 To 15
				'UPGRADE_WARNING: Couldn't resolve default property of object i. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
				.Series(0).AddXY(i, Rnd(i) * 10, "", System.Convert.ToUInt32(TeeChart.EConstants.clTeeColor))
				'UPGRADE_WARNING: Couldn't resolve default property of object i. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
				If (i < 7) Or (i > 10) Then
					'UPGRADE_WARNING: Couldn't resolve default property of object i. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
					.Series(1).AddXY(i, Rnd(i) / 2, "", System.Convert.ToUInt32(TeeChart.EConstants.clTeeColor))
				Else
					'UPGRADE_WARNING: Couldn't resolve default property of object i. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
					.Series(1).AddNullXY(i, Rnd(i) / 2, "")
				End If
				'UPGRADE_WARNING: Couldn't resolve default property of object i. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup1037"'
				.Series(2).AddXY(i, Rnd(i) / 10, "", System.Convert.ToUInt32(TeeChart.EConstants.clTeeColor))
			Next i
			.Axis.Bottom.SetMinMax(0, 16)
		End With
		'Associate Chart with TeeCommander
        TeeCommander1.ChartLink = TChart1.ChartLink
	End Sub
	
	'UPGRADE_WARNING: Event Form1.Resize may fire when form is intialized. Click for more: 'ms-help://MS.VSCC/commoner/redir/redirect.htm?keyword="vbup2075"'
	Private Sub Form1_Resize(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Resize
		Frame1.Width = VB6.TwipsToPixelsX(VB6.PixelsToTwipsX(ClientRectangle.Width) + 30)
		TChart1.Height = VB6.TwipsToPixelsY(VB6.PixelsToTwipsY(ClientRectangle.Height) - VB6.PixelsToTwipsY(Frame1.Height) - VB6.PixelsToTwipsY(TeeCommander1.Height))
    Frame1.Top = VB6.TwipsToPixelsY(VB6.PixelsToTwipsY(TChart1.Height) + VB6.PixelsToTwipsY(TeeCommander1.Height))
	End Sub
	
	
	Private Sub TChart1_OnAfterDraw(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles TChart1.OnAfterDraw
		If TChart1.Aspect.Rotation <> 360 Then
			Check2.CheckState = System.Windows.Forms.CheckState.Unchecked
		End If
	End Sub
End Class
