<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="upravljanjeLogovima.aspx.cs" Inherits="asp_restoran.Administrator.upravljanjeLogovima" %>
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
          <asp:GridView ID="GridViewLogovi" runat="server" AutoGenerateColumns="False" DataKeyNames="IdLog" DataSourceID="SqlDataSourceGridViewLogovi" AllowPaging="True" CellPadding="3" Style="margin-left: 360px" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
              <Columns>
                  <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
                  <asp:BoundField DataField="IdLog" HeaderText="IdLog" ReadOnly="True" InsertVisible="False" SortExpression="IdLog" Visible="false"></asp:BoundField>
                  <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum"></asp:BoundField>
                  <asp:BoundField DataField="IdTabela" HeaderText="IdTabela" SortExpression="IdTabela" Visible="false"></asp:BoundField>
                  <asp:BoundField DataField="IdPromena" HeaderText="IdPromena" SortExpression="IdPromena" Visible="false"></asp:BoundField>
                  <asp:BoundField DataField="Promena" HeaderText="Promena" SortExpression="Promena"></asp:BoundField>
                  <asp:BoundField DataField="Tabela" HeaderText="Tabela" SortExpression="Tabela"></asp:BoundField>

                  <asp:BoundField DataField="Korisnik" HeaderText="Korisnik" SortExpression="Korisnik"></asp:BoundField>
              </Columns>
              <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
              <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
              <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
              <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
              <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#FFF1D4" />
              <SortedAscendingHeaderStyle BackColor="#B95C30" />
              <SortedDescendingCellStyle BackColor="#F1E5CE" />
              <SortedDescendingHeaderStyle BackColor="#93451F" />
          </asp:GridView>
          <asp:SqlDataSource ID="SqlDataSourceGridViewLogovi" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Log] join Tabela on Log.IdTabela=Tabela.IdTabela join Promena on Log.IdPromena=Promena.IdPromena" OldValuesParameterFormatString="original_{0}">
          </asp:SqlDataSource>
          

          </div>

</asp:Content>
