Public Class Form1

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        AxTChart1.Panel.Color = Convert.ToUInt32(ColorTranslator.ToOle(Color.Transparent))

        AxTChart1.Walls.Back.Visible = False
        AxTChart1.Series(0).FillSampleValues()

        PictureBox1.SizeMode = PictureBoxSizeMode.StretchImage
    End Sub

    Dim Back As Bitmap

    Private Sub AxTChart1_OnBeforeDrawChart(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AxTChart1.OnBeforeDrawChart
        If Back Is Nothing Then
            Back = New Bitmap(AxTChart1.Width, AxTChart1.Height)
            Dim srcImage As Bitmap = GetStretchedImage(PictureBox1.Image)
            Dim ClientRect As Rectangle = New Rectangle(0, 0, AxTChart1.Width, AxTChart1.Height)
            Dim ChartBounds As Rectangle = New Rectangle(AxTChart1.Location.X, AxTChart1.Location.Y, _
                                                         AxTChart1.Width, AxTChart1.Height)

            Back = CopyRect(srcImage, ClientRect, ChartBounds)
        End If

        If AxTChart1.Panel.Color = Convert.ToUInt32(ColorTranslator.ToOle(Color.Transparent)) Then
            Dim backImage As stdole.IPictureDisp = AxHostConverter.ImageToPictureDisp(Back)
            AxTChart1.Canvas.Draw(0, 0, backImage)
        End If
    End Sub

    Public Overloads Shared Function CopyRect(ByVal srcBitmap As Bitmap, _
        ByVal destRect As Rectangle, ByVal srcRect As Rectangle) As Bitmap

        ' Create the new bitmap and associated graphics object
        Dim bmp As New Bitmap(srcRect.Width, srcRect.Height)
        Dim g As Graphics = Graphics.FromImage(bmp)

        'Draws the specified portion of the specified Image at the specified location and with the specified size.
        g.DrawImage(srcBitmap, destRect, srcRect, GraphicsUnit.Pixel)

        ' Clean up
        g.Dispose()

        ' Return the bitmap
        Return bmp

    End Function

    Private Function GetStretchedImage(ByVal image As Image) As Bitmap
        If PictureBox1.SizeMode = PictureBoxSizeMode.StretchImage Then
            Dim bmp As Bitmap = New Bitmap(PictureBox1.Width, PictureBox1.Height)

            Dim g As Graphics = Graphics.FromImage(bmp)
            g.InterpolationMode = Drawing2D.InterpolationMode.NearestNeighbor
            g.DrawImage(image, New Rectangle(Point.Empty, bmp.Size))

            Return bmp
        Else
            Return image
        End If
    End Function

End Class
