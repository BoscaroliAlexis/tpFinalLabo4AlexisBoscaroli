<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/master.Master" CodeBehind="frmConsulta.aspx.vb" Inherits="TPFinalLabo4_BoscaroliAlexis.frmConsulta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row mt-2">
        <div class="col-12 col-md-6">

            <div class="row">
                <div class="col">
                    <h4>Consulta Socio</h4>
                </div>
            </div>
            
            <div class="row">
                <div class="col">
                    <h5>
                        <asp:Label ID="lblMensaje" runat="server" Text="" ForeColor="Red"></asp:Label></h5>
                </div>
            </div>

            <div class="row">
                <div class="col-6">
                    Apellido
                </div>
                <div class="col-6">
                    
                </div>
            </div>

            <div class="row">
                <div class="col-6">
                    <asp:TextBox ID="txtApellido" AutoCompleteType="Disabled" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-6">
                    <asp:Button ID="btBuscar" runat="server" CssClass="btn btn-primary" Text="Buscar" />
                </div>
            </div>
            <hr />

            <div class="row mt-1">
                <div class="col">
                    <asp:GridView ID="gvSocios" CssClass="table table-sm" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:HyperLinkField 
                                DataNavigateUrlFields="apynom,nro_socio_int" 
                                DataNavigateUrlFormatString="frmDetalles.aspx?apynom={0}&nro_socio_int={1}" 
                                DataTextField="apynom" 
                                HeaderText="Socio">
                            </asp:HyperLinkField>

                            <asp:BoundField DataField="nro_socio_int" HeaderText="Nro Socio" Visible="False">
                                <HeaderStyle CssClass="d-none d-md-block" />
                                <ItemStyle CssClass="d-none d-md-block" />
                            </asp:BoundField>

                            <asp:BoundField DataField="nro_documento" HeaderText="DNI">
                                <HeaderStyle CssClass="d-none d-md-block" />
                                <ItemStyle CssClass="d-none d-md-block" />
                            </asp:BoundField>

                            <asp:BoundField DataField="telefonos" HeaderText="Telefono">
                                <HeaderStyle Width="15%"></HeaderStyle>
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
