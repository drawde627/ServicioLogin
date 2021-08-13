using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using Models;
using Microsoft.Extensions.Configuration;

namespace ServicioLogin.DAL
{
    public class UsuarioDAL
    {

        private string dbCon = MyConfigurationManager.AppSetting["ConnectionStrings:DefaultConnection"];


        public Login ConsultarLogin(string nombre, string password)
        {
            Login Login = new Login();
            Login.Permisos = new List<Permiso>();
            
            try
            {
                using (SqlConnection con = new SqlConnection(dbCon))
                {
                    con.Open();
                    SqlCommand com = new SqlCommand("SV_SEL_LOGIN", con);
                    com.CommandType = CommandType.StoredProcedure;
                    com.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = nombre;
                    com.Parameters.Add("@Password", SqlDbType.VarChar).Value = password;
                    SqlDataReader rdr = com.ExecuteReader();
                    if (rdr.Read())
                    {
                        Usuario auxUsuario = new Usuario
                        {
                            Nombre = rdr["Nombre"].ToString(),
                            NombresCompletos = rdr["NombresCompletos"].ToString(),
                            Direccion = rdr["Direccion"].ToString(),
                            Telefono = rdr["Telefono"].ToString(),
                            Email = rdr["Email"].ToString(),
                            Edad = Convert.ToInt32(rdr["Edad"]),
                            RolId = Convert.ToInt32(rdr["RolId"]),
                            RolNombre = rdr["RolNombre"].ToString()
                        };
                        Login.Usuario = new Usuario();
                        Login.Usuario = auxUsuario;


                    }
                    rdr.NextResult();
                    while (rdr.Read())
                    {
                        Permiso auxPermiso = new Permiso
                        {
                            Id = Convert.ToInt32(rdr["Id"]),
                            Descripcion = rdr["Descripcion"].ToString()
                        };
                        Login.Permisos.Add(auxPermiso);

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

            return Login;

        }

        public List<Usuario> ConsultarUsuarios(string nombre, string rolId)
        {
            List<Usuario> LstUsuarios = new List<Usuario>();

            try
            {
                using (SqlConnection con = new SqlConnection(dbCon))
                {
                    con.Open();
                    SqlCommand com = new SqlCommand("SV_SEL_USUARIO", con);
                    com.CommandType = CommandType.StoredProcedure;
                    com.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = nombre;
                    com.Parameters.Add("@RolId", SqlDbType.VarChar).Value = rolId;
                    SqlDataReader rdr = com.ExecuteReader();
                    while (rdr.Read())
                    {
                        Usuario auxUsuario = new Usuario
                        {
                            Nombre = rdr["Nombre"].ToString(),
                            NombresCompletos = rdr["NombresCompletos"].ToString(),
                            Direccion = rdr["Direccion"].ToString(),
                            Telefono = rdr["Telefono"].ToString(),
                            Email = rdr["Email"].ToString(),
                            Edad = Convert.ToInt32(rdr["Edad"]),
                            RolId = Convert.ToInt32(rdr["RolId"]),
                            RolNombre = rdr["RolNombre"].ToString()
                        };

                        LstUsuarios.Add(auxUsuario);
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

            return LstUsuarios;

        }


        public Usuario ActualizarUsuario(Usuario usuario)
        {
            List<Usuario> LstUsuarios = new List<Usuario>();
            int resut = 0;
            try
            {
                using (SqlConnection con = new SqlConnection(dbCon))
                {
                    con.Open();
                    SqlCommand com = new SqlCommand("SV_UPD_USUARIO", con);
                    com.CommandType = CommandType.StoredProcedure;
                    com.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = usuario.Nombre;
                    com.Parameters.Add("@NombresCompletos", SqlDbType.VarChar).Value = usuario.NombresCompletos;
                    com.Parameters.Add("@Direccion", SqlDbType.VarChar).Value = usuario.Direccion;
                    com.Parameters.Add("@Telefono", SqlDbType.VarChar).Value = usuario.Telefono;
                    com.Parameters.Add("@Email", SqlDbType.VarChar).Value = usuario.Email;
                    com.Parameters.Add("@Edad", SqlDbType.VarChar).Value = usuario.Edad;
                    com.Parameters.Add("@RolId", SqlDbType.VarChar).Value = usuario.RolId;
                    resut=com.ExecuteNonQuery();

                    con.Close();

                }


            }
            catch (Exception e)
            {
                usuario.Nombre = "";
                Console.WriteLine(e.ToString());
            }

            return usuario;

        }

        public Usuario CrearUsuario(Usuario usuario)
        {
            List<Usuario> LstUsuarios = new List<Usuario>();
            int resut = 0;
            try
            {
                using (SqlConnection con = new SqlConnection(dbCon))
                {
                    con.Open();
                    SqlCommand com = new SqlCommand("SV_INS_USUARIO", con);
                    com.CommandType = CommandType.StoredProcedure;
                    com.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = usuario.Nombre;
                    com.Parameters.Add("@Password", SqlDbType.VarChar).Value = usuario.Nombre;
                    com.Parameters.Add("@NombresCompletos", SqlDbType.VarChar).Value = usuario.NombresCompletos;
                    com.Parameters.Add("@Direccion", SqlDbType.VarChar).Value = usuario.Direccion;
                    com.Parameters.Add("@Telefono", SqlDbType.VarChar).Value = usuario.Telefono;
                    com.Parameters.Add("@Email", SqlDbType.VarChar).Value = usuario.Email;
                    com.Parameters.Add("@Edad", SqlDbType.VarChar).Value = usuario.Edad;
                    com.Parameters.Add("@RolId", SqlDbType.VarChar).Value = usuario.RolId;
                    resut = com.ExecuteNonQuery();

                    con.Close();
                }


            }
            catch (Exception e)
            {
                usuario.Nombre="";
                Console.WriteLine(e.ToString());
            }

            return usuario;

        }

        public Usuario EliminarUsuario(Usuario usuario)
        {
            List<Usuario> LstUsuarios = new List<Usuario>();
            int resut = 0;
            try
            {
                using (SqlConnection con = new SqlConnection(dbCon))
                {
                    con.Open();
                    SqlCommand com = new SqlCommand("SV_DEL_USUARIO", con);
                    com.CommandType = CommandType.StoredProcedure;
                    com.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = usuario.Nombre;
                    resut = com.ExecuteNonQuery();
                    
                    con.Close();

                }


            }
            catch (Exception e)
            {
                usuario.Nombre = "";
                Console.WriteLine(e.ToString());
            }

            return usuario;

        }
    }
}
