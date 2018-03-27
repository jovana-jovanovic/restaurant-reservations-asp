using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace asp_restoran.Korisnik
{
    public partial class mojeRezervacije : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBoxKorisnik.Text = User.Identity.Name;
            for (var i=0; i< GridViewRezervacije.Rows.Count; i++)
            {
                TextBox tbDatum = (TextBox)GridViewRezervacije.Rows[i].FindControl("TextBoxDatum");
                Label lStatus = (Label)GridViewRezervacije.Rows[i].FindControl("LabelStatusRezervacije");
                LinkButton lb = (LinkButton)GridViewRezervacije.Rows[i].FindControl("LinkButtonStatusRezervacije");
           
               string dat = tbDatum.Text;

               string[] datum1 = dat.Split('/');
               datum1 = (from d in datum1
                         select d.Trim()).ToArray();
               int mesec = Int32.Parse(datum1[0]);
               int dan = Int32.Parse(datum1[1]);
               string g = datum1[2].Substring(0, 4);
               int godina = Int32.Parse(g);



               DateTime datum = new DateTime(godina, mesec, dan);
               if (datum > DateTime.Now)
               {
                   lb.Visible = true;
                   lStatus.Visible = false;
               }
               else
               {
                   lb.Visible = false;
                   lStatus.Visible = true;
               }

            }
        }

        //protected void LinkButtonStatusRezervacije_Click(object sender, EventArgs e)
        //{

        //}

        protected void GridViewRezervacije_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            TextBox tbDatum = new TextBox();
           
         
             string dat = tbDatum.Text;
       
            string[] datum1 = dat.Split('/');
            datum1 = (from d in datum1
                      select d.Trim()).ToArray();
            int mesec = Int32.Parse(datum1[0]);
            int dan = Int32.Parse(datum1[1]);
            string g = datum1[2].Substring(0, 4);
            int godina = Int32.Parse(g);



            DateTime datum = new DateTime(godina, mesec, dan);

            Label idGalerija = (Label)e.Row.FindControl("LabelIdGalerija");
            DropDownList listaGalerija = (DropDownList)e.Row.FindControl("DropDownListGalerija");
        }

        protected void GridViewRezervacije_RowDataBound1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TextBox myHyperLink = e.Row.FindControl("TextBoxDatum") as TextBox;
            }
        }

        protected void LinkButtonStatusRezervacije_Click(object sender, EventArgs e)
        {
            Sablon masterSablon = (Sablon)this.Master;
            LinkButton LinkButtonIzmeniKorisnika = (LinkButton)sender;
            int id = Int32.Parse(LinkButtonIzmeniKorisnika.CommandArgument);
            string konekcijaStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string insertQuery = "Delete from Rezervacija where IdRezervacija =@id";
            SqlConnection sqlConn = new SqlConnection(konekcijaStr);
            SqlCommand sqlComm = new SqlCommand(insertQuery);
            sqlComm.Parameters.AddWithValue("@id", id);
            



            sqlComm.Connection = sqlConn;
            //sqlComm.CommandType = CommandType.StoredProcedure;
            try
            {

                sqlComm.Connection.Open();
                sqlComm.ExecuteNonQuery();
                
                GridViewRezervacije.DataBind();
                
              


            }
            catch (Exception ex)
            {
                masterSablon.ispisPoruke(ex.Message, "alert-danger");
            }
            finally
            {
                sqlComm.Connection.Close();
            }
        }
        }
    }
