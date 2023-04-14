serenade.app("chrome").command("bookmarks bar", async api => {
  await api.pressKey("d", ["alt"]);
  await api.pressKey("f6");
  await api.pressKey("f6");
})

serenade.app("chrome").command("more", async api => {
  await api.pressKey("d")
})

serenade.app("chrome").command("less", async api => {
  await api.pressKey("u")
})
