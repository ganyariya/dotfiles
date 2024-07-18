-- https://www.lazyvim.org/extras/ui/alpha
-- 実際のキーマップはカスタマイズしないといけない
return {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
};
