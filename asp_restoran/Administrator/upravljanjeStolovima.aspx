<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="upravljanjeStolovima.aspx.cs" Inherits="asp_restoran.Administrator.upravljanjeStolovima" %>
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
            <td colspan="3">Unos</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LabelNazivStola" runat="server" Text="Naziv"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxNazivStola" runat="server"></asp:TextBox>
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


          <asp:GridView ID="GridViewAdminSto" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceGridViewAdminSto" CellPadding="4" ForeColor="#333333" GridLines="None" Height="302px" Style="margin-left: 413px" Width="336px" AllowPaging="True" DataKeyNames="IdSto" OnRowDeleted="GridViewAdminSto_RowDeleted" OnRowUpdated="GridViewAdminSto_RowUpdated">
              <AlternatingRowStyle BackColor="White" />
              <Columns>
                  <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                  <asp:BoundField DataField="IdSto" HeaderText="IdSto" ReadOnly="True" SortExpression="IdSto" Visible="False"></asp:BoundField>
                  <asp:BoundField DataField="Sto" HeaderText="Sto" SortExpression="Sto"></asp:BoundField>
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
          <asp:SqlDataSource ID="SqlDataSourceGridViewAdminSto" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Sto]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Sto] WHERE [IdSto] = @original_IdSto AND [Sto] = @original_Sto" InsertCommand="INSERT INTO [Sto] ([IdSto], [Sto]) VALUES (@IdSto, @Sto)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Sto] SET [Sto] = @Sto WHERE [IdSto] = @original_IdSto AND [Sto] = @original_Sto">
              <DeleteParameters>
                  <asp:Parameter Name="original_IdSto" Type="Int32"></asp:Parameter>
                  <asp:Parameter Name="original_Sto" Type="String"></asp:Parameter>
              </DeleteParameters>
              <InsertParameters>
                  <asp:Parameter Name="IdSto" Type="Int32"></asp:Parameter>
                  <asp:Parameter Name="Sto" Type="String"></asp:Parameter>
              </InsertParameters>
              <UpdateParameters>
                  <asp:Parameter Name="Sto" Type="String"></asp:Parameter>
                  <asp:Parameter Name="original_IdSto" Type="Int32"></asp:Parameter>
                  <asp:Parameter Name="original_Sto" Type="String"></asp:Parameter>
              </UpdateParameters>
          </asp:SqlDataSource>

           </div>
</asp:Content>
