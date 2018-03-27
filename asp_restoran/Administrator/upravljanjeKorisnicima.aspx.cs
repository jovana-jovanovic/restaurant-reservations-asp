using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace asp_restoran.Administrator
{
    public partial class upravljanjeKorisnicima : MyPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             DropDownList ddlGodine = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("DropDownListGodinaRodjenja");
            if (ddlGodine != null && !this.IsPostBack)
            {
                this.popuniGodineRodjenja(ddlGodine);
            }

        }

        protected void popuniGodineRodjenja(DropDownList lista)
        {
            for (int i = 1980; i < 2016; i++)
            {
                ListItem item = new ListItem(i.ToString());
                lista.Items.Add(item);
            }
        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {

            DropDownList ddlGodine = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("DropDownListGodinaRodjenja");
            DropDownList ddlUloge = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("DropDownListUloge");
            TextBox TextBoxIme = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxIme");
            TextBox TextBoxPrezime = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxPrezime");
            TextBox TextBoxUserName = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("UserName");

            string konekcijaStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string sqlProcedureName = "InsertKorisnikDodatno";
            SqlConnection sqlConn = new SqlConnection(konekcijaStr);
            SqlCommand sqlComm = new SqlCommand(sqlProcedureName);
            sqlComm.CommandType = CommandType.StoredProcedure;
            sqlComm.Connection = sqlConn;
            try
            {
                MembershipUser mUser = Membership.GetUser(TextBoxUserName.Text);
                if (mUser != null)
                {
                    sqlComm.Parameters.AddWithValue("@Id", mUser.ProviderUserKey);
                    sqlComm.Parameters.AddWithValue("@Ime", TextBoxIme.Text);
                    sqlComm.Parameters.AddWithValue("@Prezime", TextBoxPrezime.Text);
                    sqlComm.Parameters.AddWithValue("@GodinaRodjenja", ddlGodine.SelectedValue);
                    sqlConn.Open();
                    sqlComm.ExecuteNonQuery();
                    Roles.AddUserToRole(TextBoxUserName.Text, ddlUloge.SelectedValue);
                    GridViewKorisnici.DataBind();
                    dohvatiTabelu("Korisnik");
                    dohvatiPromenu("Insert");
                    unosAktivnosti();
            
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                sqlConn.Close();
            }
        }

        protected void LinkButtonIzmeniKorisnika_Click(object sender, EventArgs e)
        {
            LinkButton LinkButtonIzmeniKorisnika = (LinkButton)sender;
            string id= Convert.ToString(LinkButtonIzmeniKorisnika.CommandArgument);
            Response.Redirect("~/Administrator/izmenaKorisnika.aspx?id="+id);
        }

        protected void GridViewKorisnici_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            dohvatiTabelu("Korisnik");
            dohvatiPromenu("Update");
            unosAktivnosti();
            
        }

        protected void GridViewKorisnici_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            dohvatiTabelu("Korisnik");
            dohvatiPromenu("Delete");
            unosAktivnosti();
        }

        protected void GridViewKorisnici_RowUpdated1(object sender, GridViewUpdatedEventArgs e)
        {
            dohvatiTabelu("Korisnik");
            dohvatiPromenu("Update");
            unosAktivnosti();
        }
    }
}