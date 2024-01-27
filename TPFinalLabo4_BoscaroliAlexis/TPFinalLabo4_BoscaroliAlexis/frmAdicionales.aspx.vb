Imports System.Data.SqlClient

Public Class frmAdicionales
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.btActualizar.Visible = False ' Se oculta el boton actualizar
        Me.lblApeyNomSocio.Text = "" 'Se deja vacio el label de nombre y apellido
    End Sub

    Protected Sub btBuscar_Click(sender As Object, e As EventArgs) Handles btBuscar.Click

        Dim objSocios As New claSocio
        Dim dtsDataSet As New DataSet
        Dim intRetorno As Integer
        Dim strNroSocio As String

        Dim objAdicional As New claAdicionales
        Dim dtsAdicionalDataSet As New DataSet
        Dim intAdicionalRetorno As Integer

        strNroSocio = Me.txtNroSocio.Text.ToString.Trim

        If strNroSocio = "" Then  ' Se ejecuta si se deja vacio el textbox
            Me.lblApeyNomSocio.ForeColor = Drawing.Color.Blue
            Me.lblApeyNomSocio.Text = "Ingrese un Nº de Socio"
            Return
        End If


        intRetorno = objSocios.devSocioPorNroSocio(dtsDataSet, strNroSocio)

        If intRetorno > 0 Then
            Me.lblApeyNomSocio.Text = dtsDataSet.Tables(0).Rows(0).Item(15).Trim 'Busca el item 16 de la primera fila de la primera tabla del dataset (apellido y nombre)

            Me.lblApeyNomSocio.ForeColor = Drawing.Color.Blue

            intAdicionalRetorno = objAdicional.devEstadoDeAdicionalesPorNroSocio(dtsAdicionalDataSet, strNroSocio) 'Se intenta devolver los adicionales por socio

            If intAdicionalRetorno > 0 Then

                Me.gvAdicionalesSocios.DataSource = dtsAdicionalDataSet  ' Se llena el gridview
                Me.gvAdicionalesSocios.DataBind()

                Me.btActualizar.Visible = True

            End If
        Else
            Me.lblApeyNomSocio.ForeColor = Drawing.Color.Red 'No ocurre nada porque no se encontro el numero de socio
            Me.lblApeyNomSocio.Text = "Número de Socio Inexistente"
            Me.gvAdicionalesSocios.DataSource = Nothing
            Me.gvAdicionalesSocios.DataBind()
        End If

    End Sub

    Protected Sub btActualizar_Click(sender As Object, e As EventArgs) Handles btActualizar.Click
        For Each row As GridViewRow In gvAdicionalesSocios.Rows
            Dim strCodAdicional As String = DirectCast(row.FindControl("lblCodigo"), Label).Text 'Captura el codigo adicional
            Dim strNroSocio As String = txtNroSocio.Text 'Captura el numero de socio
            Dim chbAdherido As CheckBox = DirectCast(row.FindControl("chkAdherido"), CheckBox) 'Captura el checkbox 
            Dim strEstado As String
            Dim objAdicional As New claAdicionales

            If chbAdherido.Checked Then ' Pregunta si el checkbox esta chequeado
                If Not objAdicional.ExisteRegistro(strNroSocio, strCodAdicional) Then ' Pregunta si el registro ya esta en la base de datos
                    objAdicional.InsertarNuevoRegistro(strCodAdicional, strNroSocio) ' Si no estaba lo añade como activo
                Else
                    strEstado = "ACT"
                    objAdicional.ActualizarEstado(strCodAdicional, strNroSocio, strEstado) ' Si no estaba chequeado y se chequea se pasa el estado activo
                End If
            Else
                strEstado = "BAJ"
                objAdicional.ActualizarEstado(strCodAdicional, strNroSocio, strEstado) ' Si estaba chequeado y se quita se pasa el estado baja
            End If


        Next



    End Sub


End Class