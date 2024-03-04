
# Springer Nature Quarto Format

## Creating a New Article

To create a new article using this format:

```bash
quarto use template christopherkenny/nature
```

This will create a new directory with an example document that uses this format.

## Using with an Existing Document

To add this format to an existing document:

```bash
quarto add christopherkenny/nature
```

Then, add the format to your document options:

```yaml
format:
  nature-pdf: default
```    

## Options

- `journal`: the Nature subjournal
  - `default`: Default
  - `sn-nature`: Style for submissions to Nature Portfolio journals
  - `sn-basic`: Basic Springer Nature Reference Style/Chemistry Reference Style
  - `sn-mathphys-ay`: Math and Physical Sciences Reference Style (author-year)
  - `sn-mathphys-num`: Math and Physical Sciences Reference Style (numbered)
  - `sn-aps`: American Physical Society (APS) Reference Style
  - `sn-vancouver`: Vancouver Reference Style
  - `sn-apa`: APA Reference Style 
  - `sn-chicago`: Chicago-based Humanities Reference Style
- `classoption`:
  - `iicol`: double column layout, usually used with `journal: default`
  - `Numbered`: Numbered reference style, usually used with `journal: sn-mathphys` or `journal: sn-vancouver`.
  - `referee`: double spaced for first submissions
  - `lineno`: print line numbers in the margin

Since `cite-method: citeproc` is the
[default](https://quarto.org/docs/authoring/footnotes-and-citations.html#sec-biblatex),
to respect the natbib reference styles, you may need to set `cite-method: natbib`,
such as:

```yaml
format:
  nature-pdf:
    journal: "sn-mathphys-num"
    cite-method: natbib
```

and restrict usage to [pandoc standard](https://pandoc.org/MANUAL.html#citation-syntax)
references: `[@key01; @key02]`.

## Example

Here is the source code for a minimal sample document: [template.qmd](template.qmd).

<!-- pdftools::pdf_convert('template.pdf',pages = 1) -->
![[template.qmd](template.qmd)](template_1.png)

## License

This modifies the Springer Nature journal article template package, available at <https://www.springernature.com/gp/authors/campaigns/latex-author-support/see-where-our-services-will-take-you/18782940>.
The original template is licensed under the [LaTeX Project Public License 1.3c](https://www.latex-project.org/lppl/lppl-1-3c/). The template within is derived from this and makes modifications to separate into the full document into Quarto "partials". All modifications can be seen in this repo. 
