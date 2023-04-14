serenade.global().command("left", async api => {
  await api.pressKey("left");
});

serenade.global().command("right", async api => {
  await api.pressKey("right");
});

serenade.global().command("up", async api => {
  await api.pressKey("up");
});

serenade.global().command("down", async api => {
  await api.pressKey("down");
});