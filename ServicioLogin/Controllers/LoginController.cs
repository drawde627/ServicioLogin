using Microsoft.AspNetCore.Mvc;
using Models;
using ServicioLogin.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;


// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ServicioLogin.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    { 

        [HttpPost]
        public Login Post([FromBody] Usuario User)

        {
            Login Login = new Login();
            UsuarioDAL usuDal = new UsuarioDAL();
            Login = usuDal.ConsultarLogin(User.Nombre, User.Password);
            return Login;
        }

        
    }
}
