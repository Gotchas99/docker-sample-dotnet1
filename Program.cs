using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
public class Program
{
    public static void Main()
    {
        new WebHostBuilder()
            .UseKestrel()
            .Configure(a => a.Run(c => c.Response.WriteAsync("Hi there!")))
            .Build()
            .Run();
    }
}
