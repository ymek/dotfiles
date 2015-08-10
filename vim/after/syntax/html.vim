unlet b:current_syntax
syn include @MUSTACHE $HOME/.vim/syntax/mustache.vim
syn region mustacheScriptTemplate start=+<script [^>]*type *=[^>]*text/\(mustache\|x-handlebars\|x-handlebars-template\)[^>]*>+
\                       end=+</script>+me=s-1 keepend
\                       contains=@MUSTACHE
