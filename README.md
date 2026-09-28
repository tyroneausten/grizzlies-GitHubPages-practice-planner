# Grizzlies Practice Planner - GitHub Pages build

This version is a pure static site for GitHub Pages. It does not use Netlify, Netlify Functions, Node.js, npm, or a local build step.

## Publish with GitHub Pages

1. Create or open the GitHub repository you want to use.
2. Upload the **contents of this folder** to the repository root. `index.html` must be visible at the top level of the repository.
3. Commit the files to the `main` branch.
4. In GitHub, open **Settings > Pages**.
5. Under **Build and deployment**, choose **Deploy from a branch**.
6. Select branch **main** and folder **/(root)**, then click **Save**.
7. Wait for GitHub to show the site URL. It will normally be `https://YOUR-USERNAME.github.io/YOUR-REPOSITORY/`.
8. Open that URL and hard-refresh once (Ctrl+Shift+R on Windows).

## Supabase sign-in redirect

For magic-link sign-in to return to the GitHub Pages app, add the GitHub Pages URL to your Supabase project's allowed redirect URLs:

**Supabase Dashboard > Authentication > URL Configuration > Redirect URLs**

Add the exact Pages URL, including the trailing slash, for example:

`https://YOUR-USERNAME.github.io/grizzlies-practice-planner/`

The app continues to use Supabase directly for shared drills, practices, and drill-layout images. Replacement layouts use unique filenames so browsers do not keep showing an older cached image.

## Hockey Canada source PDFs

GitHub Pages cannot run the former Netlify PDF proxy. The app now attempts to load Hockey Canada's official PDF directly in the browser. If Hockey Canada's server blocks that browser request, use the drill's **Source** link to open the official PDF instead.
