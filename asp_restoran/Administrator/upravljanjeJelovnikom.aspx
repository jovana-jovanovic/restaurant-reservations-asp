<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="upravljanjeJelovnikom.aspx.cs" Inherits="asp_restoran.Administrator.upravljanjeJelovnikom" %>
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
            <td colspan="3">Unos</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LabelNazivJela" runat="server" Text="Naziv"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxNazivJela" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
               <tr>
            <td>
                <asp:Label ID="LabelCena" runat="server" Text="Cena"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxCena" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        
        
        
        <tr>
            <td colspan="3">
                <asp:Button ID="ButtonUnesi" runat="server" Text="Unesi" OnClick="ButtonUnesi_Click"   />
            </td>
        </tr>
    </table>
    
          <br />

          <asp:GridView ID="GridViewAdminJelovnik" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceGridViewAdminJelovnik" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" Height="324px" style="margin-left: 343px; margin-right: 0px" Width="426px" OnRowUpdated="GridViewAdminJelovnik_RowUpdated" OnRowDeleted="GridViewAdminJelovnik_RowDeleted">
              <AlternatingRowStyle BackColor="White" />
              <Columns>
                  <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                  <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" Visible="False"></asp:BoundField>
                  <asp:BoundField DataField="naziv" HeaderText="Naziv jela" SortExpression="naziv"></asp:BoundField>
                  <asp:BoundField DataField="cena" HeaderText="Cena" SortExpression="cena"></asp:BoundField>
              </Columns>
              <EditRowStyle BackColor="#7C6F57" />
              <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
              <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
              <RowStyle BackColor="#E3EAEB" />
              <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
              <SortedAscendingCellStyle BackColor="#F8FAFA" />
              <SortedAscendingHeaderStyle BackColor="#246B61" />
              <SortedDescendingCellStyle BackColor="#D4DFE1" />
              <SortedDescendingHeaderStyle BackColor="#15524A" />
          </asp:GridView><br /><br />
          <asp:SqlDataSource ID="SqlDataSourceGridViewAdminJelovnik" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Jelovnik]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Jelovnik] WHERE [Id] = @original_Id AND [naziv] = @original_naziv AND [cena] = @original_cena" InsertCommand="INSERT INTO [Jelovnik] ([Id], [naziv], [cena]) VALUES (@Id, @naziv, @cena)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Jelovnik] SET [naziv] = @naziv, [cena] = @cena WHERE [Id] = @original_Id AND [naziv] = @original_naziv AND [cena] = @original_cena">
              <DeleteParameters>
                  <asp:Parameter Name="original_Id" Type="Int32"></asp:Parameter>
                  <asp:Parameter Name="original_naziv" Type="String"></asp:Parameter>
                  <asp:Parameter Name="original_cena" Type="Int32"></asp:Parameter>
              </DeleteParameters>
              <InsertParameters>
                  <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                  <asp:Parameter Name="naziv" Type="String"></asp:Parameter>
                  <asp:Parameter Name="cena" Type="Int32"></asp:Parameter>
              </InsertParameters>
              <UpdateParameters>
                  <asp:Parameter Name="naziv" Type="String"></asp:Parameter>
                  <asp:Parameter Name="cena" Type="Int32"></asp:Parameter>
                  <asp:Parameter Name="original_Id" Type="Int32"></asp:Parameter>
                  <asp:Parameter Name="original_naziv" Type="String"></asp:Parameter>
                  <asp:Parameter Name="original_cena" Type="Int32"></asp:Parameter>
              </UpdateParameters>
          </asp:SqlDataSource>
          </div>
</asp:Content>
