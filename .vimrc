
"set nocompatible

" Vim起動完了時にインストール
augroup PluginInstall
  autocmd!
  autocmd VimEnter * if dein#check_install() | call dein#install() | endif
augroup END

" 各プラグインをインストールするディレクトリ
let s:plugin_dir = expand('~/.vim/bundle/')
" dein.vimをインストールするディレクトリをランタイムパスへ追加
let s:dein_dir = s:plugin_dir . 'repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . s:dein_dir

" dein.vimがまだ入ってなければ 最初に`git clone`
if !isdirectory(s:dein_dir)
  call mkdir(s:dein_dir, 'p')
  silent execute printf('!git clone %s %s', 'https://github.com/Shougo/dein.vim', s:dein_dir)
endif

if dein#load_state(s:plugin_dir)
  call dein#begin(s:plugin_dir)
"
"  " ここからインストールするプラグインを書いていく
"  call dein#add('Shougo/dein.vim')
"
"  " インストール後ビルドする場合
"  call dein#add('Shougo/vimproc.vim', {
"        \ 'build': {
"        \     'mac': 'make -f make_mac.mak',
"        \     'linux': 'make',
"        \     'unix': 'gmake',
"        \    },
"        \ })
"
"  " 条件によって使ったり使わなかったり制御する場合
"  call dein#add('Shougo/neocomplete.vim', {
"        \ 'if' : has('lua')
"        \ })
"
"  " 依存関係がある場合
"  call dein#add('Shougo/unite.vim')
"  call dein#add('ujihisa/unite-colorscheme', {'depends' : 'Shougo/unite.vim'})
"
"  " 手動でcall dein#source('プラグイン名')して使い始める場合
"  call dein#add('Shougo/vimfiler', {'lazy' : 1})
"
"  " 指定のファイルタイプ使う場合
"  call dein#add('tpope/vim-rails', {'on_ft' : 'ruby'})
"
"  " dein.vimで管理して更新だけするリポジトリ（NeoBundleFetchとおなじ）
"  call dein#add('jszakmeister/markdown2ctags', {'rtp': ''})
"
"  " サブディレクトリを指定してdein#add()する場合
"  " frozenオプションは自動で更新しない
"  " 自分で開発するプラグインの管理に便利
"  call dein#local('~/src/github.com/violetyk',
"        \ {
"        \   'frozen' : 1,
"        \   'depends' : [
"        \     'kana/vim-gf-user',
"        \     'Shougo/neosnippet.vim',
"        \     'vim-jp/vital.vim'
"        \   ]
"        \ },
"        \ [
"        \   '*.vim',
"        \   'neosnippet-*',
"        \   'neocomplete-*',
"        \   'scratch-utility'
"        \ ])



  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on



" シンタックスハイライト
syntax on
set clipboard=unnamedplus

" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk


" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>


