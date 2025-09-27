{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib) optionalString elem;
  inherit (config.plugins)
    blink-copilot
    blink-cmp-dictionary
    blink-emoji
    blink-cmp-spell
    blink-ripgrep
    blink-cmp-git
    ;
  inherit (pkgs.vimPlugins) blink-nerdfont-nvim blink-cmp-npm-nvim blink-cmp-conventional-commits;
  optstr = optionalString;
in
#lua
''
  function(ctx)
    -- Base sources that are always available
    local base_sources = { 'buffer', 'lsp', 'path', 'snippets' }

    -- Build common sources list dynamically based on enabled plugins
    local common_sources = vim.deepcopy(base_sources)

    -- Add optional sources based on plugin availability
    ${optstr blink-copilot.enable "table.insert(common_sources, 'copilot')"}
    ${optstr blink-cmp-dictionary.enable "table.insert(common_sources, 'dictionary')"}
    ${optstr blink-emoji.enable "table.insert(common_sources, 'emoji')"}
    ${optstr (elem blink-nerdfont-nvim config.extraPlugins) # lua
      ''table.insert(common_sources, 'nerdfont')''
    }
    ${optstr blink-cmp-spell.enable "table.insert(common_sources, 'spell')"}
    ${optstr blink-ripgrep.enable "table.insert(common_sources, 'ripgrep')"}
    ${optstr (elem blink-cmp-npm-nvim config.extraPlugins) # lua
      ''
        if vim.fn.expand('%:t') == 'package.json'
            then table.insert(common_sources, 'npm')
        end
      ''
    }
    local success, node = pcall(vim.treesitter.get_node)
        if success and node and vim.tbl_contains({ 'comment', 'line_comment', 'block_comment' }, node:type()) then
      return { 'buffer', 'spell', 'dictionary' }
    elseif vim.bo.filetype == 'gitcommit' then
      local git_sources = { 'buffer', 'spell', 'dictionary' }
      ${optstr blink-cmp-git.enable "table.insert(git_sources, 'git')"}
      ${optstr (elem blink-cmp-conventional-commits config.extraPlugins) "table.insert(git_sources, 'conventional_commits')"}
      return git_sources
    else
      return common_sources
    end
  end
''
