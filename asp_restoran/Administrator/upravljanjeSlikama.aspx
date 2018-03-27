<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="upravljanjeSlikama.aspx.cs" Inherits="asp_restoran.Administrator.upravljanjeSlikama" %>
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
                <asp:Label ID="LabelNaziv" runat="server" Text="Naziv"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxNaziv" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        
        
        <tr>
             <td>
                <asp:Label ID="LabelSlika" runat="server" Text="Slika"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="FileUploadSlika" runat="server" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Button ID="ButtonUnesi" runat="server" Text="Unesi" OnClick="ButtonUnesi_Click"  />
            </td>
        </tr>
    </table>
    
          <br />

          <asp:GridView ID="GridViewSlike" runat="server" Style="margin-left: 309px" Width="388px" AutoGenerateColumns="False" DataKeyNames="IdSlika" DataSourceID="SqlDataSourceGridViewSlike" AllowPaging="True" OnRowDeleting="GridViewSlike_RowDeleting" OnRowEditing="GridViewSlike_RowEditing" OnRowUpdating="GridViewSlike_RowUpdating" OnRowDeleted="GridViewSlike_RowDeleted" OnRowUpdated="GridViewSlike_RowUpdated">
              <Columns>
                  <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                  <asp:BoundField DataField="IdSlika" HeaderText="IdSlika" ReadOnly="True" InsertVisible="False" SortExpression="IdSlika" Visible="false"></asp:BoundField>
                  <asp:BoundField DataField="Naziv" HeaderText="Naziv" SortExpression="Naziv"></asp:BoundField>
                  <asp:TemplateField HeaderText="Slika">
                    <ItemTemplate>
                        <asp:Image ID="Slika" runat="server" Width="100" ImageUrl='<%# Bind("Putanja") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Image ID="Slika" runat="server" Width="100" ImageUrl='<%# Bind("Putanja") %>' />
                        <asp:FileUpload ID="FileUploadEditSlika" runat="server" />
                    </EditItemTemplate>
                </asp:TemplateField>
               
                  <asp:BoundField DataField="Mala" HeaderText="Mala" SortExpression="Mala" Visible="false"></asp:BoundField>
              </Columns>
          </asp:GridView>

          <asp:SqlDataSource ID="SqlDataSourceGridViewSlike" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Galerija]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Galerija] WHERE [IdSlika] = @original_IdSlika AND [Naziv] = @original_Naziv AND [Putanja] = @original_Putanja AND (([Mala] = @original_Mala) OR ([Mala] IS NULL AND @original_Mala IS NULL))" InsertCommand="INSERT INTO [Galerija] ([Naziv], [Putanja], [Mala]) VALUES (@Naziv, @Putanja, @Mala)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Galerija] SET [Naziv] = @Naziv, [Putanja] = @Putanja, [Mala] = @Mala WHERE [IdSlika] = @original_IdSlika AND [Naziv] = @original_Naziv AND [Putanja] = @original_Putanja AND (([Mala] = @original_Mala) OR ([Mala] IS NULL AND @original_Mala IS NULL))">
              <DeleteParameters>
                  <asp:Parameter Name="original_IdSlika" Type="Int32"></asp:Parameter>
                  <asp:Parameter Name="original_Naziv" Type="String"></asp:Parameter>
                  <asp:Parameter Name="original_Putanja" Type="String"></asp:Parameter>
                  <asp:Parameter Name="original_Mala" Type="String"></asp:Parameter>
              </DeleteParameters>
              <InsertParameters>
                  <asp:Parameter Name="Naziv" Type="String"></asp:Parameter>
                  <asp:Parameter Name="Putanja" Type="String"></asp:Parameter>
                  <asp:Parameter Name="Mala" Type="String"></asp:Parameter>
              </InsertParameters>
              <UpdateParameters>
                  <asp:Parameter Name="Naziv" Type="String"></asp:Parameter>
                  <asp:Parameter Name="Putanja" Type="String"></asp:Parameter>
                  <asp:Parameter Name="Mala" Type="String"></asp:Parameter>
                  <asp:Parameter Name="original_IdSlika" Type="Int32"></asp:Parameter>
                  <asp:Parameter Name="original_Naziv" Type="String"></asp:Parameter>
                  <asp:Parameter Name="original_Putanja" Type="String"></asp:Parameter>
                  <asp:Parameter Name="original_Mala" Type="String"></asp:Parameter>
              </UpdateParameters>
          </asp:SqlDataSource>
          </div><br /><br />
</asp:Content>
