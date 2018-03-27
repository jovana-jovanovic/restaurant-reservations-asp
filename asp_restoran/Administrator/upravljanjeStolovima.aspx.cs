using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace asp_restoran.Administrator
{
    public partial class upravljanjeStolovima : MyPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonUnesi_Click(object sender, EventArgs e)
        {
            Sablon masterSablon = (Sablon)this.Master;

            string naziv = TextBoxNazivStola.Text;
            


            string konekcijaStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string insertQuery = "INSERT INTO Sto(Sto) VALUES(@sto)";
            SqlConnection sqlConn = new SqlConnection(konekcijaStr);
            SqlCommand sqlComm = new SqlCommand(insertQuery);
            sqlComm.Parameters.AddWithValue("@sto", naziv);
            sqlComm.Connection = sqlConn;
            //sqlComm.CommandType = CommandType.StoredProcedure;
            try
            {

                sqlComm.Connection.Open();
                sqlComm.ExecuteNonQuery();
           
                TextBoxNazivStola.Text = string.Empty;
                GridViewAdminSto.DataBind();
                dohvatiTabelu("Sto");
                dohvatiPromenu("Insert");
                unosAktivnosti();
            


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

        protected void GridViewAdminSto_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            dohvatiTabelu("Sto");
            dohvatiPromenu("Delete");
            unosAktivnosti();
            
        }

        protected void GridViewAdminSto_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            dohvatiTabelu("Sto");
            dohvatiPromenu("Update");
            unosAktivnosti();
            
        }
    }
}