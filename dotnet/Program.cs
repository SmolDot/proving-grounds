var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => "Hello World!");
app.MapGet("/{files}", async(int files) => 
    {
        await using (FileStream fs = new FileStream("./test.zip", FileMode.OpenOrCreate))
        {
            await Zip.WriteAsync(fs, files);
            return fs.Response.ContentType = "application/octet-stream";
        }
        
    }
);
app.Run();
