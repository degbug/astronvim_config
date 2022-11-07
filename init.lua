--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key


-- local fold_handler = function(virtText, lnum, endLnum, width, truncate)
--         local newVirtText = {}
--         local suffix = ('  %d '):format(endLnum - lnum)
--         local sufWidth = vim.fn.strdisplaywidth(suffix)
--         local targetWidth = width - sufWidth
--         local curWidth = 0
--         for _, chunk in ipairs(virtText) do
--                 local chunkText = chunk[1]
--                 local chunkWidth = vim.fn.strdisplaywidth(chunkText)
--                 if targetWidth > curWidth + chunkWidth then
--                         table.insert(newVirtText, chunk)
--                 else
--                         chunkText = truncate(chunkText, targetWidth - curWidth)
--                         local hlGroup = chunk[2]
--                         table.insert(newVirtText, { chunkText, hlGroup })
--                         chunkWidth = vim.fn.strdisplaywidth(chunkText)
--                         -- str width returned from truncate() may less than 2nd argument, need padding
--                         if curWidth + chunkWidth < targetWidth then
--                                 suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
--                         end
--                         break
--                 end
--                 curWidth = curWidth + chunkWidth
--         end
--         table.insert(newVirtText, { suffix, 'MoreMsg' })
--         return newVirtText
-- end


local config = {

        -- Configure AstroNvim updates
        updater = {
                remote = "origin", -- remote to use
                channel = "stable", -- "stable" or "nightly"
                version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
                branch = "main", -- branch name (NIGHTLY ONLY)
                commit = nil, -- commit hash (NIGHTLY ONLY)
                pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
                skip_prompts = false, -- skip prompts about breaking changes
                show_changelog = true, -- show the changelog after performing an update
                auto_reload = false, -- automatically reload and sync packer after a successful update
                auto_quit = false, -- automatically quit the current session after a successful update
                -- remotes = { -- easily add new remotes to track
                --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
                --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
                --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
                -- },
        },

        -- Set colorscheme to use
        colorscheme = "default_theme",

        -- Add highlight groups in any theme
        highlights = {
                -- init = { -- this table overrides highlights in all themes
                --   Normal = { bg = "#000000" },
                -- }
                -- duskfox = { -- a table of overrides/changes to the duskfox theme
                --   Normal = { bg = "#000000" },
                -- },
        },


        -- Set dashboard header
        header = {
                " █████  ███████ ████████ ██████   ██████",
                "██   ██ ██         ██    ██   ██ ██    ██",
                "███████ ███████    ██    ██████  ██    ██",
                "██   ██      ██    ██    ██   ██ ██    ██",
                "██   ██ ███████    ██    ██   ██  ██████",
                " ",
                "    ███    ██ ██    ██ ██ ███    ███",
                "    ████   ██ ██    ██ ██ ████  ████",
                "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
                "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
                "    ██   ████   ████   ██ ██      ██",
        },

        -- Default theme configuration
        default_theme = {
                -- Modify the color palette for the default theme
                colors = {
                        fg = "#abb2bf",
                        bg = "#1e222a",
                },
                highlights = function(hl) -- or a function that returns a new table of colors to set
                        local C = require "default_theme.colors"

                        hl.Normal = { fg = C.fg, bg = C.bg }

                        -- New approach instead of diagnostic_style
                        hl.DiagnosticError.italic = true
                        hl.DiagnosticHint.italic = true
                        hl.DiagnosticInfo.italic = true
                        hl.DiagnosticWarn.italic = true

                        return hl
                end,
                -- enable or disable highlighting for extra plugins
                plugins = {
                        aerial = true,
                        beacon = false,
                        bufferline = true,
                        cmp = true,
                        dashboard = true,
                        highlighturl = true,
                        hop = false,
                        indent_blankline = true,
                        lightspeed = false,
                        ["neo-tree"] = true,
                        notify = true,
                        ["nvim-tree"] = false,
                        ["nvim-web-devicons"] = true,
                        rainbow = true,
                        symbols_outline = false,
                        telescope = true,
                        treesitter = true,
                        vimwiki = false,
                        ["which-key"] = true,
                },
        },

        -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
        diagnostics = {
                virtual_text = true,
                underline = true,
        },

        -- Extend LSP configuration
        -- lsp = {
        --         -- easily add or disable built in mappings added during LSP attaching
        --         mappings = {
        --                 n = {
        --                         -- ["<leader>lf"] = false -- disable formatting keymap
        --                 },
        --         },
        --         -- add to the global LSP on_attach function
        --         -- on_attach = function(client, bufnr)
        --         -- end,
        --
        --         -- override the mason server-registration function
        --         -- server_registration = function(server, opts)
        --         --   require("lspconfig")[server].setup(opts)
        --         -- end,
        --
        --         -- Add overrides for LSP server settings, the keys are the name of the server
        --         ["server-settings"] = {
        --                 -- example for addings schemas to yamlls
        --                 -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
        --                 --   settings = {
        --                 --     yaml = {
        --                 --       schemas = {
        --                 --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
        --                 --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
        --                 --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
        --                 --       },
        --                 --     },
        --                 --   },
        --                 -- },
        --         },
        -- },
        --



        -- Modify which-key registration (Use this with mappings table in the above.)

        -- This function is run last and is a good place to configuring
        -- augroups/autocommands and custom filetypes also this just pure lua so
        -- anything that doesn't fit in the normal config locations above can go here
        polish = function()
                -- Set up custom filetypes
                -- vim.filetype.add {
                --   extension = {
                --     foo = "fooscript",
                --   },
                --   filename = {
                --     ["Foofile"] = "fooscript",
                --   },
                --   pattern = {
                --     ["~/%.config/foo/.*"] = "fooscript",
                --   },
                -- }
        end,
}

return config
