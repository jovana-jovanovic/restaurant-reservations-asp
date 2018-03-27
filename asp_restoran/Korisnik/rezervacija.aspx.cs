using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace asp_restoran.Korisnik
{
    public partial class rezervacija : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        
            //DropDownListPocetak.SelectedValue = "0";
            //calendar.Text = "";
            //TextBoxPocetak.Text = "";
            //TextBoxTerminiKraj.Text = "";
            //TextBoxDdlRezervacija.Text = "";
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            calendar.Text=Calendar1.SelectedDate.ToShortDateString();
            DropDownListPocetak.SelectedValue = "0";
          
        }
        [WebMethod]
        public static string terminKraj(string idTermin)
        {
            TerminiKraj termin = new TerminiKraj();
            termin.IdTerminPocetak = Convert.ToInt32(idTermin);
            termin.dohvatiTerminKraj();
            System.Web.Script.Serialization.JavaScriptSerializer obj = new System.Web.Script.Serialization.JavaScriptSerializer();
            return obj.Serialize(termin);

           
        }
        [WebMethod]
        public static string slobodniStolovi(Sto s)
        {
          
            string dat = s.Datum.ToString();
            string[] datum1 = dat.Split('/');
             datum1 = (from d in datum1
            select d.Trim()).ToArray();
            int mesec=Int32.Parse(datum1[0]);
             int dan=Int32.Parse(datum1[1]);
             string g = datum1[2].Substring(0, 4);
             int godina=Int32.Parse(g);



             DateTime datum = new DateTime(godina, mesec, dan);
         
              s.Datum = datum;
              s.dohvatiSlobodneStolove();
              var obj = new JavaScriptSerializer().Serialize(s);
              return obj;


        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.Date <= DateTime.Now)
            {

                e.Cell.BackColor = ColorTranslator.FromHtml("#a9a9a9");

                e.Day.IsSelectable = false;

            }
        }
        protected void ButtonUnesi_Click()
        {
            string dat = calendar.Text;
            //string dat1 = s.Datum.ToString();
            string[] datum1 = dat.Split('/');
            datum1 = (from d in datum1
                      select d.Trim()).ToArray();
            int mesec = Int32.Parse(datum1[0]);
            int dan = Int32.Parse(datum1[1]);
            string g = datum1[2].Substring(0, 4);
            int godina = Int32.Parse(g);



            DateTime datum = new DateTime(godina, mesec, dan);


            int vremePocetka = DropDownListPocetak.SelectedIndex;
            int vremeKraja = Int32.Parse(TextBoxTerminiKraj.Text);
            int idSto = Int32.Parse(TextBoxDdlRezervacija.Text);
            string korisnik = User.Identity.Name;
            int status = 1;
            string konekcijaStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string insertQuery = "INSERT INTO Rezervacija(Datum,VremePocetka,VremeKraja,IdSto,Korisnik,Status) VALUES(@datum,@vremePocetka,@vremeKraja,@idSto,@korisnik,@status)";
            SqlConnection sqlConn = new SqlConnection(konekcijaStr);
            SqlCommand sqlComm = new SqlCommand(insertQuery);
            sqlComm.Parameters.AddWithValue("@datum", datum);
            sqlComm.Parameters.AddWithValue("@vremePocetka", vremePocetka);
            sqlComm.Parameters.AddWithValue("@vremeKraja", vremeKraja); 
            sqlComm.Parameters.AddWithValue("@idSto", idSto);
            sqlComm.Parameters.AddWithValue("@korisnik", korisnik);
            sqlComm.Parameters.AddWithValue("@status", status);



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

        protected void ButtonRezervisi_Click(object sender, EventArgs e)
        {
            Sablon masterSablon = (Sablon)this.Master;
            string dat = calendar.Text;
            //string dat1 = s.Datum.ToString();
            string[] datum1 = dat.Split('/');
            datum1 = (from d in datum1
                      select d.Trim()).ToArray();
            int mesec = Int32.Parse(datum1[0]);
            int dan = Int32.Parse(datum1[1]);
            string g = datum1[2].Substring(0, 4);
            int godina = Int32.Parse(g);



            DateTime datum = new DateTime(godina, mesec, dan);


            int vremePocetka = Int32.Parse(TextBoxPocetak.Text); 
            int vremeKraja = Int32.Parse(TextBoxTerminiKraj.Text);
            int idSto = Int32.Parse(TextBoxDdlRezervacija.Text);
            string korisnik = User.Identity.Name;
            
            int status = 1;
            string konekcijaStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string insertQuery = "INSERT INTO Rezervacija(Datum,VremePocetka,VremeKraja,IdSto,Korisnik,Status) VALUES(@datum,@vremePocetka,@vremeKraja,@idSto,@korisnik,@status)";
            SqlConnection sqlConn = new SqlConnection(konekcijaStr);
            SqlCommand sqlComm = new SqlCommand(insertQuery);
            sqlComm.Parameters.AddWithValue("@datum", datum);
            sqlComm.Parameters.AddWithValue("@vremePocetka", vremePocetka);
            sqlComm.Parameters.AddWithValue("@vremeKraja", vremeKraja);
            sqlComm.Parameters.AddWithValue("@idSto", idSto);
            sqlComm.Parameters.AddWithValue("@korisnik", korisnik);
            sqlComm.Parameters.AddWithValue("@status", status);



            sqlComm.Connection = sqlConn;
            //sqlComm.CommandType = CommandType.StoredProcedure;
            try
            {
                sqlComm.Connection.Open();
                sqlComm.ExecuteNonQuery();
                DropDownListPocetak.SelectedValue = "0";
                calendar.Text = "";
                TextBoxPocetak.Text = "";
                TextBoxTerminiKraj.Text = "";
                TextBoxDdlRezervacija.Text = "";
                masterSablon.ispisPoruke(String.Format("Uspesno ste rezervisali sto"), "alert-success");
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
    public class TerminiKraj
    {
        public int IdTerminPocetak { get; set; }
        public int Naziv { get; set; }
        public List<int> ListaNaziv { get; set; }
        public List<int> ListaIdTermin { get; set; }

        public void dohvatiTerminKraj()
        {
                string konekcijaStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string selectQuery = "Select * from Termin where IdTermin>@idTermin";
            SqlConnection sqlConn = new SqlConnection(konekcijaStr);
            SqlCommand sqlComm = new SqlCommand(selectQuery);
            sqlComm.Parameters.AddWithValue("@idTermin", IdTerminPocetak);
            
            sqlComm.Connection = sqlConn;
            //sqlComm.CommandType = CommandType.StoredProcedure;
            try
            {
               
                sqlComm.Connection.Open();
                

                SqlDataReader reader = sqlComm.ExecuteReader();
                ListaNaziv = new List<int>();
                ListaIdTermin = new List<int>();
                while (reader.Read())
                {
                
                    this.ListaNaziv.Add((int)reader["Termin"]);
                    this.ListaIdTermin.Add((int)reader["IdTermin"]);

                   
                }

            }
            catch (Exception e) { }
        }
        }
     [Serializable]
    public class Sto
    {
     
        public int TerminPocetak { get; set; }
        public int TerminKraj { get; set; }
        public DateTime Datum { get; set; }

        public List<string> ListaSto { get; set; }
        public List<int> ListaIdSto { get; set; }

        public void dohvatiSlobodneStolove()
        {
            string konekcijaStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
   
             string selectQuery= "select * from Sto where IdSto not in(select IdSto from Rezervacija where Datum = @datum  and ((VremePocetka > @vreme_pocetka and VremePocetka < @vreme_kraja) or( VremePocetka <= @vreme_pocetka and VremeKraja > @vreme_pocetka  )))";
            SqlConnection sqlConn = new SqlConnection(konekcijaStr);
            SqlCommand sqlComm = new SqlCommand(selectQuery);
            sqlComm.Parameters.AddWithValue("@datum", Datum);
            sqlComm.Parameters.AddWithValue("@vreme_pocetka", TerminPocetak);
            sqlComm.Parameters.AddWithValue("@vreme_kraja", TerminKraj);
          

            sqlComm.Connection = sqlConn;
            //sqlComm.CommandType = CommandType.StoredProcedure;
            try
            {

                sqlComm.Connection.Open();


                SqlDataReader reader = sqlComm.ExecuteReader();
                ListaIdSto = new List<int>();
                ListaSto = new List<string>();

                while (reader.Read())
                {

                    this.ListaSto.Add(reader["Sto"] as string);
                    this.ListaIdSto.Add((int)reader["IdSto"]);


                }

            }
            catch (Exception e) { }
        }
    }
    }
