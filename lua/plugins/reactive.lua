return {
  'rasulomaroff/reactive.nvim',
  config = function()
    require('reactive').add_preset {
      name = 'test',
      init = function()
        -- making our cursor to use `MyCursor` highlight group
        -- vim.opt.guicursor:append('MyCursor')
      end,
      modes = {
        n = {
          winhl = {
            -- we use `winhl` because we want to highlight CursorLine only in a current window, not in all of them
            -- if you want to change global highlights, use the `hl` field instead.
            CursorLine = { bg = '#21202e' }
          },
          hl = {
            MyCursor = { bg = '#FFFFFF' }
          },
        },
        no = {
          -- You can also specify winhl and hl that will be applied with every operator
          winhl = {},
          hl = {},
          operators = {
            d = {
              winhl = {
                CursorLine = { bg = '#450a0a' }
              },
              hl = {
                MyCursor = { bg = '#fca5a5' }
              }
            },
            y = {
              winhl = {
                CursorLine = { bg = '#422006' },
              },
              hl = {
                MyCursor = { bg = '#fdba74' }
              }
            }
          },
        },
        i = {
          winhl = {
            CursorLine = { bg = '#042f2e' }
          },
          hl = {
            MyCursor = { bg = '#5eead4' }
          }
        }
      }
    }
    require('reactive').setup {
      builtin = {
        cursorline = true,
        cursor = true,
        modemsg = true
      }
    }
  end
}
