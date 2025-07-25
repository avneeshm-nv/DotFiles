# VSCode Settings

[VSCode](https://code.visualstudio.com/) is an amazing code editor. Highly extensible and versatile.

## Table of contents

- [VSCode Settings](#vscode-settings)
    - [Table of contents](#table-of-contents)
    - [Contents](#contents)
    - [Extensions](#extensions)
    - [References](#references)

## Contents

The contents of this folder, described in the table below

| Item Name | Description |
| :---- | :----- |
| [settings](./settings/README.md) folder | A common list of settings that can be used for VSCode. There are `*-settings.json` files for extensions. There's also [config.vscode](./settings/config.vscode) for remote SSH configurations. |
| [keybindings.json](./keybindings.json) | Custom keyboard shortcuts that can be used with VSCode. |
| [snippets](./snippets/) | [User defined snippets](https://code.visualstudio.com/docs/editor/userdefinedsnippets) for VSCode |
| [debug-tasks](./debug-tasks/) | Files for debugger and task creation in VSCode |

## Extensions

VSCode is amazingly extensible. Check out the [marketplace](https://marketplace.visualstudio.com/) for extensions.

A list of my commonly used extensions

| Extension | Description |
| :---- | :----- |
| [vscodevim.vim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim) | Vim like editing keymaps. Super-useful for editing and navigating files |
| [ms-python.python](https://marketplace.visualstudio.com/items?itemName=ms-python.python) | One stop solution to all Python related stuff. Installs Pylance and [Jupyter](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter). |
| [ms-iot.vscode-ros](https://marketplace.visualstudio.com/items?itemName=ms-iot.vscode-ros) | ROS work |
| [ms-toolsai.jupyter](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter) | Jupyter notebook in interactive python scripts (with markdown support for docs) |
| [ms-vscode.cpptools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools) | All common C++ development tools, you may want to check the [extension pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools-extension-pack) |
| [formulahendry.code-runner](https://marketplace.visualstudio.com/items?itemName=formulahendry.code-runner) | Run all types of code files (useful for debugging) |
| [yzhang.markdown-all-in-one](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one) | All things related to markdown content |
| [James-Yu.latex-workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) | Everything LaTeX related through VSCode (more granular control than [overleaf](https://www.overleaf.com/)). Requires TeX or MikTex setup along with some pearl libraries for backend |
| [lextudio.restructuredtext](https://marketplace.visualstudio.com/items?itemName=lextudio.restructuredtext) | Extension for reStructuredText (rst) |
| [trond-snekvik.simple-rst](https://marketplace.visualstudio.com/items?itemName=trond-snekvik.simple-rst) | Syntax highlighting for rST files |
| [DavidAnson.vscode-markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint) | Markdown linting |
| [donjayamanne.githistory](https://marketplace.visualstudio.com/items?itemName=donjayamanne.githistory) | View `git` history, commits, graphs, etc. |
| [eamodio.gitlens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens) | GitLens - Git supercharged. Excellent git features (line blame, file history, etc.) |
| [NVIDIA.nsight-vscode-edition](https://marketplace.visualstudio.com/items?itemName=NVIDIA.nsight-vscode-edition) | For CUDA development. |
| [mads-hartmann.bash-ide-vscode](https://marketplace.visualstudio.com/items?itemName=mads-hartmann.bash-ide-vscode) | Bash IDE support (variables, outline, etc.). Excellent for shell scripting. |
| [streetsidesoftware.code-spell-checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker) | Software to check spellings |
| [oderwat.indent-rainbow](https://marketplace.visualstudio.com/items?itemName=oderwat.indent-rainbow) | For colored indentation guides |
| [CoenraadS.bracket-pair-colorizer-2](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer-2) | Shows beautiful brackets which are easier to read. Now, VSCode [natively has this](https://code.visualstudio.com/blogs/2021/09/29/bracket-pair-colorization) |
| [vscode-icons-team.vscode-icons](https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons) | Icons for folders and other entities |
| [Gruntfuggly.todo-tree](https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree) | List `TODO` or other tag items in a sidebar |
| [wayou.vscode-todo-highlight](https://marketplace.visualstudio.com/items?itemName=wayou.vscode-todo-highlight) | Highlight `TODO`, `FIXME`, and more. Use this or `Gruntfuggly.todo-tree` |
| [alefragnani.Bookmarks](https://marketplace.visualstudio.com/items?itemName=alefragnani.Bookmarks) | Useful for persistent line bookmarks |
| [stkb.rewrap](https://marketplace.visualstudio.com/items?itemName=stkb.rewrap) | Rewrap long comments into blocks of fixed width |
| [bierner.markdown-emoji](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-emoji) | Emojis in Markdown (works in preview, GitHub) |
| [DivyanshuAgrawal.competitive-programming-helper](https://marketplace.visualstudio.com/items?itemName=DivyanshuAgrawal.competitive-programming-helper) | To copy problem statements from a CP website into VSCode. Use with [competitive-companion](https://github.com/jmerle/competitive-companion) browser extension to import statements and work on them locally. |
| [amazonwebservices.aws-toolkit-vscode](https://marketplace.visualstudio.com/items?itemName=AmazonWebServices.aws-toolkit-vscode) | AWS tools |
| [znck.grammarly](https://marketplace.visualstudio.com/items?itemName=znck.grammarly) | Grammarly integration for proper writing |

## References

- Settings [variable reference](https://code.visualstudio.com/docs/editor/variables-reference)
- VSCode [theme colors](https://code.visualstudio.com/api/references/theme-color) and [themes](https://code.visualstudio.com/docs/configure/themes)
- [Debugging](https://code.visualstudio.com/docs/editor/debugging)
- [Terminal basics](https://code.visualstudio.com/docs/terminal/basics)
    - [Clear terminal keybinding](https://code.visualstudio.com/docs/terminal/basics#_why-is-cmdkctrlk-not-clearing-the-terminal)
