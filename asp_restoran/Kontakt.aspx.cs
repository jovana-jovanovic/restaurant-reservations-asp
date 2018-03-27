using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace asp_restoran
{
    public partial class Kontakt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        
        {
         

           // TextBoxPoruka.Attributes["onkeyup"] = this.polje_ispod + ".innerText=this.value.length;";
          
   //         Page.RegisterClientScriptBlock("MyScript",
   //"<script language=javascript>" + 
   //"function Reporuka(){"+
   //     "var broj=document.getElementById('polje_ispod');" +
   //   " var  polje=document.getElementById('<%=TextBoxPoruka.ClientID%>').value.length;"+

	
   // "if(polje>300 || polje<5){"+
   //     "broj.style.color='#ff0000';"+
   //     "broj.innerHTML=polje;"+

   // "}"+
   // "else{"+
   // "broj.innerHTML=polje;"+
   //     "broj.style.color='#000000';"+
	
   // "}"+
            
   //       "</script>");
        
   //         TextBoxPoruka.Attributes["onkeyup"] = "Reporuka()";
             

        }
        protected void CustomValidatorPol_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value == "0")
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }

        //protected void CustomValidatorKurs_ServerValidate(object source, ServerValidateEventArgs args)
        //{
        //    args.IsValid = CheckBoxListKurs.SelectedIndex != -1;
        //}

        protected void ButtonKontakt_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string imePrezime = TextBoxImePrezime.Text;
               
                
            }
        }
        protected void CustomValidatorPoruka_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Trim().Length > 10)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void CustomValidatorPol_ServerValidate1(object source, ServerValidateEventArgs args)
        {
            if (args.Value == "0")
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }

        }

        protected void CustomValidatorCheckBox_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = CheckBoxList1.SelectedIndex != -1;
        }
    }
}