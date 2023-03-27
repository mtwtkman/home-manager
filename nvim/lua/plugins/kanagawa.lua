require("kanagawa").setup({
  overrides = function(colors)
    return {
      Visual = {
        bg = colors.palette.boatYellow1,
      },
      NavbuddyFile = { link = "@text.uri" },
      NavbuddyModule = { link = "@namespace" },
      NavbuddyNamespace = { link = "@namespace" },
      NavbuddyPackage = { link = "@namespace" },
      NavbuddyClass = { link = "@type" },
      NavbuddyMethod = { link = "@method" },
      NavbuddyProperty = { link = "@method" },
      NavbuddyField = { link = "@field" },
      NavbuddyConstructor = { link = "@constructor" },
      NavbuddyEnum = { link = "@type" },
      NavbuddyInterface = { link = "@type" },
      NavbuddyFunction = { link = "@function" },
      NavbuddyVariable = { link = "@constant" },
      NavbuddyConstant = { link = "@constant" },
      NavbuddyString = { link = "@string" },
      NavbuddyNumber = { link = "@number" },
      NavbuddyBoolean = { link = "@boolean" },
      NavbuddyArray = { link = "@constant" },
      NavbuddyObject = { link = "@type" },
      NavbuddyKey = { link = "@type" },
      NavbuddyNull = { link = "@type" },
      NavbuddyEnumMember = { link = "@field" },
      NavbuddyStruct = { link = "@type" },
      NavbuddyEvent = { link = "@operator" },
      NavbuddyOperator = { link = "@operator" },
      NavbuddyTypeParameter = { link = "@parameter" },
    }
  end,
  colors = {
    theme = {
      all = {
        ui = {
          bg_gutter = "none",
        },
      },
    },
  },
})
