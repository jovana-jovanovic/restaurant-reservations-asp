<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="Kontakt.aspx.cs" Inherits="asp_restoran.Kontakt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         function porukaProvera(obj, args) {
          
            if (args.Value.trim().length > 10) {
                args.IsValid = true;
              
             
            } else {
                args.IsValid = false;
            }
        }
    </script>
     <script type="text/javascript">

         function proveraPol(obj, args) {
             if (args.Value == "0") {
                 args.isValid = false;
             }
             else {
                 args.isValid = true;
             }
         }
        
      function proveraCheckBox(obj, args) {
             var chbList = document.getElementById(<%# CheckBoxList1.ClientID %>);
            var elementi = chbList.getElementsByTagName("input");
            var isValid = false;
            for (var i = 0; i < elementi.length; i++) {
                if (elementi[i].checked) {
                    isValid = true;
                    break;
                }
            }
            args.isValid = isValid;
        }
    
     </script>
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

               <table class="table">
        <tr>
            <th class="text-center" colspan="3">
                Forma za kontakt
            </th>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LabelImePrezime" runat="server" Text="Ime i prezime"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxImePrezime" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorImePrezime" runat="server" ErrorMessage="Ime i prezime je obavezno" Text="*" ForeColor="Red" ControlToValidate="TextBoxImePrezime"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LabelEmail" runat="server" Text="Email"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
            </td>
            <td>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="Email je obavezan" Text="*" ForeColor="Red" ControlToValidate="TextBoxEmail"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ErrorMessage="Format mail-a nije dobar" Text="*" ControlToValidate="TextBoxEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
              <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Pol:"></asp:Label>
            </td>
            <td>
               <asp:DropDownList CssClass="form-control" ID="DropDownListPol" runat="server"   DataTextField="Naziv" >
                                <asp:ListItem Value="0" Text="Izaberi..." />
                                <asp:ListItem Value="1" Text="Muski" />
                  
                   <asp:ListItem Value="2" Text="Zenski" /> 
                               
                            </asp:DropDownList>
            </td>
            <td>
                <asp:CustomValidator ID="CustomValidatorPol" runat="server" ErrorMessage="Morate da izaberete nesto"
                                ClientValidationFunction="proveraPol" Text="*" OnServerValidate="CustomValidatorPol_ServerValidate1"
                                ForeColor="Red" ControlToValidate="DropDownListPol"></asp:CustomValidator>
            </td>
        </tr>
                     <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Izaberi jedan ili vise itema:"></asp:Label>
            </td>
            <td>
               <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataTextField="Naziv">
                   <asp:ListItem Text="Item1" Value="1"></asp:ListItem>
                   <asp:ListItem Text="Item2" Value="2"></asp:ListItem>
                   </asp:CheckBoxList>
            </td>
            <td>
                 <asp:CustomValidator ID="CustomValidatorCheckBoxList1" runat="server" ErrorMessage="Morate izabrati barem jedan item"
                                 Text="*" ForeColor="Red" ClientValidationFunction="proveraCheckBox"
                                OnServerValidate="CustomValidatorCheckBox_ServerValidate" ></asp:CustomValidator>
            </td>
        </tr>
        <tr>
             <td>
                <asp:Label ID="LabelPoruka" runat="server" Text="Poruka"></asp:Label>
            </td>
            <td>
                <textarea id="polje" onkeyup="Reporuka();"></textarea>
                <span id="polje_ispod"></span>
            </td>
            <td>
                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidatorPoruka" runat="server" ErrorMessage="Poruka je obavezna" Text="*" ControlToValidate="TextBoxPoruka"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidatorPoruka" runat="server" ErrorMessage="Poruka mora biti duza od 10 karaktera" Text="*" ControlToValidate="TextBoxPoruka" OnServerValidate="CustomValidatorPoruka_ServerValidate" ClientValidationFunction="porukaProvera"></asp:CustomValidator>--%>
           
            </td>
        </tr>
                    
         <tr>
            <td colspan="3" class="text-center">
                <asp:Button ID="ButtonKontakt" runat="server" Text="Posalji" OnClick="ButtonKontakt_Click" />
            </td>
            
        </tr>
    </table>
                
               <div>
        <asp:ValidationSummary ID="ValidationSummaryGreske" runat="server" />
    </div>
               </div>
         </div>
</asp:Content>
