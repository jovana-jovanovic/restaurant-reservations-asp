<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="Jelovnik.aspx.cs" Inherits="asp_restoran.Jelovnik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSlider" runat="server">
     <div class="reservation_banner">
		<div class="main_title">Online Reservation Form</div>
		<div class="divider"></div>
	 </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
     <div class="reservation_top">
           <div class="container">
             <div class="row" style="font-size: 14px; text-align: -webkit-center;">
                 <asp:GridView ID="GridViewJelovnik" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceJelovnik" AllowPaging="True" CellPadding="2" ForeColor="Black" GridLines="None" Height="365px" Width="733px" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px">
                     <AlternatingRowStyle BackColor="PaleGoldenrod" />
                     <Columns>
                         <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" Visible="False"></asp:BoundField>
                         <asp:BoundField DataField="naziv" HeaderText="Naziv jela" SortExpression="naziv">
                         <ControlStyle CssClass="table table-striped" />
                         </asp:BoundField>
                         <asp:BoundField DataField="cena" HeaderText="cena" SortExpression="cena"></asp:BoundField>
                     </Columns>
                     <FooterStyle BackColor="Tan" />
                     <HeaderStyle BackColor="Tan" Font-Bold="True" />
                     <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                     <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                     <SortedAscendingCellStyle BackColor="#FAFAE7" />
                     <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                     <SortedDescendingCellStyle BackColor="#E1DB9C" />
                     <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSourceJelovnik" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Jelovnik]"></asp:SqlDataSource>
            </div>
           </div>
         
	     </div>
</asp:Content>
