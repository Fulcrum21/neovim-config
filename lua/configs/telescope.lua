local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup {

    defaults = {

        prompt_prefix = " ",
        selection_caret = "❯",
        path_display = { "smart" },
        sorting_strategy = 'ascending',
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        mappings = {
            n = {
                ['q'] = actions.close,
            },
        },

    }
}
