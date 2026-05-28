# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A personal GitHub Pages site for "Dong" (user site `3013216027.github.io`, served at https://3013216027.github.io). It is a single self-contained `index.html` — all CSS lives in one inline `<style>` block and all JavaScript in inline `<script>` blocks. There is no build step, no framework, no package manager, and no dependencies installed locally. The only external runtime resources are Google Fonts (Inter, JetBrains Mono) loaded via CDN.

The entire site is three files: `index.html`, `makefile`, `README.md`.

Page content is written primarily in Simplified Chinese (`lang="zh-CN"`).

## Commands

There is no build, lint, or test tooling.

- **Preview locally:** open `index.html` directly in a browser, or run `python3 -m http.server` from the repo root and visit the served page.
- **Deploy:** `make deploy` (the default target). This does more than push to GitHub — it `git add .`, commits with the message `update index`, `git pull --rebase`, `git push`, **and then `scp`s `index.html` to an external server** (`dong@104.223.111.171:/var/www/html`, port 29997). The site is therefore published both via GitHub Pages and mirrored to a personal server. Running `make deploy` has side effects beyond this repo and requires SSH access to that host — do not run it unless explicitly asked.

## Architecture of `index.html`

The page is built from stacked `<section>`s inside `.container`, in this order: nav → hero (`#about`) → skills → trending projects (`#trending`) → news (`#news`) → footer.

- **Theme system:** the whole visual design is driven by CSS custom properties defined in `:root` (dark GitHub-style palette — `--bg`, `--border`, `--blue`, `--purple`, `--green`, etc., plus `--radius` and `--shadow`). Change colors there, not at individual rules.
- **Two inline scripts**, each an IIFE at the bottom of `<body>`:
  1. A typewriter effect for the hero tagline. The rotating strings live in the `phrases` array — edit that array to change what cycles.
  2. An `IntersectionObserver` that fades in `.repo-card`, `.news-item`, and `.skill-card` elements as they scroll into view (staggered by index).

## Content conventions

- **Add a trending project:** duplicate a `.repo-card` `<a>` block in the `#trending` grid. Each card sets its top gradient bar via inline `style="--c1:...;--c2:..."` and a status pill via a tag class: `tag-hot`, `tag-new`, `tag-agent`, or `tag-tool`. The `.lang-dot` background hex encodes the project's language color.
- **Add a news entry:** duplicate a `.news-item` block in the `#news` list (date + title + body + a reused tag pill).
- **Add a skill:** duplicate a `.skill-card` in the skills grid (emoji icon + label).
- Keep everything in the single `index.html` — styles and scripts stay inline rather than split into separate files.
