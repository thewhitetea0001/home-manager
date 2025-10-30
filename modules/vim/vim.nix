{ pkgs, ... }:
{
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ onedark-vim ];
    settings = { ignorecase = true; };
    extraConfig = ''
      set mouse=a
      set number
      set tabstop=2
      set shiftwidth=2
      set noexpandtab
      set smarttab
      set termguicolors
      set clipboard=unnamedplus
      colorscheme onedark

      autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
      autocmd ColorScheme * highlight NormalNC ctermbg=NONE guibg=NONE
      autocmd ColorScheme * highlight EndOfBuffer ctermbg=NONE guibg=NONE
      autocmd ColorScheme * highlight SignColumn ctermbg=NONE guibg=NONE
      autocmd ColorScheme * highlight VertSplit ctermbg=NONE guibg=NONE
      autocmd ColorScheme * highlight Pmenu ctermbg=NONE guibg=NONE
      autocmd ColorScheme * highlight PmenuSel ctermbg=NONE guibg=NONE
      autocmd ColorScheme * highlight NormalFloat ctermbg=NONE guibg=NONE
      autocmd ColorScheme * highlight Folded ctermbg=NONE guibg=NONE
      autocmd ColorScheme * highlight LineNr ctermbg=NONE guibg=NONE
    '';
  };
}
