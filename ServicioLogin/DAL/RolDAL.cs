using Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace ServicioLogin.DAL
{
    public class RolDAL
    {
        private string dbCon = MyConfigurationManager.AppSetting["ConnectionStrings:DefaultConnection"];

        public List<Rol> ConsultarRoles()
        {
            List<Rol> LstRoles = new List<Rol>();

            try
            {
                using (SqlConnection con = new SqlConnection(dbCon))
                {
                    con.Open();
                    SqlCommand com = new SqlCommand("SV_SEL_ROL", con);
                    com.CommandType = CommandType.StoredProcedure;
                    SqlDataReader rdr = com.ExecuteReader();
                    while (rdr.Read())
                    {
                        Rol auxRol = new Rol
                        {
                            Id = Convert.ToInt32(rdr["Id"]),
                            Nombre = rdr["Nombre"].ToString()

                        };

                        LstRoles.Add(auxRol);
                    }

                    rdr.Close();
                    rdr.Dispose();

                    con.Close();
                }


            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());

            }

            return LstRoles;

        }
    }
}
