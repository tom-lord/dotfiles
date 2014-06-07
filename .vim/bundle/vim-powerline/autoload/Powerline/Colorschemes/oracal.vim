" This theme is based on Solarized-dark colors, combined
" with Powerline native colors
call Pl#Hi#Allocate({
	\ 'black'          : 16,
	\ 'white'          : 231,
	\
	\ 'darkestgreen'   : 22,
	\ 'darkgreen'      : 28,
	\ 'mediumgreen'    : 70,
	\ 'brightgreen'    : 148,
	\
	\ 'darkestcyan'    : 23,
	\ 'mediumcyan'     : 117,
	\
	\ 'darkestblue'    : 24,
	\ 'darkblue'       : 31,
	\
	\ 'darkestred'     : 52,
	\ 'darkred'        : 88,
	\ 'mediumred'      : 124,
	\ 'brightred'      : 160,
	\ 'brightestred'   : 196,
	\
	\ 'darkestpurple'  : 55,
	\ 'mediumpurple'   : 98,
	\ 'brightpurple'   : 189,
	\
	\ 'brightorange'   : 208,
	\ 'brightestorange': 214,
	\
	\ 'gray0'          : 233,
	\ 'gray1'          : 235,
	\ 'gray2'          : 236,
	\ 'gray3'          : 239,
	\ 'gray4'          : 240,
	\ 'gray5'          : 241,
	\ 'gray6'          : 244,
	\ 'gray7'          : 245,
	\ 'gray8'          : 247,
	\ 'gray9'          : 250,
	\ 'gray10'         : 252,
	\
	\ 'base00'         : [241, 0x657b83],
	\ 'base01'         : [240, 0x586e75],
	\ 'base02'         : [0, 0x073642],
	\ 'base03'         : [234, 0x002b36],
	\ 'base0'          : [244, 0x839496],
	\ 'base1'          : [245, 0x93a1a1],
	\ 'base2'          : [254, 0xeee8d5],
	\ 'base3'          : [230, 0xfdf6e3],
	\ 'yellow'         : [136, 0xb58900],
	\ 'orange'         : [166, 0xcb4b16],
	\ 'red'            : [160, 0xdc322f],
	\ 'magenta'        : [125, 0xd33682],
	\ 'violet'         : [61, 0x6c71c4],
	\ 'blue'           : [33, 0x268bd2],
	\ 'cyan'           : [37, 0x2aa198],
	\ 'green'          : [64, 0x859900],
	\ })

let g:Powerline#Colorschemes#oracal#colorscheme = Pl#Colorscheme#Init([
	\ Pl#Hi#Segments(['SPLIT'], {
		\ 'n': ['white', 'base02'],
		\ 'N': ['white', 'base02'],
		\ }),
	\
	\ Pl#Hi#Segments(['mode_indicator'], {
		\ 'n': ['white', 'violet'],
        \ 'i': ['white', 'base03'],
		\ 'v': ['base03', 'brightorange'],
		\ 'r': ['base03', 'brightgreen'],
		\ 's': ['white', 'gray5'],
		\ }),
	\
	\ Pl#Hi#Segments(['branch', 'raw', 'filesize'], {
		\ 'n': ['white', 'blue'],
		\ 'N': ['base2', 'darkestblue'],
		\ }),
	\
	\ Pl#Hi#Segments(['scrollpercent'], {
		\ 'n': ['white', 'darkestblue'],
		\ 'N': ['base1', 'base02'],
		\ }),
	\
	\ Pl#Hi#Segments(['fileinfo', 'filename', 'filepath'], {
		\ 'n': ['white', 'darkestblue'],
		\ 'N': ['base1', 'base02'],
		\ }),
	\
	\ Pl#Hi#Segments(['fileinfo.filepath'], {
		\ 'n': ['gray10'],
		\ 'N': ['gray5'],
		\ 'i': ['mediumcyan'],
		\ }),
	\
	\ Pl#Hi#Segments(['static_str'], {
		\ 'n': ['white', 'violet'],
		\ 'N': ['base1', 'base02'],
		\ }),
	\
	\ Pl#Hi#Segments(['fileinfo.flags'], {
		\ 'n': ['base03'],
		\ 'N': ['gray5'],
		\ 'i': ['base03'],
		\ }),
	\
	\ Pl#Hi#Segments(['currenttag', 'fullcurrenttag', 'fileformat', 'fileencoding', 'pwd', 'filetype', 'rvm:string', 'rvm:statusline', 'virtualenv:statusline', 'charcode', 'currhigroup'], {
		\ 'n': ['mediumcyan', 'base02'],
		\ }),
	\
	\ Pl#Hi#Segments(['lineinfo'], {
		\ 'n': ['white', 'blue'],
		\ 'N': ['base2', 'darkestblue'],
		\ }),
	\
	\ Pl#Hi#Segments(['errors'], {
		\ 'n': ['mediumcyan', 'base02'],
		\ }),
	\
	\ Pl#Hi#Segments(['lineinfo.line.tot'], {
		\ 'n': ['white'],
		\ }),
	\
	\ Pl#Hi#Segments(['paste_indicator', 'ws_marker'], {
        \ 'n': ['base03', 'white'],
		\ }),
	\
	\ Pl#Hi#Segments(['gundo:static_str.name', 'command_t:static_str.name'], {
		\ 'n': ['white', 'violet'],
		\ 'N': ['base2', 'darkestblue'],
		\ }),
	\
	\ Pl#Hi#Segments(['gundo:static_str.buffer', 'command_t:raw.line'], {
		\ 'n': ['mediumcyan', 'base02'],
		\ 'N': ['base1', 'base02'],
		\ }),
	\
	\ Pl#Hi#Segments(['gundo:SPLIT', 'command_t:SPLIT'], {
		\ 'n': ['white', 'base02'],
		\ }),
	\
	\ Pl#Hi#Segments(['lustyexplorer:static_str.name', 'minibufexplorer:static_str.name', 'nerdtree:raw.name', 'tagbar:static_str.name'], {
		\ 'n': ['white', 'violet'],
		\ 'N': ['base2', 'darkestblue'],
		\ }),
	\
	\ Pl#Hi#Segments(['lustyexplorer:static_str.buffer', 'tagbar:static_str.buffer'], {
		\ 'n': ['mediumcyan', 'base02'],
		\ 'N': ['base1', 'base02'],
		\ }),
	\
	\ Pl#Hi#Segments(['lustyexplorer:SPLIT', 'minibufexplorer:SPLIT', 'nerdtree:SPLIT', 'tagbar:SPLIT'], {
		\ 'n': ['white', 'base02'],
		\ 'N': ['white', 'base02'],
		\ }),
	\
	\ Pl#Hi#Segments(['ctrlp:focus'], {
		\ 'n': ['white', 'darkestblue'],
		\ }),
	\
	\ Pl#Hi#Segments(['ctrlp:byfname'], {
		\ 'n': ['white', 'blue'],
		\ }),
	\
	\ Pl#Hi#Segments(['ctrlp:prev', 'ctrlp:next', 'ctrlp:pwd'], {
		\ 'n': ['white', 'darkestblue'],
		\ }),
	\
	\ Pl#Hi#Segments(['ctrlp:item'], {
		\ 'n': ['white', 'blue'],
		\ }),
	\
	\ Pl#Hi#Segments(['ctrlp:marked'], {
		\ 'n': ['mediumcyan', 'base02'],
		\ }),
	\
	\ Pl#Hi#Segments(['ctrlp:count'], {
		\ 'n': ['white', 'darkestblue'],
		\ }),
	\
	\ Pl#Hi#Segments(['ctrlp:SPLIT'], {
		\ 'n': ['white', 'base02'],
		\ }),
  \
  \ Pl#Hi#Segments(['status'], {
		\ 'n': ['green', 'base02'],
		\ 'N': ['gray5', 'base02'],
    \ }),
\ ])
