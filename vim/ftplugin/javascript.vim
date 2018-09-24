
" Enable ESLint only for JavaScript.
"let b:ale_linters = ['eslint']

" Equivalent to the above.
let b:ale_linters = {'javascript': ['./node_modules/eslint/bin/eslint.js']}
