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

- `journal.cite-style`: the natbib style for the Nature subjournal
  - `default`: Default
  - `sn-nature`: Style for submissions to Nature Portfolio journals
  - `sn-basic`: Basic Springer Nature Reference Style/Chemistry Reference Style
  - `sn-mathphys`: Legacy Math and Physical Sciences Reference Style
  - `sn-mathphys-ay`: Math and Physical Sciences Reference Style (author-year)
  - `sn-mathphys-num`: Math and Physical Sciences Reference Style (numbered)
  - `sn-aps`: American Physical Society (APS) Reference Style
  - `sn-vancouver`: Vancouver Reference Style
  - `sn-apa`: APA Reference Style
  - `sn-chicago`: Chicago-based Humanities Reference Style
- `classoption`:
  - `iicol`: double-column layout
  - `Numbered`: numbered reference style
  - `referee`: double-spaced first submission
  - `lineno`: print line numbers in the margin
  - `equal-margins`: set equal margins on even and odd pages
Quarto defaults to `cite-method: citeproc`. To use the natbib reference styles included with this extension, set `cite-method: natbib`:

```yaml
format:
  nature-pdf:
    journal:
      cite-style: sn-mathphys-num
    cite-method: natbib
```

With natbib, use Pandoc's standard citation syntax such as `[@key01; @key02]`.

## Example

The source code for a minimal sample document is in [template.qmd](template.qmd).

<!-- pdftools::pdf_convert('template.pdf', pages = 1) -->
![[template.qmd](template.qmd)](template_1.png)

## License

This modifies the [Springer Nature journal article template package][springer-template].
The original template is licensed under the [LaTeX Project Public License 1.3c](https://www.latex-project.org/lppl/lppl-1-3c/).

[springer-template]: https://www.springernature.com/gp/authors/campaigns/latex-author-support/see-where-our-services-will-take-you/18782940
