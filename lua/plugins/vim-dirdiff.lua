-- Diff for directories.
return {
  "will133/vim-dirdiff",
  cmd = "DirDiff",
  lazy = true,
  config = function()
    vim.g.DirDiffExcludes = ".git,out,dist,.next"
  end,
}
