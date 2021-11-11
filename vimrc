
" Plugin
call plug#begin('~/.vim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'chemzqm/vim-jsx-improve'
Plug 'luochen1990/rainbow'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
" gcc per commentare una linea, gc{motion} per commentare diverse linee
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
" Con repeat posso usare . per ripetere l'azione di surround
Plug 'tpope/vim-repeat'

call plug#end()


" --------------------------------- Settings
set exrc " Permette la lettura del file .vimrc nella directory corrente se presente. (Se sei in una cartella con un vimrc legge quello)"
set relativenumber " Setta i numeri relativi delle righe "
set nu " Mostra il numero di riga nella riga "
set nohlsearch " Evidenzia tutti i match per l'ultimo pattern di ricerca usato"
set nowrap " Disattiva il wrap delle linee lunghe (cioè non va a capo automaticamente senza cambiare linea)"
set textwidth=0 " Lunghezza della riga sopra cui tagliare la riga"
set tabstop=4 softtabstop=4 " Setto un tab a 4 spazi"
set shiftwidth=4 " Numero di spazi usati per l'autoindentazione "
set expandtab " Fa in modo che quando uso <TAB> inserisce gli spazi"
set smartindent " Auto indentazione intelligente"
set scrolloff=8 " Offset di scrolling con CTRL-y e CTRL-e "
set completeopt=menuone,noinsert,noselect " Quando usare un menù popup per auto completamento nell'insert mode"
set signcolumn=yes " Mostra la colonna a sinistra"
set colorcolumn=80 " Determina il colore della colonna a sinistra"
set splitbelow " Quando splitta le finestre le mette sotto "
set termguicolors " Usa GUI color per il terminale "
set hidden " Non elimina un buffer quando non è più mostrato in una finestra"
set updatetime=300 " Tempo in ms dopo il quale il file swap viene caricato "
set shortmess+=c " ho aggiunto c alla lista di flag per rendere i messaggi più corti"
set nobackup " Non salva il backup dopo aver sovrascritto un file "
set nowritebackup " Non salva un backup prima di aver sovrascritto un file"
set nrformats= " Formati numerici riconosciuti per CTRL-a e CTRL-x. Penso che siano attivi alpha, octal e hex"
set mouse=a " Penso che attivi tutte le cose del mouse"
set bg=dark " Setta la versione scura del coloscheme selezionato "

" ------------------------------------ Remaps -------------------------------
let mapleader=" "

" Salva con crtl-s
nnoremap <C-s> :w<cr>
" Apre l'explorer nella cartella contenente il file che sto editando
nnoremap <leader>ex  :Explore  "expand('%:h').'/'"<cr>
nnoremap <leader>vex :Vexplore "expand('%:h').'/'"<cr>
nnoremap <leader>sex :Sexplore "expand('%:h').'/'"<cr>
" Copia e incolla da clipboard
vnoremap <C-c> "+yi
vnoremap <C-x> "+c
vnoremap <C-v> c<esc>"+p
inoremap <C-v> <esc>"+pa
" remap di spostamento tra i buffer. Destra e sinistra per andare avanti e indietro, su e giu per passare a primo e ultimo
nnoremap <right> :bnext<cr>
nnoremap <left>  :bprev<cr>
nnoremap <up>    :bfirst<cr>
nnoremap <down>  :blast<cr>
" digita %% nella command line mode per avere il path del file attuale
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" ----------------------------------------------------------------------------

" ------------------------------------ Comandi -------------------------------
" Rel per fare salva e ricarica del file
command! Rel :w <bar> :so %

" ----------------------------------------------------------------------------


" --------------------------- Funzioni e autocomandi ------------------------
"  Cancella gli spazi bianchi alla fine di una riga
function! s:TrimWhiteSpace()
    " Salva il contesto attuale
    let l:save = winsaveview()
    " Sostituisce gli spazi bianchi alla fine di una frase con niente
    keeppatterns %s/\s\+$//e
    " Ripristina il contesto attuale
    call winrestview(l:save)
endfunction

" AutoComando per rimuovere gli spazi
augroup spazi
    " Rimuove tutti gli autocomandi per il gruppo
    " Se non lo mettessi, chiamerei l'autocomando ogni volta che il file viene caricato
    autocmd!
    " prima di scrivere sul buffer, eseguo su tutti i tipi di file (*) il comando :call TrimWhiteSpace per eliminare gli spazi
    autocmd BufWritePre * :call <SID>TrimWhiteSpace()
augroup END

" AutoComando per leggere i file .C come cpp 
augroup cplusplus
    autocmd!
    autocmd BufNewFile,BufRead *.C set filetype=cpp
augroup END


" ----------------------------------------------------------------------------

" -------------------------- Impostazioni generiche --------------------------

" Coloscheme e background
colorscheme gruvbox
" Toglie il background al colorscheme. Così il bg di vim sarà il bg del
" terminale
highlight Normal guibg=NONE
" Nota che su nvim si usa none, su vim ci vuole NONE!

" Attiva il plugin rainbow globalmente
let g:rainbow_active = 1


" Risolve il problema che si vede solo la linea su tmux.
" Con questi il cursore è mostrato correttamente
" Questo problema su neovim non c'è
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" ----------------------------------------------------------------------------
"
"
"  --------------------- Impostazioni airline
"  Setto il tema di airline
let g:airline_theme='gruvbox'

