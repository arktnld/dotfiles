" Vim syntax script
" Author: Peter Odding <peter@peterodding.com>
" Last Change: March 15, 2015
" URL: http://peterodding.com/code/vim/text/

" Quit when a syntax file was already loaded.
if exists('b:current_syntax')
  finish
endif

" Tell Vim to start redrawing by rescanning all previous text.
" syntax sync fromstart

" Check for spelling errors in all text.
syntax spell toplevel

" Inline elements.

" Cluster of elements which never contain a newline character.
syntax cluster textInline contains=textName

" Default highlighting style for text syntax markers.
highlight def link textHiddenMarker Ignore

" Highlight note names as hyperlinks.
syntax cluster textInline add=textName
highlight def link textName Underlined

" Highlight quoted fragments.
syntax match textDoubleQuoted /\w\@<!“.\{-}”\w\@!/
syntax match textSingleQuoted /\w\@<!‘.\{-}’\w\@!/
highlight def link textSingleQuoted Special
highlight def link textDoubleQuoted String

" Highlight inline code fragments (same as Markdown syntax).
syntax region textInlineCode matchgroup=textInlineCodeMarker start=/`/ end=/`/ concealends
highlight link textItalicMarker textInlineCodeMarker
syntax cluster textInline add=textInlineCode
highlight def link textInlineCode Special

" Highlight text emphasized in italic font.
syntax region textItalic matchgroup=textItalicMarker start=/\<_\k\@=/ end=/_\>\|\n/ contains=@Spell concealends
highlight link textItalicMarker textHiddenMarker
syntax cluster textInline add=textItalic
highlight textItalic gui=italic cterm=italic

" Highlight text emphasized in bold font.
syntax region textBold matchgroup=textBoldMarker start=/\*\k\@=/ end=/\S\@<=\*/ contains=@Spell concealends
highlight link textBoldMarker textHiddenMarker
syntax cluster textInline add=textBold
highlight textBold gui=bold cterm=bold

" Highlight text emphasized in bold font.
syntax region textUnderline matchgroup=textUnderlineMarker start=/&\k\@=/ end=/\S\@<=&/ contains=@Spell concealends
highlight link textUnderlineMarker textHiddenMarker
syntax cluster textInline add=textUnderline
highlight textUnderline gui=underline cterm=underline

" Highlight inline code fragments (same as Markdown syntax). {{{2
syntax region notesInlineCode matchgroup=notesInlineCodeMarker start=/`/ end=/`/ concealends
highlight link notesItalicMarker notesInlineCodeMarker
syntax cluster notesInline add=notesInlineCode
highlight def link notesInlineCode Special

" Block level elements.

" The first line of each note contains the title.
syntax match textTitle /^.*\%1l.*$/ contains=@textInline
highlight def link textTitle ModeMsg

" Short sentences ending in a colon are considered headings.
syntax match textShortHeading /^\s*\zs\u.\{1,50}\k:\ze\(\s\|$\)/ contains=@textInline
highlight def link textShortHeading Title

" Atx style headings are also supported.
syntax match textAtxHeading /^#\+.*/ contains=textAtxMarker,@textInline
highlight def link textAtxHeading Title
syntax match textAtxMarker /^#\+/ contained
highlight def link textAtxMarker Comment

" Horizontal rulers.
syntax match textRule /\(^\s\+\)\zs\*\s\*\s\*$/
highlight def link textRule Comment

" FIXME This setting is lost once the user switches color scheme!
highlight textSubtleURL gui=underline guifg=fg

syntax match textTextURL @\<www\.\(\S*\w\)\+/\?@
syntax cluster textInline add=textTextURL
highlight def link textTextURL textSubtleURL
execute printf('syntax match textRealURL @%s@', '\<\(mailto:\|javascript:\|\w\{3,}://\)\(\S*\w\)\+/\?')
syntax cluster textInline add=textRealURL
syntax match textUrlScheme @\(mailto:\|javascript:\|\w\{3,}://\)@ contained containedin=textRealURL conceal
highlight def link textUrlScheme textRealURL
syntax match textEmailAddr /\<\w[^@ \t\r]*\w@\w[^@ \t\r]\+\w\>/
syntax cluster textInline add=textEmailAddr
highlight def link textEmailAddr textSubtleURL
syntax match textUnixPath /\k\@<![\/~]\S\+\(\/\|[^ [:punct:]]\)/
syntax cluster textInline add=textUnixPath
highlight def link textUnixPath Directory
syntax match textPathLnum /:\d\+/ contained containedin=textUnixPath
highlight def link textPathLnum Comment
syntax match textWindowsPath /\k\@<![A-Za-z]:\S\+\([\\/]\|[^ [:punct:]]\)/
syntax cluster textInline add=textWindowsPath
highlight def link textWindowsPath Directory

"
"
" Code Syntax Highlight
"
"

function! SyntaxInclude(filetype)
  " Include the syntax highlighting of another {filetype}.
  let grouplistname = '@' . toupper(a:filetype)
  " Unset the name of the current syntax while including the other syntax
  " because some syntax scripts do nothing when "b:current_syntax" is set.
  if exists('b:current_syntax')
    let syntax_save = b:current_syntax
    unlet b:current_syntax
  endif
  try
    execute 'syntax include' grouplistname 'syntax/' . a:filetype . '.vim'
    execute 'syntax include' grouplistname 'after/syntax/' . a:filetype . '.vim'
  catch /E403/
    " Ignore errors about syntax scripts that can't be loaded more than once.
    " See also: https://github.com/xolox/vim-s/issues/68
  catch /E484/
    " Ignore missing scripts.
  endtry
  " Restore the name of the current syntax.
  if exists('syntax_save')
    let b:current_syntax = syntax_save
  elseif exists('b:current_syntax')
    unlet b:current_syntax
  endif
  return grouplistname
endfunction

function! HighlightSourceCode(force) " {{{3
  " Syntax highlight source code embedded in s.
  " Look for code blocks in the current .
  let filetypes = {}
  for line in getline(1, '$')
    let ft = matchstr(line, '\({{[{]\|```\)\zs\w\+\>')
    if ft !~ '^\d*$' | let filetypes[ft] = 1 | endif
  endfor
  " Don't refresh the highlighting if nothing has changed.
  if !a:force && exists('b:s_previous_sources') && b:text_previous_sources == filetypes
    return
  else
    let b:s_previous_sources = filetypes
  endif
  " Now we're ready to actually highlight the code blocks.
  if !empty(filetypes)
    let startgroup = 'sCodeStart'
    let endgroup = 'sCodeEnd'
    for ft in keys(filetypes)
      let group = 'sSnippet' . toupper(ft)
      let include = SyntaxInclude(ft)
      for [startmarker, endmarker] in [['{{{', '}}}'], ['```', '```']]
        let conceal = 1
        let command = 'syntax region %s matchgroup=%s start="%s%s \?" matchgroup=%s end="%s" keepend contains=%s%s'
        execute printf(command, group, startgroup, startmarker, ft, endgroup, endmarker, include, conceal ? ' concealends' : '')
      endfor
    endfor
    if &vbs >= 1
      " call xolox#misc#timer#stop("s.vim %s: Highlighted embedded %s sources in %s.", g:xolox#text#version, join(sort(keys(filetypes)), '/'), starttime)
    endif
  endif
endfunction


syntax match sCodeStart /```\w*/
syntax match sCodeEnd /```\W/
syntax match sCodeStart /{{[{]\w*/
syntax match sCodeEnd /}}[}]/
highlight def link sCodeStart Ignore
highlight def link sCodeEnd Ignore
call HighlightSourceCode(1)

" Set the currently loaded syntax mode.
let b:current_syntax = 'text'

" vim: ts=2 sw=2 et bomb fdl=1
