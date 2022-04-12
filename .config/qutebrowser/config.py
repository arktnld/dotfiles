import dracula.draw
import os

# load config also in GUI
config.load_autoconfig()

## basic
c.content.images = False
c.content.javascript.enabled = False
c.content.autoplay = False
c.content.blocking.enabled = True
c.content.notifications.enabled = False
c.content.pdfjs = False
# c.content.cookies.store = False

# qutebrowser behavior
c.hints.mode = 'number'
c.scrolling.bar = 'never'
c.tabs.position = 'left'
c.url.start_pages = "https://calendar.google.com/"
c.spellcheck.languages = ['en-US', 'pt-BR']
c.downloads.location.directory = os.path.expanduser("~/Downloads")
c.window.hide_decoration = False

# other options
c.content.canvas_reading = False
c.content.cookies.accept = 'no-3rdparty'
c.content.desktop_capture = False
c.content.geolocation = False
c.content.headers.referer = 'never'
c.content.headers.user_agent = 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {qt_key}/{qt_version} {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}'
c.content.hyperlink_auditing = False
c.content.javascript.alert = False
c.content.media.audio_capture = False
c.completion.timestamp_format = '%d-%m-%Y %H:%M'
c.content.headers.accept_language = 'en-US,en;q=0.5'
c.content.headers.custom = {"accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}
c.content.webgl = False

# darkmode settings
# c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.grayscale.images = 0.5
c.colors.webpage.darkmode.policy.images = 'always'
c.colors.webpage.darkmode.policy.page = 'always'
c.colors.webpage.bg = '#111111'

# adblock
c.content.blocking.method = "adblock"
c.content.blocking.hosts.block_subdomains = True
c.content.blocking.whitelist = []
c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://raw.githubusercontent.com/ABPindo/indonesianadblockrules/master/subscriptions/abpindo.txt",
    "https://raw.githubusercontent.com/hoshsadiq/adblock-nocoin-list/master/nocoin.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badlists.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badware.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2020.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2021.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/legacy.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/resource-abuse.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/unbreak.txt",
    "https://raw.githubusercontent.com/brave/adblock-lists//master/brave-lists/brave-firstparty-cname.txt",
    "https://raw.githubusercontent.com/brave/adblock-lists//master/brave-lists/brave-firstparty.txt",
    "https://raw.githubusercontent.com/brave/adblock-lists//master/brave-lists/brave-social.txt",
]
c.content.blocking.hosts.lists = [
    'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts',
    "https://gitcdn.xyz/repo/curbengh/urlhaus-filter/master/urlhaus-filter-online.txt",
    "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=1&mimetype=plaintext"
]

# text editor
c.editor.command = ['tilix', '--new-process', '-e', 'nvim', '-c', 'normal {line}G{column0}l', '{file}']
c.editor.encoding = 'utf-8'

## fonts
c.fonts.default_family = ['Source Code Pro']
c.fonts.default_size = '10pt'
dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})

# aliases
c.aliases['w'] = 'session-save'
c.aliases['q'] = 'quit'
c.aliases['wq'] = 'quit --save'
c.aliases['timer'] = 'open -t https://fitlb.com/tabata-timer'
c.aliases['empty'] = 'open -t ~/.config/qutebrowser/templates/empty.html'
c.aliases['mpv'] = 'spawn --userscript view_in_mpv'
c.aliases['ytdl'] = """spawn -v -m bash -c 'cd ~/Videos && youtube-dl "$@"' _ {url}"""

# mappings
c.bindings.key_mappings['<Ctrl-[>'] = '<Escape>'
c.bindings.key_mappings['<Shift-Return>'] = '<Return>'
c.bindings.key_mappings['<Shift-Enter>'] = '<Return>'
c.bindings.key_mappings['<'] = 'gK'
c.bindings.key_mappings['>'] = 'gJ'

# search Engines
c.url.searchengines['DEFAULT'] = 'https://duckduckgo.com/?q={}'
c.url.searchengines['a'] = 'https://www.amazon.com.br/s/?field-keywords={}'
c.url.searchengines['b'] = 'https://www.bing.com/search?q={}'
c.url.searchengines['c'] = 'https://www.comparajogos.com.br/todos?q={}'
c.url.searchengines['g'] = 'https://www.google.com/search?q={}'
c.url.searchengines['l'] = 'https://www.ludopedia.com.br/search?search={}'
c.url.searchengines['o'] = 'https://df.olx.com.br/?q={}'
c.url.searchengines['gh'] = 'https://github.com/search?q={}'
c.url.searchengines['ghc'] = 'https://github.com/search?q={}&type=Code'
c.url.searchengines['si'] = 'sinonimos: https://www.sinonimos.com.br/{}'
c.url.searchengines['enpt'] = 'https://translate.google.com/?sl=en&tl=pt&text={}'
c.url.searchengines['pten'] = 'https://translate.google.com/?sl=pt&tl=en&text={}'
# c.url.searchengines['y'] = 'https://www.youtube.com/results?search_query={}'

## bindings
config.bind('O', 'set-cmd-text -s :open')
config.bind('f', 'hint all tab-fg')
config.bind('F', 'hint all')
config.bind('d', 'scroll-page 0 1')
config.bind('u', 'scroll-page 0 -1')
config.bind('o', 'set-cmd-text -s :open -t')
config.bind('x', 'tab-close')
config.bind('X', 'undo')
config.bind('?', 'open -t qute://help/img/cheatsheet-big.png')

# custom bindings
config.bind(',q', 'close')
config.bind(',c', 'spawn -d chromium {url}')
config.bind(',r', 'spawn --userscript readability-js')
config.bind(',d', 'config-cycle colors.webpage.darkmode.enabled ;; restart')
config.bind(',v', 'hint links spawn tdrop -h 70% -w 70% -x 250 -y 150 -ma -n mpv mpv {hint-url}')
config.bind(',V', 'hint links spawn mpv --no-video {hint-url}')

# javascript, images and cookies whitelist
config.set('content.cookies.accept', 'never', '*') # Desable cookies for all websites with the exception of sites specified to use.
config.set('content.javascript.enabled', True, 'file://*/*')   # system
config.set('content.images', True, 'file://*/*')               #
config.set('content.javascript.enabled', True, 'qute://*/*')   #
config.set('content.images', True, 'qute://*/*')               #
config.set('content.javascript.enabled', True, 'chrome://*/*') #
config.set('content.javascript.enabled', True, '*://*.duckduckgo.com/*') # duckduckgo
config.set('content.images', True, '*://*.duckduckgo.com/*')             #
# config.set('content.javascript.enabled', True, '*://*.bing.com/*') # bing
# config.set('content.images', True, '*://*.bing.com/*')             #
config.set('content.javascript.enabled', True, '*://*.google.com/*') # google
config.set('content.images', True, '*://*.google.com/*')             #
config.set('content.cookies.accept', 'all', '*://*.google.com/*')    #
# config.set('content.javascript.enabled', True, '*://*.youtube.com/*') # youtube
# config.set('content.images', True, '*://*.youtube.com/*')             #
# config.set('content.cookies.accept', 'all', '*://*.youtube.com/*')    #
config.set('content.javascript.enabled', True, '*://*.github.com/*') # github
config.set('content.images', True, '*://*.github.com/*')             #
config.set('content.cookies.accept', 'all', '*://*.github.com/*')    #
config.set('content.javascript.enabled', True, '*://*.reddit.com/*') # reddit
config.set('content.images', True, '*://*.reddit.com/*')             #
config.set('content.cookies.accept', 'all', '*://*.reddit.com/*')    #
# config.set('content.javascript.enabled', True, '*://*.comparajogos.com.br/*') # comparajogos
# config.set('content.images', True, '*://*.comparajogos.com.br/*')             #
# config.set('content.cookies.accept', 'all', '*://*.comparajogos.com.br/*')    #
# config.set('content.javascript.enabled', True, '*://*.ludopedia.com.br/*') # ludopedia
# config.set('content.images', True, '*://*.ludopedia.com.br/*')             #
# config.set('content.cookies.accept', 'all', '*://*.ludopedia.com.br/*')    #
config.set('content.javascript.enabled', True, '*://*.olx.com.br/*') # olx
config.set('content.images', True, '*://*.olx.com.br/*')             #
config.set('content.cookies.accept', 'all', '*://*.olx.com.br/*')    #
config.set('content.javascript.enabled', True, '*://*.messenger.com/*') # messenger
config.set('content.images', True, '*://*.messenger.com/*')             #
config.set('content.cookies.accept', 'all', '*://*.messenger.com/*')    #
# config.set('content.javascript.enabled', True, '*://*.amazon.com.br/*') # amazon
# config.set('content.images', True, '*://*.amazon.com.br/*')             #
# config.set('content.javascript.enabled', True, '*://*.tiendamia.com/*') # tiendamia
# config.set('content.images', True, '*://*.tiendamia.com/*')             #
config.set('content.javascript.enabled', True, '*://*.unip.br/*') # unip
config.set('content.images', True, '*://*.unip.br/*')             #
config.set('content.cookies.accept', 'all', '*://*.unip.br/*')    #
config.set('content.javascript.enabled', True, '*://*.catho.com.br/*') # catho
config.set('content.images', True, '*://*.catho.com.br/*')             #
config.set('content.cookies.accept', 'all', '*://*.catho.com.br/*')    #
config.set('content.javascript.enabled', True, '*://fitlb.com/*')         # others
config.set('content.javascript.enabled', True, '*://stackoverflow.com/*') #
