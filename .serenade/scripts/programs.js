serenade.global().command("launch chrome work", async api => {
  await api.runShell('"C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe"', ['https://www.perplexity.ai/ --profile-directory="Profile 1"'], {shell: true})
})

serenade.global().command("launch chrome me", async api => {
  await api.runShell('"C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe"', ['https://www.perplexity.ai/ --profile-directory="Profile 2"'], {shell: true})
})