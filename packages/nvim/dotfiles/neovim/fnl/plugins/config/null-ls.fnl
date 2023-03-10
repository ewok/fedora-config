(local {: map! : get_buf_ft} (require :lib))

(local fmt-white-list {:python true
                       :fennel true
                       :go true
                       :clojure true
                       :markdown true
                       :sql true
                       :yaml true
                       :sh true
                       :bash true
                       :zsh true})

(local hover-white-list {:markdown true})

(fn config []
  (let [null-ls (require :null-ls)]
    (null-ls.setup {:on_attach (fn [_ bufnr]
                                 (do
                                   (when (. fmt-white-list (get_buf_ft bufnr))
                                     (map! [:n] :<leader>cf
                                           #(vim.lsp.buf.format {:filter (fn [client]
                                                                           (= client.name
                                                                              :null-ls))
                                                                 : bufnr})
                                           {:buffer bufnr}
                                           "Format buffer[NULL-LS]"))
                                   (when (. hover-white-list (get_buf_ft bufnr))
                                     (map! [:n] :K #(vim.lsp.buf.hover)
                                           {:buffer bufnr}
                                           "Show help information[NULL-LS]")
                                     (map! [:n] :gh #(vim.lsp.buf.hover)
                                           {:buffer bufnr}
                                           "Show help information[NULL-LS]"))))
                    :sources [;; Text
                              null-ls.builtins.completion.spell
                              (null-ls.builtins.diagnostics.markdownlint.with {:extra_args [:--disable
                                                                                            :MD013
                                                                                            :MD024]})
                              (null-ls.builtins.formatting.cbfmt.with {:extra_args [:--config (vim.fn.expand "~/.config/cbfmt.toml")]})
                              (null-ls.builtins.formatting.prettier.with {:filetypes [:markdown
                                                                                      :markdown.mdx]})
                              null-ls.builtins.hover.dictionary
                              ;; Clojure
                              null-ls.builtins.diagnostics.clj_kondo
                              null-ls.builtins.formatting.joker
                              null-ls.builtins.formatting.fnlfmt
                              ;; Ansible
                              null-ls.builtins.diagnostics.ansiblelint
                              ;; Shell
                              null-ls.builtins.diagnostics.fish
                              null-ls.builtins.formatting.shfmt
                              ;; Docker
                              null-ls.builtins.diagnostics.hadolint
                              ;; Terraform
                              ; null-ls.builtins.formatting.terraform_fmt
                              null-ls.builtins.diagnostics.terraform_validate
                              ;; Python
                              null-ls.builtins.formatting.autopep8
                              null-ls.builtins.formatting.black
                              null-ls.builtins.diagnostics.mypy
                              ;; Go
                              null-ls.builtins.formatting.gofmt
                              ;; SQL
                              null-ls.builtins.formatting.sql_formatter
                              ;; YAML
                              null-ls.builtins.formatting.yamlfmt
                              null-ls.builtins.diagnostics.yamllint
                              ;; Lua
                              (null-ls.builtins.formatting.stylua.with {:extra_args [:--indent-type=Spaces
                                                                                     :--indent-width=4]})]})))

{: config}
