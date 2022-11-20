local cmp = require('cmp')
require("nvim-autopairs").setup {
    check_ts = true,
    enable_check_bracket_line = false,
    fast_wrap = {
      map = '<M-e>',
      chars = { '{', '[', '(', '"', "'" },
      pattern = [=[[%'%"%)%>%]%)%}%,]]=],
      end_key = '$',
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      check_comma = true,
      highlight = 'Search',
      highlight_grey='Comment'
    },

    cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done { tex = false })
}
