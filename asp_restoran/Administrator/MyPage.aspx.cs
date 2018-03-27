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
    public partial class MyPage : System.Web.UI.Page
    {
        int idTabela;
        int idPromena;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public int dohvatiTabelu(string tab)
        {
            string tabela = tab;

            string konekcijaStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string selectQuery = "SELECT * FROM Tabela WHERE Tabela=@tabela";
            SqlConnection sqlConn = new SqlConnection(konekcijaStr);
            SqlCommand sqlComm = new SqlCommand(selectQuery);
            sqlComm.Parameters.AddWithValue("@tabela", tabela);

            sqlComm.Connection = sqlConn;
            //sqlComm.CommandType = CommandType.StoredProcedure;
            try
            {

                sqlComm.Connection.Open();


                SqlDataReader reader = sqlComm.ExecuteReader();

                while (reader.Read())
                {


                    this.idTabela = (int)reader["IdTabela"];



                }


            }
            catch (Exception ex) { }
            return this.idTabela;
        }
        public int dohvatiPromenu(string prom)
        {
            string promena = prom;

            string konekcijaStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string selectQuery = "SELECT * FROM Promena WHERE Promena=@promena";
            SqlConnection sqlConn = new SqlConnection(konekcijaStr);
            SqlCommand sqlComm = new SqlCommand(selectQuery);
            sqlComm.Parameters.AddWithValue("@promena", promena);

            sqlComm.Connection = sqlConn;
            //sqlComm.CommandType = CommandType.StoredProcedure;
            try
            {

                sqlComm.Connection.Open();


                SqlDataReader reader = sqlComm.ExecuteReader();

                while (reader.Read())
                {


                    this.idPromena = (int)reader["IdPromena"];



                }


            }
            catch (Exception ex) { }
            return this.idPromena;
        }
        public void unosAktivnosti()
        {
            Sablon masterSablon = (Sablon)this.Master;
            DateTime datum = DateTime.Now;
            string korisnik = User.Identity.Name;
            
            string konekcijaStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string insertQuery = "INSERT INTO Log(Datum,IdTabela,IdPromena,Korisnik) VALUES(@datum,@idTabela,@idPromena,@korisnik)";
            SqlConnection sqlConn = new SqlConnection(konekcijaStr);
            SqlCommand sqlComm = new SqlCommand(insertQuery);
            sqlComm.Parameters.AddWithValue("@datum", datum);
            sqlComm.Parameters.AddWithValue("@idTabela", this.idTabela);
            sqlComm.Parameters.AddWithValue("@idPromena", this.idPromena);
            sqlComm.Parameters.AddWithValue("@korisnik", korisnik);



            sqlComm.Connection = sqlConn;
            //sqlComm.CommandType = CommandType.StoredProcedure;
            try
            {

                sqlComm.Connection.Open();
                sqlComm.ExecuteNonQuery();
              


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