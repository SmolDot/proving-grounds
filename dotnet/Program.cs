var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => "Hello World!");
app.MapGet("/{files}", (int files) => 
    {
        Stream a;
        
        using (FileStream fs = new FileStream(@"./asp.net/README.md", FileAccess.Read, FileAccess.Write))
        {
            Zip.Write(fs, files);
            a = fs;
        }
        return a;
    }
);
app.Run();
