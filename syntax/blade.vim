" Language:     Blade
" Maintainer:   Jason Walton <jwalton512@gmail.com>
" URL:          https://github.com/xsbeats/vim-blade
" License:      DBAD

" Check if our syntax is already loaded
if exists('b:current_syntax') && b:current_syntax == 'blade'
    finish
endif

" Include PHP
runtime! syntax/php.vim
silent! unlet b:current_syntax

" Echos
syn region bladeUnescapedEcho matchgroup=bladeEchoDelim start=/@\@<!\s*{!!/ end=/!!}\s*/ oneline contains=@phpClTop containedin=ALLBUT,bladeComment
syn region bladeEscapedEcho matchgroup=bladeEchoDelim start=/@\@<!\s*{{{\@!/ end=/}}\s*/ oneline contains=@phpClTop containedin=ALLBUT,bladeComment
syn region bladeEscapedEcho matchgroup=bladeEchoDelim start=/@\@<!\s*{{{{\@!/ end=/}}}/ oneline contains=@phpClTop containedin=ALLBUT,bladeComment

" Structures
" syn match bladeStructure /\s*@\(else\|empty\|endfor\|endforeach\|endforelse\|endif\|endpush\|endsection\|endunless\|endwhile\|overwrite\|show\|stop\)\>/
" syn match bladeStructure /\s*@\(append\|choice\|each\|elseif\|extends\|for\|foreach\|forelse\|if\|include\|lang\|push\|section\|stack\|unless\|while\|yield\|\)\>\s*/ nextgroup=bladeParenBlock
" syn region bladeParenBlock start="(" end=")" contained containedin=bladeStructure contains=ALLBUT,bladeComment

" Comments
" syn region bladeCommentBlock start=/\s*{{--/ end=/--}}/ contains=bladeComment keepend
" syn match bladeComment /.*/ contained containedin=bladeCommentBlock

" Highlighting
hi def link bladeComment        Comment
hi def link bladeEchoDelim      Delimiter
hi def link bladeStructure      Keyword
