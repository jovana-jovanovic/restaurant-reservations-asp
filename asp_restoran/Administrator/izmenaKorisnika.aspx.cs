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
    public partial class izmenaKorisnika :MyPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            string ID = Request.QueryString["ID"].ToString();
            string konekcijaStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string selectQuery = "SELECT * FROM KorisnikDodatno WHERE Id=@UserId";
            SqlConnection sqlConn = new SqlConnection(konekcijaStr);
            SqlCommand sqlComm = new SqlCommand(selectQuery);
            sqlComm.Parameters.AddWithValue("@UserId", ID);

            sqlComm.Connection = sqlConn;
            //sqlComm.CommandType = CommandType.StoredProcedure;
            try
            {

                sqlComm.Connection.Open();


                SqlDataReader reader = sqlComm.ExecuteReader();

                while (reader.Read())
                {

                    this.TextBoxIme.Text = reader["Ime"] as string;
                    this.TextBoxPrezime.Text = reader["Prezime"] as string;
                    int god= (int)reader["GodinaRodjenja"];
                    this.TextBoxGodinaRodjenja.Text = Convert.ToString(god);
                    this.TextBoxId.Text=reader["Id"] as string;


                }


            }
            catch (Exception ex) { }
        }

        protected void ButtonIzmeniKorisnika_Click(object sender, EventArgs e)
        {

            string ime = TextBoxIme.Text;
            string prezime = TextBoxPrezime.Text;
            int godina = Int32.Parse(TextBoxGodinaRodjenja.Text);
            string id = TextBoxId.Text;
            string konekcijaStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string insertQuery = "Update KorisnikDodatno Set Ime=@ime,Prezime=@prezime,GodinaRodjenja=@godina where Id=@id";
            SqlConnection sqlConn = new SqlConnection(konekcijaStr);
            SqlCommand sqlComm = new SqlCommand(insertQuery);
            sqlComm.Parameters.AddWithValue("@ime", ime);
            sqlComm.Parameters.AddWithValue("@prezime",prezime);
            sqlComm.Parameters.AddWithValue("@godina", godina);
            sqlComm.Parameters.AddWithValue("@id",id);



            sqlComm.Connection = sqlConn;
            //sqlComm.CommandType = CommandType.StoredProcedure;
            try
            {

                sqlComm.Connection.Open();
                sqlComm.ExecuteNonQuery();
                



            }
            catch (Exception ex)
            {
           
            }
            finally
            {
                sqlComm.Connection.Close();

            }
        }

       
    }
}