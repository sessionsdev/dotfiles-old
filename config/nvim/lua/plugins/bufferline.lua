local function configBufferline()
    require("bufferline").setup{}
end

return {
    'akinsho/bufferline.nvim', 
    version = "*", 
    dependencies = 'nvim-tree/nvim-web-devicons',
    config=configBufferline,
}
