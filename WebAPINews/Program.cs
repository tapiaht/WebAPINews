using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using WebAPINews.Modelos;
using WebAPINews.Controllers;
using Microsoft.OpenApi.Models;
using System.IO;
using System.Reflection;

var builder = WebApplication.CreateBuilder(args);
string connString = builder.Configuration.GetConnectionString("DefaultConnection");
builder.Services.AddControllers();
builder.Services.AddRazorPages();
builder.Services.AddEndpointsApiExplorer();
//builder.Services.AddSwaggerGen();
//builder.Services.AddDbContext<NotiBlazorContext>(options => options.UseSqlServer(connString));
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo
    {
        Title = "Blazor CRUD API",
        Version = "v1",
        Description = "CRUD API Services that act as the backend to the Blazor CRUD website."
    });

    // Set the comments path for the Swagger JSON and UI.
    var xmlFile = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
    var xmlPath = Path.Combine(AppContext.BaseDirectory, xmlFile);
    //c.IncludeXmlComments(xmlPath);
    //c.CustomSchemaIds(r => r.FullName);
});
string MiCors = "MiCors";
builder.Services.AddCors(opciones =>
{
    opciones.AddPolicy(name: MiCors,
            builder =>
            {
                builder.WithOrigins("*");

            }
                    );
}
                            );
//builder.Services.Configure<NotiBlazorContext>(builder.Configuration.GetSection("AppSettings"));
var app = builder.Build();
//using (var scope=app.Services.CreateScope())
//{
//    var dataContext = scope.ServiceProvider.GetRequiredService<NotiBlazorContext>();
//    dataContext.Database.Migrate();
//}


//using (var scope = app.Services.CreateScope())
//{
//    var services = scope.ServiceProvider;

//    try
//    {
//        var context = services.GetRequiredService<NotiBlazorContext>();
//        context.Database.Migrate();
//    }
//    catch (Exception ex)
//    {
//        var logger = services.GetRequiredService<ILogger<Program>>();
//        logger.LogError(ex, "An error occurred creating the DB.");
//    }
//}
app.UseRouting();
app.UseAuthorization();
app.UseEndpoints(endpoints =>
{
    endpoints.MapControllers();
});

if (app.Environment.IsDevelopment())
{
}
    app.UseSwagger();
    app.UseSwaggerUI(c =>
    {
        c.SwaggerEndpoint("/swagger/v1/swagger.json", "blazorcrud.api v1");
        c.DefaultModelsExpandDepth(-1);
    });
app.UseHttpsRedirection();

app.UseCors(MiCors);
app.MapRazorPages();
app.MapControllers();
app.Run();

