<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="izmenaKorisnika.aspx.cs" Inherits="asp_restoran.Administrator.izmenaKorisnika" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSlider" runat="server">
     <div class="reservation_banner">
		<div class="main_title">Online Reservation Form</div>
		<div class="divider"></div>
	 </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div class="header">    
		<div class="header_top">
			<div class="container">
			  <div class="headertop_nav">
				<ul>
					<li><a href="upravljanjeStolovima.aspx">Upravljaj stolovima</a> /</li>
					<li><a href="upravljanjeKorisnicima.aspx">Upravljaj korisnicima</a> /</li> 
					<li><a href="upravljanjeJelovnikom.aspx">Upravljaj jelovnikom</a> /</li> 
					<li><a href="upravljanjeSlikama.aspx">Upravljaj galerijom slika</a>/</li> 
				        <li><a href="upravljanjeLogovima.aspx">Upravljaj logovima</a></li> 
                                   
                                </ul>
			</div>
		    
			 <div class="clearfix"></div>
            </div>
		  </div>
         	
          
	
           
        </div>
      <div class="reservation_grid"><br /><br /><br />
            <table style="margin-left:350px;" >
        <tr>
            <td colspan="3">Unos/izmena slika</td>
        </tr>
        <tr>
            <td>
                 <asp:TextBox ID="TextBoxId" runat="server" Visible="false"></asp:TextBox>
                <asp:Label ID="LabelIme" runat="server" Text="Ime"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxIme" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
                <tr>
            <td>
                <asp:Label ID="LabelPreime" runat="server" Text="Prezime"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxPrezime" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
                    <tr>
            <td>
                <asp:Label ID="LabelGodinaRodjenja" runat="server" Text="Godina rodjenja"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxGodinaRodjenja" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
       
        
       
            <td colspan="3">
                <asp:Button ID="ButtonIzmeniKorisnika" runat="server" Text="Izmeni" OnClick="ButtonIzmeniKorisnika_Click" />
            </td>
        </tr>
    </table>
    
          <br />
          </div>
</asp:Content>
