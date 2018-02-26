<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
    Inherits System.Windows.Forms.Form


    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

 
    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Form1))
        Me.ToolTip1 = New System.Windows.Forms.ToolTip(Me.components)
        Me.Check2 = New System.Windows.Forms.CheckBox
        Me.Frame1 = New System.Windows.Forms.GroupBox
        Me.Command3 = New System.Windows.Forms.Button
        Me.Label1 = New System.Windows.Forms.Label
        Me.Command2 = New System.Windows.Forms.Button
        Me.Check1 = New System.Windows.Forms.CheckBox
        Me.Command1 = New System.Windows.Forms.Button
        Me.TChart1 = New AxTeeChart.AxTChart
        Me.Frame1.SuspendLayout()
        CType(Me.TChart1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'Check2
        '
        Me.Check2.BackColor = System.Drawing.SystemColors.Control
        Me.Check2.Checked = True
        Me.Check2.CheckState = System.Windows.Forms.CheckState.Checked
        Me.Check2.Cursor = System.Windows.Forms.Cursors.Default
        Me.Check2.ForeColor = System.Drawing.SystemColors.ControlText
        Me.Check2.Location = New System.Drawing.Point(344, 528)
        Me.Check2.Name = "Check2"
        Me.Check2.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.Check2.Size = New System.Drawing.Size(161, 13)
        Me.Check2.TabIndex = 7
        Me.Check2.Text = "Draw First X at Pixel Only"
        Me.Check2.UseVisualStyleBackColor = False
        '
        'Frame1
        '
        Me.Frame1.BackColor = System.Drawing.SystemColors.Control
        Me.Frame1.Controls.Add(Me.Command3)
        Me.Frame1.Controls.Add(Me.Label1)
        Me.Frame1.ForeColor = System.Drawing.SystemColors.ControlText
        Me.Frame1.Location = New System.Drawing.Point(16, 560)
        Me.Frame1.Name = "Frame1"
        Me.Frame1.Padding = New System.Windows.Forms.Padding(0)
        Me.Frame1.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.Frame1.Size = New System.Drawing.Size(505, 65)
        Me.Frame1.TabIndex = 4
        Me.Frame1.TabStop = False
        Me.Frame1.Text = "Load historical data"
        '
        'Command3
        '
        Me.Command3.BackColor = System.Drawing.SystemColors.Control
        Me.Command3.Cursor = System.Windows.Forms.Cursors.Default
        Me.Command3.ForeColor = System.Drawing.SystemColors.ControlText
        Me.Command3.Location = New System.Drawing.Point(16, 24)
        Me.Command3.Name = "Command3"
        Me.Command3.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.Command3.Size = New System.Drawing.Size(341, 29)
        Me.Command3.TabIndex = 5
        Me.Command3.Text = "Load historical data of 50,000 points then continue real-time update"
        Me.Command3.UseVisualStyleBackColor = False
        '
        'Label1
        '
        Me.Label1.BackColor = System.Drawing.SystemColors.Control
        Me.Label1.Cursor = System.Windows.Forms.Cursors.Default
        Me.Label1.ForeColor = System.Drawing.SystemColors.ControlText
        Me.Label1.Location = New System.Drawing.Point(372, 16)
        Me.Label1.Name = "Label1"
        Me.Label1.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.Label1.Size = New System.Drawing.Size(121, 37)
        Me.Label1.TabIndex = 6
        Me.Label1.Text = "TeeChart may load large datasets as Arrays 'en-block'."
        '
        'Command2
        '
        Me.Command2.BackColor = System.Drawing.SystemColors.Control
        Me.Command2.Cursor = System.Windows.Forms.Cursors.Default
        Me.Command2.ForeColor = System.Drawing.SystemColors.ControlText
        Me.Command2.Location = New System.Drawing.Point(1064, 600)
        Me.Command2.Name = "Command2"
        Me.Command2.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.Command2.Size = New System.Drawing.Size(77, 25)
        Me.Command2.TabIndex = 3
        Me.Command2.Text = "&Close"
        Me.Command2.UseVisualStyleBackColor = False
        '
        'Check1
        '
        Me.Check1.BackColor = System.Drawing.SystemColors.Control
        Me.Check1.Checked = True
        Me.Check1.CheckState = System.Windows.Forms.CheckState.Checked
        Me.Check1.Cursor = System.Windows.Forms.Cursors.Default
        Me.Check1.ForeColor = System.Drawing.SystemColors.ControlText
        Me.Check1.Location = New System.Drawing.Point(152, 528)
        Me.Check1.Name = "Check1"
        Me.Check1.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.Check1.Size = New System.Drawing.Size(141, 17)
        Me.Check1.TabIndex = 2
        Me.Check1.Text = "Use Fast Add RealTime"
        Me.Check1.UseVisualStyleBackColor = False
        '
        'Command1
        '
        Me.Command1.BackColor = System.Drawing.SystemColors.Control
        Me.Command1.Cursor = System.Windows.Forms.Cursors.Default
        Me.Command1.ForeColor = System.Drawing.SystemColors.ControlText
        Me.Command1.Location = New System.Drawing.Point(16, 520)
        Me.Command1.Name = "Command1"
        Me.Command1.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.Command1.Size = New System.Drawing.Size(109, 29)
        Me.Command1.TabIndex = 1
        Me.Command1.Text = "Start Example !"
        Me.Command1.UseVisualStyleBackColor = False
        '
        'TChart1
        '
        Me.TChart1.Dock = System.Windows.Forms.DockStyle.Top
        Me.TChart1.Enabled = True
        Me.TChart1.Location = New System.Drawing.Point(0, 0)
        Me.TChart1.Name = "TChart1"
        Me.TChart1.OcxState = CType(resources.GetObject("TChart1.OcxState"), System.Windows.Forms.AxHost.State)
        Me.TChart1.Size = New System.Drawing.Size(1158, 493)
        Me.TChart1.TabIndex = 0
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.SystemColors.Control
        Me.ClientSize = New System.Drawing.Size(1158, 639)
        Me.Controls.Add(Me.Check2)
        Me.Controls.Add(Me.TChart1)
        Me.Controls.Add(Me.Frame1)
        Me.Controls.Add(Me.Command2)
        Me.Controls.Add(Me.Check1)
        Me.Controls.Add(Me.Command1)
        Me.Cursor = System.Windows.Forms.Cursors.Default
        Me.Location = New System.Drawing.Point(181, 166)
        Me.Name = "Form1"
        Me.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.StartPosition = System.Windows.Forms.FormStartPosition.Manual
        Me.Text = "TeeChart Pro  -- Real-Time Example"
        Me.Frame1.ResumeLayout(False)
        CType(Me.TChart1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents TChart1 As AxTeeChart.AxTChart


    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer
    Public ToolTip1 As System.Windows.Forms.ToolTip

    Public WithEvents Check2 As System.Windows.Forms.CheckBox
    Public WithEvents Command3 As System.Windows.Forms.Button
    Public WithEvents Label1 As System.Windows.Forms.Label
    Public WithEvents Frame1 As System.Windows.Forms.GroupBox
    Public WithEvents Command2 As System.Windows.Forms.Button
    Public WithEvents Check1 As System.Windows.Forms.CheckBox
    Public WithEvents Command1 As System.Windows.Forms.Button

End Class