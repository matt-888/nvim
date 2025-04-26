return {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = { "django-html", "htmldjango", "html", "css" },
  settings = {
  tailwindCSS = {
    classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
    includeLanguages = {
    },
    lint = {
      cssConflict = "warning",
      invalidApply = "error",
      invalidConfigPath = "error",
      invalidScreen = "error",
      invalidTailwindDirective = "error",
      invalidVariant = "error",
      recommendedVariantOrder = "warning"
    },
    validate = true
  }
}
}
