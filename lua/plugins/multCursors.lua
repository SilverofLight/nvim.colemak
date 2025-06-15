return {
  "mg979/vim-visual-multi",
  event = "VeryLazy",
  init = function()
    vim.cmd([[
let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
let g:VM_maps                       = {}
let g:VM_custom_motions             = {'h': 'h', 'i': 'l', 'e': 'k', 'n': 'j'}
let g:VM_maps['i']                  = 'u'
let g:VM_maps['I']                  = 'U'
let g:VM_maps['Find Under']         = '<C-k>'
let g:VM_maps['Find Subword Under'] = '<C-k>'
let g:VM_maps['Find Next']          = ''
let g:VM_maps['Find Prev']          = ''
let g:VM_maps['Remove Region']      = 'q'
let g:VM_maps['Skip Region']        = '<c-n>'
let g:VM_maps["Undo"]               = 'l'
let g:VM_maps["Redo"]               = '<C-r>'
let g:VM_maps["Add Cursor Down"]    = '<S-Down>'
let g:VM_maps["Add Cursor Up"]      = '<S-Up>'
"noremap <leader>sa <Plug>(VM-Select-All)
]])
  end
}
