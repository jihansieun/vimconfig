"====================================================
"= Display
"====================================================
set background=dark
set cul
autocmd InsertLeave,InsertEnter * set cul!
"autocmd InsertLeave,InsertEnter * set cuc!
"highlight Search ctermbg=black ctermfg=yellow cterm=underline      "Search highlight use underline
if has('multi_byte_ime') 
highlight Cursor guibg=green guifg=NONE " 영문 
highlight CursorIM guibg=Yellow guifg=NONE " 한글
endif

"====================================================
"= 기본 설정
"====================================================
"------ Display & Write
set modifiable
set number		        " 줄	
set ruler			    " 화면 우측 하단에 현재 커서의 위치(줄,칸)를 보여준다.
set title
set ts=4		        " tab stop - tab 크기
set sw=4		        " shift width - shift 크기 조절
set sts=4		        " soft tab stop - tab 이동 크기
set expandtab           " TAB을 space로 인식
set printoptions=portrait:n,wrap:n,duplex:off
set fileencodings=utf-8,euc-kr
set autoindent          "자동으로 들여쓰기
set cindent             "C 프로그램 작성 시 자동으로 들여쓰기
"------ Search
"set smartindent
set hlsearch	        " Highlight Search
set incsearch
set ignorecase			" 검색시 대소문자 무시  
set nowrapscan          " 검색시 문서의 끝에서 다시 처음으로 되돌아가 검색하지 않도록 지정 
set nobackup
set visualbell
set history=1000
set autowrite
set showmatch
set magic
set isfname+=$,{,}      " 'gf' 같이 cursor 가르치는 file jump시 '${project_name}/temp.txt' 변수 인식 

"====================================================
"= mapleader
"====================================================
" 일부 플러그인들이 단축키로 사용하는 mapleader 지정
let mapleader = ","
 

""====================================================
"= Bundle
"====================================================
" :BundleInstall       - install(update) bundles
" :BundleSearch    foo - search(or refresh cache first) for foo
" :BundleClean         - confirm(or auto-approve) removal of unused bundles

"git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

filetype off            " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

"My Bundles here:
" vim-scripts repos
"------ Checked
Plugin 'molokai'
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

Plugin 'snipMate'
Plugin 'showmarks'		" \mt,\mm
Plugin 'Mark'			" \m, \n, \r
Plugin 'TagHighlight'
Plugin 'luochen1990/rainbow'	"중첩 괄호를 다른 색으로 표시
Plugin 'bling/vim-airline'

Plugin 'The-NERD-tree'
Plugin 'wesleyche/SrcExpl.git'
Plugin 'taglist.vim'
Plugin 'bufexplorer.zip'
Plugin 'EasyMotion'
Plugin 'surround.vim'           " ys(w,W,iw,s), ds, cs, ('S' in block) brace-> ",',b,B,[,],(,),t(tags)

"------ TBD
Plugin 'L9'                     " l9 is a Vim-script library,  FuzzyFinder use F9
Plugin 'FuzzyFinder'

Plugin 'DirDiff.vim'
Plugin 'ctags.vim'
Plugin 'cscope.vim'
"Plugin 'cscope-quickfix'

"non github repos
"Plugin 'git://github.com/wesleyche/SrcExpl.git'
"Plugin 'Valloric/YouCompleteMe'  
"Plugin 'cscope-quickfix'

filetype plugin indent on     " required!

"====================================================
"= 키맵핑
"====================================================
map <F2> v]}zf	"코드의 { 부분에서 영역 접기
map <F3> zo		"영역 펼치기
map <F4> :BufExplorer<cr>


"------ like SourceInsight 
map <F7> :TlistToggle<CR>
map <F8> :SrcExplToggle<CR>
map <F9> :NERDTreeToggle<CR>

map <F11> :YRShow<CR>
"nnoremap <silent> <F11> :YRShow<CR>


"======================== YouCompleteMe  =======================================
"sudo apt-get install build-essential cmake python-dev (python-dev, cmake needed for YouCompleteMe in server)
"cd ~/.vim/bundle/YouCompleteMe;./install.sh --clang-completer
"let g:ycm_global_ycm_extra_conf = ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

"====================================================
"= Source Explorer config
"====================================================
" // Set the height of Source Explorer window 
let g:SrcExpl_winHeight = 8 

" // Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100 

" // Set "Enter" key to jump into the exact definition context 
" let g:SrcExpl_jumpKey = "<ENTER>" 

" // Set "Space" key for back from the definition context 
let g:SrcExpl_gobackKey = "<SPACE>" 

" // In order to Avoid conflicts, the Source Explorer should know what plugins 
" // are using buffers. And you need add their bufname into the list below 
" // according to the command ":buffers!" 
let g:SrcExpl_pluginList = [  "__Tag_List__",  "_NERD_tree_",  "Source_Explorer", " [BufExplorer]" ] 

" // Enable/Disable the local definition searching, and note that this is not 
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. 
" // It only searches for a match with the keyword according to command 'gd' 
let g:SrcExpl_searchLocalDef = 1 

" // Do not let the Source Explorer update the tags file when opening 
let g:SrcExpl_isUpdateTags = 0 

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
" //  create/update a tags file 
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 

" // Set "<F12>" key for updating the tags file artificially 
let g:SrcExpl_updateTagsKey = "<F12>" 

"====================================================
"= Tag List
"====================================================
filetype on"vim filetpye on
let Tlist_Ctags_Cmd="/usr/bin/ctags"
let Tlist_Inc_Winwidth=0
let Tlist_Exit_OnlyWindow=0
"window close=off
let Tlist_Auto_Open=0
let Tlist_Use_Right_Window=1

"====================================================
"= NERD Tree
"====================================================
let NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0

"====================================================
"= YankRing 
"====================================================
let g:yankring_history_dir = '~/.vim/tmp'

"====================================================
"= showmarks
"====================================================
let g:showmarks_enable = 1
" h: Help, m : Non-modifiable, p :
" Preview, q : Quickfix, r : Readonly
let g:showmarks_ignore_type= "hprmq"
let g:showmarks_include= "abcdefhijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" l : lowcase, u : upcase, o : other, m: multiple
highlight ShowMarksHLl term=bold ctermfg=white ctermbg=Black
highlight ShowMarksHLu term=bold ctermfg=white ctermbg=Black
highlight ShowMarksHLo term=bold ctermfg=white ctermbg=Black
highlight ShowMarksHLm term=bold ctermfg=white ctermbg=Black

"====================================================
"= Rainbow  
"====================================================
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

"====================================================
"= FuzzyFinder
"====================================================
" 파일명 탐색시 제외할 파일 이름 패턴 지정
"let g:fuf_coveragefile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp|class)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
map <Leader>ff <ESC>:FufCoverageFile!<CR>
map <Leader>fb <ESC>:FufBuffer!<CR>
map <Leader>fd <ESC>:FufDir!<CR>

"let g:FuzzyFinderOptions = { 'Base':{}, 'Buffer':{}, 'File':{}, 'Dir':{}, 'MruFile':{}, 'MruCmd':{}, 'FavFile':{}, 'Tag':{}, 'TaggedFile':{}}
"" 특정 파일 제외
"let g:FuzzyFinderOptions.File.excluded_path = '\v\~$|\.o$|\.exe$|\.bak$|\.swp$|\.class$|\.settings$|CVS|((^|[/\\])\.[/\\]$)' 
"" 대소문자 구분하기 (0 : 대소문자 구분, 1 : 대소문자 구분 안함)
"let g:FuzzyFinderOptions.Base.ignore_case = 0
"
"map <Leader>ff <ESC>:FuzzyFinderFile \*\*\/<CR>  " 현재 디렉토리 이하에서 파일명으로 검색해서 읽어오기 
"map <Leader>fb <ESC>:FuzzyFinderBuffer<CR>       " 버퍼 목록에서 검색해서 이동하기

"====================================================
"= tags 설정 (cscope, ctags)
"====================================================
"wget http://cscope.sourceforge.net/cscope_maps.vim; mv cscope_maps.vim ~/.vim/plugin 
"set cscopetag                " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
"set csprg=/usr/bin/cscope

"Cscope의 상대경로 문제를 해결하기 위해서 매번 cscope.out파일을 새로 읽는다.
function! LoadCscope()
  exe "silent cs reset"
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()
 
"현재 디렉토리부터 root 디렉토리까지 tags를 찾는다.
set tags=tags;/


"====================================================
"= Check Symbol
"====================================================
source ~/vimconfig/plugins/checksymbol.vim


" GUI Settings {

    " GVIM- (here instead of .gvimrc)
    if has('gui_running')
        set guioptions-=T           " Remove the toolbar
        set lines=40                " 40 lines of text instead of 24
        if has("gui_gtk2")
            "set guifont=Andale\ Mono\ Regular\ 16,Menlo\ Regular\ 15,Consolas\ Regular\ 16,Courier\ New\ Regular\ 18
            set guifont=나눔고딕코딩\ 12,Andale\ Mono\ Regular\ 16,Menlo\ Regular\ 15,Consolas\ Regular\ 16,Courier\ New\ Regular\ 18
        elseif has("gui_mac")
            set guifont=Andale\ Mono\ Regular:h16,Menlo\ Regular:h15,Consolas\ Regular:h16,Courier\ New\ Regular:h18        elseif has("gui_win32")
            set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
        endif
        if has('gui_macvim')
            set transparency=5      " Make the window slightly transparent
        endif
    else
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
        endif
        "set term=builtin_ansi       " Make arrow and other keys work
    endif

" }



