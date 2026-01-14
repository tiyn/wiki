# LTeX

[LTeX](https://valentjn.github.io/ltex/index.html) is an offline grammar checking tool that can use
the Language Server Protocol - short LSP.
It is supports various [Markup languages](/wiki/markup_language.md) like
[LaTeX](/wiki/markup_language.md#latex) and Markdown.

## Setup

LTeX can be installed on various editors and officially supports VS Code, Vim and Neovim.
For Neovim the completion tool `coc` is recommended, but Neovims own lspconfig can be used aswell.

## Usage

This section addresses the usage of LTeX.

### Switching Languages Inside a File

The language is normally static for all file types.
It can however be changed using magic comments as explained in
[the official documentation](https://valentjn.github.io/ltex/advanced-usage.html].

### Switching Languages in Markdown

At the start of a file the following lines - called YAML front matter - can be used to change the
language for the whole file.
In the following it is changed to german (`de-DE`) but this can be changed.

```md
---
lang: de-DE
---
```

The following magic comment can be used to change the language from the place of the comment
onwards.

```md
<!-- LTeX: language=de-DE -->
```

### Switching Languages in LaTeX

The following magic comment can be used to change the language from the place of the comment
onwards.

```tex
% LTeX: language=de-DE
```

However this can be difficult when only using a few words.
Another easy and generally recommended way to change the language inside
[LaTeX](/wiki/markup_language.md#latex) documents is using the babel package.
In the following examples `<language>` is the language indicator that babel uses (for example
`english`, `american`, `ngerman`).

At the start of the document the language can be changed for the rest of the file using the
following command.

```tex
\usepackage[<language>]{babel}
```

Additionally the following command can be used to change the language from that place onwards.

```tex
\selectlanguage{<language>}
```

Using the following command the language can be changed just for the text that is subsituted for
`<text>`.

```
\foreignlanguage{<language>}{<text>}
```

Finally an otherlanguage environment can be used to achieve the same as shown in the following
example.

```tex
\begin{otherlanguage}{<language>}<text>\end{otherlanguage}
```
