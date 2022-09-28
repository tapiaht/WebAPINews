using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Protocols;
using WebAPINews.Modelos;

namespace WebAPINews
{
    public class Startup
    {
        readonly string MiCors = "MiCors";
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }
        //string connString = configuration.GetConnectionString("DefaultConnection");
        // This method gets called by the runtime. Use this method to add services to the container.
       // var temp = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        public void ConfigureServices(IServiceCollection services)
        {

            services.AddCors(opciones =>
                {
                opciones.AddPolicy(name: MiCors,
                        builder => 
                        {
                            builder.WithOrigins("*");
                                    
                        }
                                );
                }
                            );

            services.AddControllers();
            services.AddSwaggerGen();
            //services.AddSingleton<IConfiguration>(Configuration);
        //    services.AddDbContext<NotiBlazorContext>(options =>
        //options.UseSqlServer(Configuration.GetConnectionString("DefaultConnection")));
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            app.UseSwagger();
            app.UseSwaggerUI();
            

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseCors(MiCors);

            app.UseAuthorization();           

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
