local g = vim.g
local cmd = vim.cmd

g.silicon = {
  theme = 'TwoDark',
  font = 'Hack',
  background = '#686868',
  output = '~/Desktop/silicon-{time:%Y-%m-%d-%H%M%S}.png'
}


cmd "let g:silicon['line-number'] = v:false"
cmd "let g:silicon['round-corner'] = v:true"
cmd "let g:silicon['window-controls'] = v:false"
