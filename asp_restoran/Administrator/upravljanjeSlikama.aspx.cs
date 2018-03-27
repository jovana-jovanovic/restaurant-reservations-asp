using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace asp_restoran.Administrator
{
    public partial class upravljanjeSlikama : MyPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonUnesi_Click(object sender, EventArgs e)
        {
       
           
            string uploadFolder = Server.MapPath("~/upload/");
            if (FileUploadSlika.HasFile)
            {
                string naziv = TextBoxNaziv.Text;
                string fileName = FileUploadSlika.PostedFile.FileName;
                string novoIme = String.Format("{0}_{1}", DateTime.Now.ToString("ddMMyyyy"), fileName);
                string tipFajla = FileUploadSlika.PostedFile.ContentType;
                int velicina = FileUploadSlika.PostedFile.ContentLength;

                string konekcijaStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                string insertQuery = "INSERT INTO Galerija(Naziv,Putanja) VALUES(@naziv,@putanja)";
                SqlConnection sqlConn = new SqlConnection(konekcijaStr);
                SqlCommand sqlComm = new SqlCommand(insertQuery);
                sqlComm.Parameters.AddWithValue("@naziv", naziv);
                sqlComm.Parameters.AddWithValue("@putanja", "~/upload/" + novoIme);
                sqlComm.Connection = sqlConn;
                //sqlComm.CommandType = CommandType.StoredProcedure;
                try
                {
                    FileUploadSlika.SaveAs(uploadFolder + novoIme);
              
                    sqlComm.Connection.Open();
                    sqlComm.ExecuteNonQuery();
                
                    TextBoxNaziv.Text = string.Empty;
                    GridViewSlike.DataBind();
                    dohvatiTabelu("Galerija");
                    dohvatiPromenu("Insert");
                    unosAktivnosti();

            
    

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
       
        protected void GridViewSlike_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewSlike.EditIndex = e.NewEditIndex;
        }

        protected void GridViewSlike_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string uploadFolder = Server.MapPath("~/upload/");
            FileUpload novaSlika = (FileUpload)GridViewSlike.Rows[e.RowIndex].FindControl("FileUploadEditSlika");
            Image staraSlika = (Image)GridViewSlike.Rows[e.RowIndex].FindControl("Slika");
            if (novaSlika != null && novaSlika.HasFile)
            {
                string staraPutanja = staraSlika.ImageUrl;
                FileInfo podaciOfajlu = new FileInfo(Server.MapPath(staraPutanja));
                if (podaciOfajlu.Exists)
                {
                    File.Delete(Server.MapPath(staraPutanja));
                }
                string fileName = novaSlika.PostedFile.FileName;
                string promenjenoIme = String.Format("{0}_{1}", DateTime.Now.ToString("ddMMyyyy"), fileName);
                novaSlika.SaveAs(Server.MapPath("~/upload/" + promenjenoIme));

                e.NewValues["putanja"] = "~/upload/" + promenjenoIme;
            }
            else
            {
                e.NewValues["putanja"] = staraSlika.ImageUrl;
            }
    
     
        }

        protected void GridViewSlike_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Sablon masterSablon = (Sablon)this.Master;
            Image staraSlika = (Image)GridViewSlike.Rows[e.RowIndex].FindControl("Slika");
            string staraPutanja = staraSlika.ImageUrl;
            FileInfo podaciOfajlu = new FileInfo(Server.MapPath(staraPutanja));
            if (podaciOfajlu.Exists)
            {
                File.Delete(Server.MapPath(staraPutanja));
           
            }
        }

        protected void GridViewSlike_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            dohvatiTabelu("Galerija");
            dohvatiPromenu("Delete");
            unosAktivnosti();
            
        }

        protected void GridViewSlike_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            dohvatiTabelu("Galerija");
            dohvatiPromenu("Update");
            unosAktivnosti();
            
        }

       
    }
}