namespace server;

static class Logout
{
  public static Task<bool> Post(HttpContext ctx)
  {
    if (!ctx.Session.IsAvailable)
      return Task.FromResult(false);

    ctx.Session.Remove("user_id");
    ctx.Session.Clear();

    return Task.FromResult(true);
  }
}
