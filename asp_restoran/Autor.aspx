<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="Autor.aspx.cs" Inherits="asp_restoran.Autor" %>
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
        
        
	 		 	<h2 style="text-align:center;"><?php print $page_title; ?></h2><br/>
	 		 	<div class="col-sm-4">
                     
	 		  			<img style="width:200px;height:300px;margin-left:100px;" src="images/autor.jpg" class="img-responsive" alt=""/>
	 		  		</div>
	 		  		<div class="col-sm-8 history_grid">
	 		  			
	 		  			<p>Jovana Jovanovic,<br/>
                                                    3.godina Visoke ICT skole,<br/> smer Internet tehnologije,<br/> modul Web programiranje </p>
	 		  			
	 		  		</div>
          
            </div>
           </div>
         </div>
</asp:Content>
