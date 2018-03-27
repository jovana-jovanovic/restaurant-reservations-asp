using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace asp_restoran
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.User.Identity.IsAuthenticated)
            {
                string userName = this.User.Identity.Name;
                MembershipUser mUser = Membership.GetUser(userName);
                if (Roles.IsUserInRole(userName, "Administrator"))
                {
                    Response.Redirect("~/Administrator/administrator.aspx");
                }
                else if (Roles.IsUserInRole(userName, "Korisnik"))
                {
                    Response.Redirect("~/Korisnik/rezervacija.aspx");
                }
            }
           
        }
    }
}