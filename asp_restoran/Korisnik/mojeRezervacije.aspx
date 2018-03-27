<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="mojeRezervacije.aspx.cs" Inherits="asp_restoran.Korisnik.mojeRezervacije" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSlider" runat="server">
     <div class="reservation_banner">
		<div class="main_title">Online Reservation Form</div>
		<div class="divider"></div>
	 </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
      <br/><br/><br/>
      <div class="header">    
		<div class="header_top">
			<div class="container">
			  <div class="headertop_nav">
				<ul>
					<li><a href="rezervacija.aspx">Rezervisi sto</a> /</li>
					<li><a href="mojeRezervacije.aspx">Moje rezervacije</a> /</li> 
					
                                </ul>
			</div>
		    
			 <div class="clearfix"></div>
            </div>
		  </div>
         	
          
	
           
        </div>
      <div class="reservation_grid"><br /><br /><br />
          <asp:TextBox ID="TextBoxKorisnik" runat="server" Visible="false"></asp:TextBox>
          <asp:GridView ID="GridViewRezervacije" runat="server" AutoGenerateColumns="False" DataKeyNames="IdRezervacija" DataSourceID="SqlDataSourceGridViewRezervacije" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" style="margin-left: 364px">
              <Columns>
                  <asp:BoundField DataField="IdRezervacija" HeaderText="IdRezervacija" ReadOnly="True" InsertVisible="False" SortExpression="IdRezervacija" Visible="false"></asp:BoundField>
                  <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum">
                  </asp:BoundField>
                  
                  <asp:BoundField DataField="VremePocetka" HeaderText="VremePocetka" SortExpression="VremePocetka"></asp:BoundField>
                  <asp:BoundField DataField="VremeKraja" HeaderText="VremeKraja" SortExpression="VremeKraja"></asp:BoundField>
                  <asp:BoundField DataField="IdSto" HeaderText="IdSto" SortExpression="IdSto" Visible="false"></asp:BoundField>
                  <asp:BoundField DataField="Korisnik" HeaderText="Korisnik" SortExpression="Korisnik"></asp:BoundField>
                  <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" Visible="false"></asp:BoundField>
                  <asp:TemplateField HeaderText="Status rezervacije" Visible="false">
                    <ItemTemplate>
                        <asp:TextBox ID="TextBoxDatum" runat="server" Text='<%# Bind("Datum") %>' Visible="false"></asp:TextBox>
                         </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="Status rezervacije">
                      
                    <ItemTemplate>
                    
                        <asp:Label ID="LabelStatusRezervacije" runat="server" Text="Zavrsena" ></asp:Label>
                        <asp:LinkButton ID="LinkButtonStatusRezervacije" runat="server" 
                             CommandArgument='<%# Bind("IdRezervacija") %>' OnClick="LinkButtonStatusRezervacije_Click" >Otkazi</asp:LinkButton>
                        
                    </ItemTemplate>
                </asp:TemplateField>
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
          <asp:SqlDataSource ID="SqlDataSourceGridViewRezervacije" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Rezervacija] where Korisnik=@korisnik">
               <SelectParameters>
                <asp:ControlParameter ControlID="TextBoxKorisnik" Name="korisnik" PropertyName="Text" />
                <asp:Parameter Name="Svi" DefaultValue="0" />
            </SelectParameters>

          </asp:SqlDataSource>
          </div><br /><br />
</asp:Content>
