using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HoneyPot_TarPit_Page : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Mark this session as trapped
        Session["InTarpit"] = true;

        // Disable caching
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-10));
        Response.Cache.SetRevalidation(System.Web.HttpCacheRevalidation.AllCaches);
        Response.Cache.AppendCacheExtension("must-revalidate, proxy-revalidate");

        // Optional: slow down requests (hurts bots more than humans)
        Random rng = new Random();
        int delayMs = rng.Next(2000, 8000); // 2s - 8s delay
        Thread.Sleep(delayMs);

        // Generate massive useless HTML payload to waste crawl resources
        StringBuilder sb = new StringBuilder();

        sb.Append("<div style='display:none;'>");

        for (int i = 0; i < 3000; i++)
        {
            sb.Append("<p>");
            sb.Append(Guid.NewGuid().ToString());
            sb.Append(" ");
            sb.Append(Guid.NewGuid().ToString());
            sb.Append(" ");
            sb.Append(Guid.NewGuid().ToString());
            sb.Append("</p>");
        }

        sb.Append("</div>");

        BigJunkHtml.Text = sb.ToString();
    }
}