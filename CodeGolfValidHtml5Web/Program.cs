var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/HealthCheck", () => "");
app.MapGet("/", context => {
    context.Response.ContentType = "text/html";
    return context.Response.WriteAsync("<!DOCTYPE html><html lang=\"\"><meta charset=\"UTF-8\"><title>.</title>");
});

app.Run();

public partial class Program {}
