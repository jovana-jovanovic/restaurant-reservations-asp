<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="rezervacija.aspx.cs" Inherits="asp_restoran.Korisnik.rezervacija" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
         <script   src="https://code.jquery.com/jquery-2.2.4.min.js"   integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="   crossorigin="anonymous"></script>
    <script type="text/javascript">
       $(document).ready(function () {
           $('.terminPocetak').change(function () {
               var idTermin = $('.terminPocetak').val();
               document.getElementById('<%=TextBoxPocetak.ClientID%>').value =idTermin;
               document.getElementById('<%=TextBoxTerminiKraj.ClientID%>').value = "";
               document.getElementById('<%=TextBoxDdlRezervacija.ClientID%>').value = "";
               $.ajax({
                   type: "POST",
                   url: "rezervacija.aspx/terminKraj",
                   contentType: "application/json; charset=utf-8",
                   data: "{ idTermin:'" + idTermin + "' }",
                   dataType: 'json',
                   success: function (msg) {
                       
                       var termin = $.parseJSON(msg.d);
                     
                       if (termin.ListaNaziv != null) {
                           var ispis = "<option value='0'>Izaberi</option>";
                           for(var i in termin.ListaNaziv){
   
                               ispis += "<option value='" + termin.ListaIdTermin[i] + "'>" + termin.ListaNaziv[i] + "</option>";
                               //ispis += " " + termin.ListaNaziv[i] + " ";
                           }
                          
                       }
                       $('#termini_kraj').html(ispis);
                   }
               } );
               
               
           });
       });
    </script>
     <script type="text/javascript">
  
         $(document).ready(
             function () {
                 $("#termini_kraj").change(function () {

                     // var datum=$('#datepicker').val();
                     var termini_pocetak = $('.terminPocetak').val();
                     var termini_kraj = $('#termini_kraj').val();
                     var datum1 = '<%= Calendar1.SelectedDate %>';
                     var datum = document.getElementById('<%=calendar.ClientID%>').value;
                     document.getElementById('<%=TextBoxDdlRezervacija.ClientID%>').value = "";
                     document.getElementById('<%=TextBoxTerminiKraj.ClientID%>').value = termini_kraj;
                     var stolovi = { TerminPocetak:termini_pocetak , TerminKraj:termini_kraj ,Datum:datum };
                     var podaciZaSlanje={ 's': stolovi };
                     
                   
                     $.ajax({
                         type: "POST",
                         url: "rezervacija.aspx/slobodniStolovi",
                         contentType: "application/json; charset=utf-8",
                         data: JSON.stringify(podaciZaSlanje),
                         dataType: 'json',
                         success: function (msg) {

                             var sto = $.parseJSON(msg.d);

                             if (sto.ListaSto != null) {
                               
                                 var ispis = "<option value='0'>Izaberi</option>";
                                 for (var i in sto.ListaSto) {

                                     ispis += "<option value='" + sto.ListaIdSto[i] + "'>" + sto.ListaSto[i] + "</option>";
                                     //ispis += " " + termin.ListaNaziv[i] + " ";
                                 }

                             }
                             $('#ddlRezervacija').html(ispis);
                         }
                     });
                     //var postPodaci = { termini_pocetak: termini_pocetak, termini_kraj: termini_kraj, datum: datum };
                     //$.post(baseUrl + 'korisnik/rezervacija', postPodaci, function (podaci) {
                     //    var stolovi = $.parseJSON(podaci);
                     //    var ispis = "<option value='0'>Izaberi</option>";
                     //    for (var i = 0; i < stolovi.length; i++) {
                     //        ispis += "<option value='" + stolovi[i].idSto + "'>" + stolovi[i].ime + " min:" + stolovi[i].minimum + " max:" + stolovi[i].maximum + "</option>";
                     //    }
                     //    $('#ddlRezervacija').html(ispis);
                     //});
                 });
             }
             );
    </script>
    <script type="text/javascript">
  
        $(document).ready(
            function () {
                $("#ddlRezervacija").change(function () {

                    // var datum=$('#datepicker').val();
                    var rez = $('#ddlRezervacija').val();

                    document.getElementById('<%=TextBoxDdlRezervacija.ClientID%>').value = rez;
                });
            });
                    </script>
    <style type="text/css">
        .auto-style1 {
            width: 192px;
        }
    </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSlider" runat="server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    
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
      <table class="table table-striped">
             
                    <tbody>
                    
                        <tr><td><asp:Label ID="Label1" runat="server" Text="Izaberite datum:"></asp:Label></td><td class="auto-style1">
                            <asp:Calendar ID="Calendar1" runat="server" Height="60px" Width="130px" OnSelectionChanged="Calendar1_SelectionChanged" OnDayRender="Calendar1_DayRender">
                             </asp:Calendar>
                            <asp:TextBox ID="calendar" runat="server" style="display:none" ></asp:TextBox>
                         </td></tr>
                        <tr><td>Izaberite vreme pocetka rezervacije:</td><td>
                            <asp:DropDownList ID="DropDownListPocetak" CssClass="terminPocetak"  runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSourceDropDownListPocetak" DataTextField="Termin" DataValueField="IdTermin">
                                <asp:ListItem Value="0" Text="Izaberi"></asp:ListItem></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceDropDownListPocetak" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Termin]"></asp:SqlDataSource>
                            <asp:TextBox ID="TextBoxPocetak" runat="server" style="display:none" ></asp:TextBox>                        </td></tr>
                                    <tr><td id="ispis"> vreme kraja rezervacije:</td><td>
                                       <select name="termini_kraj" id="termini_kraj"><option value="0">Izaberi:</option></select>
                                        <asp:TextBox ID="TextBoxTerminiKraj" runat="server" style="display:none" ></asp:TextBox>
                                                                                   </td></tr>
                       
                                    <tr><td>Slobodni stolovi za izabrani termin sa minimalnim i maksimalnim brojem gostiju:</td><td class="auto-style1"> <select name="ddlRezervacija" id="ddlRezervacija"><option value="0">Izaberi:</option></select>
                                         <asp:TextBox ID="TextBoxDdlRezervacija" runat="server" style="display:none" ></asp:TextBox>
                                                                                                                                </td></tr>
                        <tr><td>
                            <asp:Button ID="ButtonRezervisi" runat="server" Text="Rezervisi sto" OnClick="ButtonRezervisi_Click"  /></td><td class="auto-style1"></td></tr>
 </tbody>
      </table>
                   <div id="ispis1"></div>    
</asp:Content>
