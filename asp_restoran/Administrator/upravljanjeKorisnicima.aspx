<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="upravljanjeKorisnicima.aspx.cs" Inherits="asp_restoran.Administrator.upravljanjeKorisnicima" %>
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
          <div id="logg" style="margin-left:250px;">
          <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnCreatedUser="CreateUserWizard1_CreatedUser" BackColor="#F7F7DE" BorderColor="#CCCC99" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="10pt" Height="396px" Width="316px">
              <ContinueButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
              <CreateUserButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
              <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
              <WizardSteps>
                  <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                      <ContentTemplate>
                          <table>
                              <tr>
                                  <td align="center" colspan="2">Sign Up for Your New Account</td>
                              </tr>
                              <tr>
                                  <td align="right">
                                      <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                  </td>
                                  <td>
                                      <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                  </td>
                              </tr>
                              <tr>
                                  <td align="right">
                                      <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                  </td>
                                  <td>
                                      <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                  </td>
                              </tr>
                              <tr>
                                  <td align="right">
                                      <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                                  </td>
                                  <td>
                                      <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                  </td>
                              </tr>
                              <tr>
                                  <td align="right">
                                      <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                  </td>
                                  <td>
                                      <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                  </td>
                              </tr>
                                  <tr>
                            <td align="right">
                                <asp:Label ID="LabelIme" runat="server" AssociatedControlID="TextBoxIme">Ime:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxIme" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxIme" ErrorMessage="Ime is required." ToolTip="Ime is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="LabelPrezime" runat="server" AssociatedControlID="TextBoxPrezime">Prezime:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxPrezime" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPrezime" ErrorMessage="Prezime is required." ToolTip="Prezime is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="LabelGodinaRodjenja" runat="server" AssociatedControlID="DropDownListGodinaRodjenja">Godina rodjenja:</asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownListGodinaRodjenja" runat="server">
                                    <asp:ListItem Value="0" Text="Izaberi.."></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="LabelUloge" runat="server" AssociatedControlID="DropDownListUloge">Uloge:</asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownListUloge" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSourceDropDownListUloge" DataTextField="RoleName" DataValueField="RoleName">
                                    <asp:ListItem Value="0" Text="Izaberi.."></asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceDropDownListUloge" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [RoleId], [RoleName] FROM [vw_aspnet_Roles]"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                              <td align="right">
                                  <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question:</asp:Label>
                              </td>
                              <td>
                                  <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" ErrorMessage="Security question is required." ToolTip="Security question is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                              </td>
                              <tr>
                                  <td align="right">
                                      <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer:</asp:Label>
                                  </td>
                                  <td>
                                      <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="Security answer is required." ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                  </td>
                              </tr>
                              <tr>
                                  <td align="center" colspan="2">
                                      <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                  </td>
                              </tr>
                              <tr>
                                  <td align="center" colspan="2" style="color:Red;">
                                      <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                  </td>
                              </tr>
                          </table>
                      </ContentTemplate>
                  </asp:CreateUserWizardStep>
                  <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                  </asp:CompleteWizardStep>
              </WizardSteps>
              <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" HorizontalAlign="Center" />
              <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
              <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="#FFFFFF" />
              <SideBarStyle BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em" VerticalAlign="Top" />
              <StepStyle BorderWidth="0px" />
          </asp:CreateUserWizard>
      </div>
      </div><br /><br />

    <asp:GridView ID="GridViewKorisnici" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceGridViewKorisnici" AllowPaging="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" style="margin-left: 357px" OnRowDeleted="GridViewKorisnici_RowDeleted" OnRowUpdated="GridViewKorisnici_RowUpdated1">
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" Visible="false"></asp:BoundField>
            <asp:BoundField DataField="Ime" HeaderText="Ime" SortExpression="Ime"></asp:BoundField>
            <asp:BoundField DataField="Prezime" HeaderText="Prezime" SortExpression="Prezime"></asp:BoundField>
            <asp:BoundField DataField="GodinaRodjenja" HeaderText="GodinaRodjenja" SortExpression="GodinaRodjenja"></asp:BoundField>
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
    <asp:SqlDataSource ID="SqlDataSourceGridViewKorisnici" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [KorisnikDodatno]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [KorisnikDodatno] WHERE [Id] = @original_Id AND [Ime] = @original_Ime AND [Prezime] = @original_Prezime AND [GodinaRodjenja] = @original_GodinaRodjenja" InsertCommand="INSERT INTO [KorisnikDodatno] ([Id], [Ime], [Prezime], [GodinaRodjenja]) VALUES (@Id, @Ime, @Prezime, @GodinaRodjenja)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [KorisnikDodatno] SET [Ime] = @Ime, [Prezime] = @Prezime, [GodinaRodjenja] = @GodinaRodjenja WHERE [Id] = @original_Id AND [Ime] = @original_Ime AND [Prezime] = @original_Prezime AND [GodinaRodjenja] = @original_GodinaRodjenja">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Object"></asp:Parameter>
            <asp:Parameter Name="original_Ime" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Prezime" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_GodinaRodjenja" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Id" Type="Object"></asp:Parameter>
            <asp:Parameter Name="Ime" Type="String"></asp:Parameter>
            <asp:Parameter Name="Prezime" Type="String"></asp:Parameter>
            <asp:Parameter Name="GodinaRodjenja" Type="Int32"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Ime" Type="String"></asp:Parameter>
            <asp:Parameter Name="Prezime" Type="String"></asp:Parameter>
            <asp:Parameter Name="GodinaRodjenja" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_Id" Type="Object"></asp:Parameter>
            <asp:Parameter Name="original_Ime" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Prezime" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_GodinaRodjenja" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
