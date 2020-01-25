c.aliases = {
    'esc': 'fake-key <Esc>', 
    'git': 'open -t github.com',
    'gmail': 'open -t gmail.com', 
    'hn': 'open -t hckrnews.com',
    'o': 'open -t', 
    'q': 'quit', 
    'red': 'open -t reddit.com',
    'so': 'open -t stackoverflow.com',
    'tt': 'open -t twitter.com',
    'w': 'session-save', 
    'wq': 'quit --save',
    'yt': 'open -t youtube.com'
}

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'file://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

c.content.proxy = 'none'

c.url.default_page = 'https://google.com'

c.url.searchengines = {'DEFAULT': 'https://google.com/search?q={}'}

c.url.start_pages = 'https://google.com'
