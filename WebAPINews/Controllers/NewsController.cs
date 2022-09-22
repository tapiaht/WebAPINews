using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebAPINews.Modelos.Response;
using WebAPINews.Modelos;
using System.Linq;
using System;
using WebAPINews.Modelos.Request;
using System.Collections.Generic;

namespace WebAPINews.Controllers
{
   [Route("api/[controller]")]
    [ApiController]
    public class NewsController : ControllerBase
    {
        public IActionResult Get()
        {
            Respuesta<List<News>> oRespuesta = new Respuesta<List<News>>();
            try
            {
                using (NotiBlazorContext db = new NotiBlazorContext())
                {
                    var lst = db.News.ToList();
                    oRespuesta.Exito = 1;
                    oRespuesta.Data = lst;

                }
            } catch (Exception ex)
            {
                oRespuesta.Mensaje = ex.Message;

            }
            return Ok(oRespuesta);
        }
        [HttpGet("{IdNews}")]
        //[Route("/")]
        public IActionResult Get(int IdNews)
        {
            Respuesta<News> oRespuesta = new Respuesta<News>();
            try
            {
                using (NotiBlazorContext db = new NotiBlazorContext())
                {
                    var lst = db.News.Find(IdNews);
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
        public IActionResult Add(Pedir model)
        {
            Respuesta<object> oRespuesta = new Respuesta<object>();
            try
            {
                using (NotiBlazorContext db = new NotiBlazorContext())
                {
                    News oNews = new News();
                    oNews.Titulo = model.Titulo;
                    oNews.IdCat = model.IdCat;
                    oNews.Body=model.Body;
                    db.News.Add(oNews);
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
        public IActionResult Edit(Pedir model)
        {
            Respuesta<object> oRespuesta = new Respuesta<object>();
            try
            {
                using (NotiBlazorContext db = new NotiBlazorContext())
                {
                    News oNews = db.News.Find(model.IdNews);
                    oNews.Titulo = model.Titulo;
                    oNews.IdCat = model.IdCat;
                    oNews.Body = model.Body;
                    db.Entry(oNews).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
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
        [HttpDelete("{IdNews}")]
        public IActionResult Delete(int IdNews)
        {
            Respuesta<object> oRespuesta = new Respuesta<object>();
            try
            {
                using (NotiBlazorContext db = new NotiBlazorContext())
                {
                    News oNews = db.News.Find(IdNews);
                    db.Remove(oNews);  
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
