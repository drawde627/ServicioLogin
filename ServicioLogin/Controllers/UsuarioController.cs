using Microsoft.AspNetCore.Mvc;
using Models;
using ServicioLogin.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ServicioLogin.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        // GET: api/<UsuarioController>
        [HttpGet]
        public List<Usuario> Get()
        {
            List<Usuario> LstUsuarios = new List<Usuario>();
            UsuarioDAL usuDal = new UsuarioDAL();
            LstUsuarios = usuDal.ConsultarUsuarios("0", "0");
            return LstUsuarios;
        }
        [HttpPost]
        public List<Usuario> Post([FromBody] Usuario User)
        {
            List<Usuario> LstUsuarios = new List<Usuario>();
            UsuarioDAL usuDal = new UsuarioDAL();
            LstUsuarios = usuDal.ConsultarUsuarios(User.Nombre, User.RolId.ToString());
            return LstUsuarios;
        }

        [HttpPost]
        [Route("Update")]
        public Usuario Update([FromBody] Usuario User)
        {
            Usuario Usuario = new Usuario();
            UsuarioDAL usuDal = new UsuarioDAL();
            Usuario = usuDal.ActualizarUsuario(User);
            return Usuario;
        }

        [HttpPost]
        [Route("Create")]
        public Usuario Create([FromBody] Usuario User)
        {
            Usuario Usuario = new Usuario();
            UsuarioDAL usuDal = new UsuarioDAL();
            Usuario = usuDal.CrearUsuario(User);
            return Usuario;
        }

        [HttpPost]
        [Route("Delete")]
        public Usuario Delete([FromBody] Usuario User)
        {
            Usuario Usuario = new Usuario();
            UsuarioDAL usuDal = new UsuarioDAL();
            Usuario = usuDal.EliminarUsuario(User);
            return Usuario;
        }


    }
}
