<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="asp_restoran.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
 <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSlider" runat="server">
        
        
    <div id="slider">
        
	  
	</div>
     </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
     
         <div class="reservation_top">
           <div class="container">
     <div class="row grids text-center">
				 <div class="col-md-4">
					<div class="view view-tenth">
					      <a href="Galerija.aspx">
						   <div class="inner_content clearfix">
							<div class="product_image">
								<asp:Image ID="Image3" runat="server" ImageUrl="images/g2.jpg" CssClass="img-responsive" />
								<div class="label-product">
                                 </div>
								<div class="mask" >
			                        <h2>Pogledajte galeriju slika restorana Vintage</h2>
			                        
			                        
			                    </div>
			                  	</div>
			                 </div>
				            </a> 
				       </div>
				       <div class="product_container wow bounceIn" data-wow-delay="0.4s">
						  <h3><a href="Galerija.aspx">Galerija slika</a></h3>
					      <div class="underheader-line"></div>
					      
					      	
				       </div>		
		            </div>
				    <div class="col-md-4">
					  <div class="view view-tenth">
                                                <a href="Kontakt.aspx">
						   <div class="inner_content clearfix">
							 <div class="product_image">
                                 <asp:Image ID="Image1" runat="server" ImageUrl="images/g4.jpg" CssClass="img-responsive" />
						
								<div class="label-product">
                         </div>
								<div class="mask">
			                        <h2>Kontaktirajte restoran Vintage</h2>
                                                 
			                       
			                       
			                    </div>
			                  	</div>
			                   </div>
				            </a> 
				       </div>
				       <div class="product_container wow bounceIn" data-wow-delay="0.4s">
						  <h3><a href="Kontakt.aspx">Kontakt</a></h3>
					      <div class="underheader-line"></div>
					     
					      	
				       </div>		
		            </div>
				    <div class="col-md-4">
					   <div class="view view-tenth">
					      <a href="Jelovnik.aspx">
						   <div class="inner_content clearfix">
							<div class="product_image">
								<asp:Image ID="Image2" runat="server" ImageUrl="images/g1.jpg" CssClass="img-responsive" />
								
								<div class="mask">
			                        <h2>Pogledajte meni restorana Vintage</h2>
			                        
			                         
			                    </div>
			                    </div>
			                  </div>
				            </a> 
				       </div>
				       <div class="product_container wow bounceIn" data-wow-delay="0.4s">
						  <h3><a href="Jelovnik.aspx">Nas meni</a></h3>
					      <div class="underheader-line"></div>
					
					      	
				       </div>		
		            </div>
			 </div>	
            </div>
         <br/><br/>
            <div class="container">          	 
	 		   <h3 class="hist">O nama</h3>
	 		  	<div class="row">
	 		  		<div class="col-sm-6">
	 		  			<img src="images/h1.jpg" class="img-responsive" alt=""/>
	 		  		</div>
	 		  		<div class="col-sm-6 history_grid">
	 		  			
	 		  			<p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option </p>
	 		  			
	 		  		</div>
	 		    </div>
	       </div>
	    </div>
	    
</asp:Content>
