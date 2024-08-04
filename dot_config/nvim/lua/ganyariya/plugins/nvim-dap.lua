return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
  },
  enabled = true,
  config = function()
    -- nvim で Debug Adapter Protocol 通信を行えるようにする(nvim-dap = client)
    local dap = require("dap")
    local dapui = require("dapui")
    --local dapVirtualText = require("nvim-dap-virtual-text")

    dapui.setup()
    --dapVirtualText.setup({})

    local keymap = vim.keymap
    keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
    keymap.set("n", "<Leader>dc", dap.continue, { desc = "Continue" })
    keymap.set("n", "<Leader>di", dap.step_into, { desc = "Step Into" })
    keymap.set("n", "<Leader>dO", dap.step_out, { desc = "Step Out" })
    keymap.set("n", "<Leader>do", dap.step_over, { desc = "Step Over" })
    keymap.set("n", "<Leader>dU", dapui.toggle, { desc = "DebugUI" })
  end,
}
