return {
  s({
    trig = "pic",
    name = "picture",
    dscr = "The <picture> HTML element contains zero or more <source> elements and one <img> element to offer alternative versions of an image for different display/device scenarios."
  },{
      t({"<figure>","\t<picture>"}),
      t({"","\t\t"}),
      t("<img src="),
      i(1),
      t(" alt="),
      i(2),
      t(" loading=\"lazy\""),
      t({">",""}),
      t({"\t</picture>","</figure>"}),
      i(0,""),
    }),


  s({
    trig = "tab1",
    name = "table",
    dscr = "The <table> HTML element represents tabular data that is, information presented in a two-dimensional table comprised of rows and columns of cells containing data. Inside <thead> using <th>"
  },{
      t({"<table>","\t<thead>"}),
      i(1),
      t({"",""}),
      t({"\t</thead>",""}),

      t({"",""}),
      t("\t<tbody>"),

      i(2),
      t({"",""}),
      t({"\t</tbody>",""}),

      t({"",""}),
      t("\t<tfoot>"),

      i(3),
      t({"",""}),
      t({"\t</tfoot>"}),
      t({"",""}),

      t("</table>"),
      i(0)
    }),


  s({
    trig = "tab",
    name = "table",
    dscr = "The <table> HTML element represents tabular data that is, information presented in a two-dimensional table comprised of rows and columns of cells containing data. Inside <thead> using <th>"
  },{
      t({"<table>","\t<thead>"}),
      i(1),
      t({"",""}),
      t({"\t</thead>",""}),

      t({"",""}),
      t("\t<tbody>"),

      i(2),
      t({"",""}),
      t({"\t</tbody>",""}),

      t("</table>"),
      i(0)
    })
}
