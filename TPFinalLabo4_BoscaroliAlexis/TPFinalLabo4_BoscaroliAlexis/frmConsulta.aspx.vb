Imports System.Data.SqlClient

Public Class frmConsulta
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btBuscar_Click(sender As Object, e As EventArgs) Handles btBuscar.Click
        Dim objSocios As New claSocio
        Dim dtsDataSet As New DataSet
        Dim intRetorno As Integer
        Dim strApellido As String

        strApellido = Me.txtApellido.Text.ToString.Trim

        intRetorno = objSocios.devSocioPorApellido(dtsDataSet, strApellido) ' Trata de devolver el socio por apellido


        If intRetorno > 0 Then
            Me.lblMensaje.Text = ""
            Me.gvSocios.DataSource = dtsDataSet  ' Se llena el gridview
            Me.gvSocios.DataBind()
        Else
            Me.lblMensaje.Text = "Vuelva a Ingresar Apellido" 'Si hay un error se muestra este mensaje
            Return
        End If

    End Sub
End Class

