# Neodarcula   

A discrete color theme based on Intellij's default dark theme, with support for transparency, window dimming, LSP, treesitter, telescope and other plugins like [flash.nvim](https://github.com/folke/flash.nvim) and [eyeliner.nvim](https://github.com/jinh0/eyeliner.nvim).

## Examples

- [Jai](#jai)
- [Go](#go)
- [Java](#java)
- [C++](#c++)
- [Rust](#rust)
- [Odin](#odin)
- [Zig](#zig)
- [C3](#c3)

### Jai
<img src="https://github.com/user-attachments/assets/041ad0b3-3ea1-4713-a2e4-31b09bdc9cec" alt="Jai Image" width="600"/>

### Go
<img src="https://github.com/user-attachments/assets/31714e1e-1b62-4307-8a92-5d0ce9a3bd29" alt="Golang Image" width="600"/>

### Java
<img src="https://github.com/user-attachments/assets/823dcd32-7011-4cb6-ab6d-13a5d4b9e36e" alt="Java Image" width="600"/>

### C++
<img src="https://github.com/user-attachments/assets/fe2230ea-3159-4fed-a9fb-74b624ce6c6a" alt="C++ Image" width="600"/>

### Rust
<img src="https://github.com/user-attachments/assets/d31380e5-8666-45d1-9ee1-6082d21fe815" alt="Rust Image" width="600"/>
    
### Odin
<img src="https://github.com/user-attachments/assets/59eccef5-39aa-425c-b6ce-5237d9f8647e" alt="Odin Image" width="600"/>

### Zig
<img src="https://github.com/user-attachments/assets/4f391f9f-5356-4571-be6c-d5dc052eeae2" alt="Zig Image" width="600"/>

### C3 (tree-sitter only, no LSP)
<img src="https://github.com/user-attachments/assets/c715473e-6ef5-4303-b80c-bd46fd4e0086" alt="C3 Image" width="600"/>

---

## 📦 Installation

### neovim >= 0.12
```
vim.pack.add({
	{ src = "https://github.com/pmouraguedes/neodarcula.nvim" },
})

require("neodarcula").setup({
	transparent = false,
	dim = true,
})
vim.cmd([[colorscheme neodarcula]])
```

### lazy.nvim
```
    {
        "pmouraguedes/neodarcula.nvim",
        lazy = false,
        priority = 1000,
    },
```

### Complete LazyVim example

```
return {
    {
        "pmouraguedes/neodarcula.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true, -- Enable transparent background
            dim = true,         -- Dim inactive windows with a black background
        },
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "neodarcula",
        },
    },
}
```
## Configuration

Default Options

```
{
    -- removes the background color, making it transparent.
    transparent = false,
    -- sets the background of inactive windows to black
    dim = false,            
}
```

## Requirements
This color scheme uses LSP Semantic tokens and Treesitter information, so it works better when these are enabled.        

## Alternatives
- [xiantang/darcula-dark.nvim](https://github.com/xiantang/darcula-dark.nvim)
- [doums/darcula](https://github.com/doums/darcula)
