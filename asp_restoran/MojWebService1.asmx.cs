using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Services;

namespace asp_restoran
{
    /// <summary>
    /// Summary description for MojWebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class MojWebService1 : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }
        [WebMethod]
        public  string anketaGlasanje(string idOdgovor)
        {
            Glasanje g = new Glasanje();

            g.IdOdgovor = Int32.Parse(idOdgovor);
            g.glasaj();
            g.updateGlasova();
            g.dohvatiOdgovore();
            System.Web.Script.Serialization.JavaScriptSerializer obj = new System.Web.Script.Serialization.JavaScriptSerializer();
            return obj.Serialize(g);



        }
    }
    [Serializable]
    public class Glasanje
    {
        public int IdOdgovor { get; set; }
        public int BrojGlasova { get; set; }
        public List<string> ListaOdgovora { get; set; }
        public List<int> ListaIdOdgovora { get; set; }
        public List<int> ListaGlasova { get; set; }
        

        public void glasaj()
        {
            string konekcijaStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string selectQuery = "Select * from AnketaOdgovor  where IdOdgovor=@idOdgovor";
            SqlConnection sqlConn = new SqlConnection(konekcijaStr);
            SqlCommand sqlComm = new SqlCommand(selectQuery);
            sqlComm.Parameters.AddWithValue("@idOdgovor", IdOdgovor);

            sqlComm.Connection = sqlConn;
            //sqlComm.CommandType = CommandType.StoredProcedure;
            try
            {

                sqlComm.Connection.Open();


                SqlDataReader reader = sqlComm.ExecuteReader();
               
                while (reader.Read())
                {

                    this.BrojGlasova = (int)reader["Glasovi"];
                    


                }
                this.BrojGlasova = BrojGlasova + 1;


            }
            catch (Exception e) { }
        }
        public void dohvatiOdgovore()
        {
            int status = 1;
            string konekcijaStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string selectQuery = "Select * from AnketaOdgovor join AnketaPitanje on AnketaOdgovor.IdPitanje=AnketaPitanje.IdAnketa where AnketaPitanje.status=@status";
            SqlConnection sqlConn = new SqlConnection(konekcijaStr);
            SqlCommand sqlComm = new SqlCommand(selectQuery);
            sqlComm.Parameters.AddWithValue("@status", status);

            sqlComm.Connection = sqlConn;
            //sqlComm.CommandType = CommandType.StoredProcedure;
            try
            {

                sqlComm.Connection.Open();


                SqlDataReader reader = sqlComm.ExecuteReader();
                ListaOdgovora = new List<string>();
                ListaIdOdgovora = new List<int>();
                ListaGlasova = new List<int>();
                while (reader.Read())
                {


                    this.ListaOdgovora.Add(reader["Odgovor"] as string);
                    this.ListaIdOdgovora.Add((int)reader["IdOdgovor"]);
                    this.ListaGlasova.Add((int)reader["Glasovi"]);



                }
               
            }
            catch (Exception e) { }

        }
        public void updateGlasova()
        {
            string konekcijaStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string updateQuery = "UPDATE AnketaOdgovor SET Glasovi=@glasovi where IdOdgovor=@idOdgovor";
            SqlConnection sqlConn = new SqlConnection(konekcijaStr);
            SqlCommand sqlComm = new SqlCommand(updateQuery);
            sqlComm.Parameters.AddWithValue("@glasovi", BrojGlasova);
            sqlComm.Parameters.AddWithValue("@idOdgovor", IdOdgovor);
           


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
