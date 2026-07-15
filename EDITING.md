# How to edit the ISBA Biopharm website (Quarto)

The site is authored in **`index.qmd`** and rendered with [Quarto](https://quarto.org).
The deployed HTML is generated — **never edit `index.html` directly.**

## One-time setup

1. Install Quarto: https://quarto.org/docs/get-started/ (or use RStudio, which bundles it).
2. Clone the repo: `git clone https://github.com/isba-biostatspharma/isba-biostatspharma.github.io.git`

## Everyday edits (events, news, F.A.Q.)

Each entry is a markdown block in `index.qmd` that looks like this:

```markdown
::: {.collapse-item #a-unique-id title="MM/DD/YYYY -- Some title" parent="#events-list"}
Regular markdown. Blank lines separate paragraphs.
Links: [text](https://example.com). Bold: **text**. Strikethrough: ~~text~~.
:::
```

To add an entry:

1. Copy an existing block and paste it at the **top** of the right list
   (events, news, or faq — the `parent` attribute tells you which).
2. Give it a **new unique `#id`** (e.g. `#events-mar2027`). Duplicate ids break
   the expand/collapse behavior.
3. Edit the `title` and the markdown body.
4. Preview with `quarto preview`, then render, commit, and push (see below).

When an event has passed, move its block from the upcoming list to the top of
the Past Events list and adjust the wording to past tense.

Supporting PDFs (webinar flyers, award calls) go in `docs/` and are linked with
full GitHub URLs, e.g.
`https://github.com/isba-biostatspharma/isba-biostatspharma.github.io/blob/master/docs/My%20Flyer.pdf`.

## Other sections (officers, awards, bylaws, about)

These live in `index.qmd` too, as raw HTML inside ```` ```{=html} ```` blocks
(they preserve the site's exact look). Officer/award updates are simple `<li>`
line edits — follow the existing pattern. The header/nav and footer live in
`partials/`.

## Preview and publish

```bash
quarto preview      # live preview in your browser while editing
quarto render       # writes the site to _site/
```

Publishing: see the repository README for the current deployment setup.
