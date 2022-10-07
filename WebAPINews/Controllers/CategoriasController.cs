using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System;
using WebAPINews.Modelos.Request;
using WebAPINews.Modelos.Response;
using WebAPINews.Modelos;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;

namespace WebAPINews.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoriasController : ControllerBase
    {
        [HttpGet]
        public IActionResult Get()
        {
            Respuesta<List<Categoria>> oRespuesta = new Respuesta<List<Categoria>>();
            try
            {
               
                using (NotiBlazorContext db = new NotiBlazorContext())
                {
                    var lst = db.Categorias.ToListAsync();
                    oRespuesta.Exito = 1;
                    oRespuesta.Data = lst.Result;

                }
            }
            catch (Exception ex)
            {
                oRespuesta.Mensaje = ex.Message;

            }
            return Ok(oRespuesta);
        }
        [HttpGet("{Idcat}")]
        public IActionResult Get(int Idcat)
        {
            Respuesta<Categoria> oRespuesta = new Respuesta<Categoria>();
            try
            {
                using (NotiBlazorContext db = new NotiBlazorContext())
                {
                    var lst = db.Categorias.Find(Idcat);
                    oRespuesta.Exito = 1;
                    oRespuesta.Data = lst;

                }
            }
            catch (Exception ex)
            {
                oRespuesta.Mensaje = ex.Message;

            }
            return Ok(oRespuesta);
        }
        [HttpPost]
        public IActionResult Add(PedirCat model)
        {
            Respuesta<object> oRespuesta = new Respuesta<object>();
            try
            {
                using (NotiBlazorContext db = new NotiBlazorContext())
                {
                    Categoria oCategoria = new Categoria();
                    oCategoria.Nombre = model.Nombre;
                    oCategoria.Foto= model.Foto;

                    db.Categorias.Add(oCategoria);
                    db.SaveChanges();
                    oRespuesta.Exito = 1;
                }
            }
            catch (Exception ex)
            {
                oRespuesta.Mensaje = ex.Message;

            }
            return Ok(oRespuesta);
        }
        [HttpPut]
        public IActionResult Edit(PedirCat model)
        {
            Respuesta<object> oRespuesta = new Respuesta<object>();
            try
            {
                using (NotiBlazorContext db = new NotiBlazorContext())
                {
                    Categoria oCategoria = db.Categorias.Find(model.Idcat);
                    oCategoria.Nombre = model.Nombre;
                    oCategoria.Nombre = model.Foto;

                    db.Entry(oCategoria).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                    db.SaveChanges();
                    oRespuesta.Exito = 1;
                }
            }
            catch (Exception ex)
            {
                oRespuesta.Mensaje = ex.Message;

            }
            return Ok(oRespuesta);
        }
        [HttpDelete("{Idcat}")]
        public IActionResult Delete(int Idcat)
        {
            Respuesta<object> oRespuesta = new Respuesta<object>();
            try
            {
                using (NotiBlazorContext db = new NotiBlazorContext())
                {
                    Categoria oCategoria = db.Categorias.Find(Idcat);
                    db.Remove(oCategoria);
                    db.SaveChanges();
                    oRespuesta.Exito = 1;
                }
            }
            catch (Exception ex)
            {
                oRespuesta.Mensaje = ex.Message;

            }
            return Ok(oRespuesta);
        }
    }
}
