version = "0.17.6"

-- Prompt
xplr.config.general.prompt.format = "❯ "

-- Icons
package.path = os.getenv("HOME") .. '/.config/xplr/xplr-icons.lua'
require"icons".setup()
