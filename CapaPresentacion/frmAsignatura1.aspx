<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmAsignatura1.aspx.cs" Inherits="CapaPresentacion.frmAsignatura1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <p>Matenimiento de la tabla Asignatura</p>
    <p>
        CodAsignatura<asp:TextBox runat="server" ID ="txtCodAsignatura"></asp:TextBox>
          </p>
      <p>
        Nomb_asignatura<asp:TextBox runat="server" ID ="txtNomb_asignatura"></asp:TextBox>
          </p>
   
    <p>
      Creditos<asp:TextBox runat="server" ID ="txtCreditos"></asp:TextBox>
          </p>
   
  
       <p>
        <asp:Button Text="Agregar" runat="server" ID ="btnAgregar" CssClass="btn btn-primary" OnClick="btnAgregar_Click" />
        <asp:Button Text="Eliminar" runat="server" ID ="btnEliminar" CssClass="btn btn-warning" OnClick="btnEliminar_Click" />
         <asp:Button Text="Actualizar" runat="server" ID ="btnActualizarr" CssClass="btn btn-success" OnClick="btnActualizar_Click" />
            </p>
      <p>
                    <asp:TextBox runat="server" ID="txtBuscar"></asp:TextBox>
                    <asp:Button runat="server" ID="btnBuscar" Text ="Buscar" OnClick="btnBuscar_Click" CssClass="btn btn-danger" />
                </p>
    
    <p>
        <asp:GridView runat="server" ID ="gvAsignatura"></asp:GridView>
            </p>

   <p>
        <asp:Label Text="Mensaje" runat="server" ID="lblMensaje"/>
     </p>
</asp:Content>
