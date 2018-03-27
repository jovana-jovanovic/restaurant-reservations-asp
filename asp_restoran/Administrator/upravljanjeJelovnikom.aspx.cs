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
    public partial class upravljanjeJelovnikom : MyPage
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {

        }
     
       
        protected void GridViewAdminJelovnik_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
       
            dohvatiTabelu("Jelovnik");
            dohvatiPromenu("Update");
            unosAktivnosti();
            
        }

        protected void ButtonUnesi_Click(object sender, EventArgs e)
        {
            Sablon masterSablon = (Sablon)this.Master;

                 string naziv = TextBoxNazivJela.Text;
                 string cena =TextBoxCena.Text;
               

                string konekcijaStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                string insertQuery = "INSERT INTO Jelovnik(naziv,cena) VALUES(@naziv,@cena)";
                SqlConnection sqlConn = new SqlConnection(konekcijaStr);
                SqlCommand sqlComm = new SqlCommand(insertQuery);
                sqlComm.Parameters.AddWithValue("@naziv", naziv);
                sqlComm.Parameters.AddWithValue("@cena", cena);
                sqlComm.Connection = sqlConn;
                //sqlComm.CommandType = CommandType.StoredProcedure;
                try
                {
                   
                    sqlComm.Connection.Open();
                    sqlComm.ExecuteNonQuery();
                
                    TextBoxNazivJela.Text = string.Empty;
                    TextBoxCena.Text = string.Empty;
                    GridViewAdminJelovnik.DataBind();
                    dohvatiTabelu("Jelovnik");
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

        protected void GridViewAdminJelovnik_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
          
            dohvatiTabelu("Jelovnik");
            dohvatiPromenu("Delete");
            unosAktivnosti();
           
        }
       

        }
        }
    
