# Dotnet Go-To

A simple version of "Go To Defintion" for C#. This is a temporary fix for "textDocument/definition" for when the class has source-generated dependencies (like Godot).

# Usage

```require('dotnet-goto').lsp_request_definition()```

This will jump to the definition of object.
