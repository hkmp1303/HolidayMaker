namespace server;

static class Logout
{
  // Loggar ut användaren genom att rensa sessionen
  public static Task<bool> Post(HttpContext ctx)
  {
    // Om session inte är tillgänglig: inget att logga ut
    if (!ctx.Session.IsAvailable)
      return Task.FromResult(false);

    // Ta bort user_id om den finns och rensa hela sessionen
    ctx.Session.Remove("user_id");
    ctx.Session.Clear();

    return Task.FromResult(true);
  }
}
