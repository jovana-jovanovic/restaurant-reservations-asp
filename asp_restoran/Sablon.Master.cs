using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace asp_restoran
{
    public partial class Sablon : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AnketaPitanje();

        }
        
        public void AnketaPitanje()
        {
            int status=1;
              string konekcijaStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string selectQuery = "Select * from AnketaPitanje where status=@status";
            SqlConnection sqlConn = new SqlConnection(konekcijaStr);
            SqlCommand sqlComm = new SqlCommand(selectQuery);
            sqlComm.Parameters.AddWithValue("@status",status);
            
            sqlComm.Connection = sqlConn;
            //sqlComm.CommandType = CommandType.StoredProcedure;
            try
            {
               
                sqlComm.Connection.Open();
                

                SqlDataReader reader = sqlComm.ExecuteReader();
              
                while (reader.Read())
                {
                
                    this.LabelAnketa.Text=reader["Pitanje"] as string;
                    int idAnketa= (int)reader["IdAnketa"];
                    this.LabelIdAnketa.Text = Convert.ToString(idAnketa);

                   
                }

            }
            catch (Exception e) { }
        }
        public void ispisPoruke(string poruka, string cssClass)
        {
            this.poruke.InnerText = poruka;
            this.poruke.Attributes["class"] += " " + cssClass;
        }

        protected void LoginStatus_LoggedOut(object sender, EventArgs e)
        {
            Response.Redirect("~/Index.aspx");
        }
       
        //public static string terminKraj(string idTermin)
        //{
        //    Glasanje g = new Glasanje();
        //    termin.IdTerminPocetak = Convert.ToInt32(idTermin);
        //    termin.dohvatiTerminKraj();
        //    System.Web.Script.Serialization.JavaScriptSerializer obj = new System.Web.Script.Serialization.JavaScriptSerializer();
        //    return obj.Serialize(termin);


        //}
        }
    
    }
    

