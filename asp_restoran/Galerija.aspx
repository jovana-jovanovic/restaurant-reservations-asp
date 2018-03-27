<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="Galerija.aspx.cs" Inherits="asp_restoran.Galerija" %>
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
             <div class="row">
              
                        <div class="galerija">
 <h3>Galerija</h3>
 <ul class="row" id="lightGallery">

 
     <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSourceListViewGalerija">

         <ItemTemplate>
             <div class="col-lg-2 col-md-3 col-xs-6">
                 <asp:Image ID="Slika" runat="server" Width="100px" Height="100px" ImageUrl='<%# Bind("Putanja") %>'/>
             </div>
         </ItemTemplate>

     </asp:ListView>
     <asp:SqlDataSource ID="SqlDataSourceListViewGalerija" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Galerija]"></asp:SqlDataSource>
 
 
 </ul><br/><br/>
</div>

            </div>
              
           </div>
	     </div>
                 
</asp:Content>
