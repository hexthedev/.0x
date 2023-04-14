serenade.global().command("win next", async api => {
  await api.pressKey("right", ["control", "windows"]);
});

serenade.global().command("win back", async api => {
  await api.pressKey("left", ["control", "windows"]);
});

serenade.global().command("win task", async api => {
  await api.pressKey("t", ["windows"]);
});

serenade.global().command("switch", async api => {
  await api.pressKey("tab", ["alt"]);
});