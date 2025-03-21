## [My personal website](https://vijayramesh.com/)

In this README, I will outline the steps that I have taken to build and deploy my personal website. All the materials that are presented here have been adapted from existing git repositories & examples created. A few noteworthy examples include [Dr. Allison Horst's distill template](https://github.com/allisonhorst/meds-distill-template), [Dr. Silvia Canelon's webpage](https://silviacanelon.com/) and [Dr. Alison Hill's webpage and code](https://www.apreshill.com/about/).   

Please feel free to borrow/fork my git repository if you would like to reproduce the content generated here.

Alright...let's get started!

### Step-by-step instructions for building your own website

I have spent the last few years trying to build my own website. My journey began when I started experimenting & learning RMarkdown. Soon, I came across bookdown & then...you guessed it...blogdown. Blogdown is awesome, but the thing is, I am not a web developer & I found it fairly intricate/hard to deploy my own website as I had to mess around with a number of different aspects, including .toml, .css, .html and the like.

Enter [distill](https://rstudio.github.io/distill/)! - I realized that the R package & existing frameworks that use *distill* are straightforward, requires limited troubleshooting & has the capacity to deploy interactive/advanced visualizations by simply using .Rmd documents. Learn more about using *distill* & [making your own website here](https://rstudio.github.io/distill/website.html)

Now...let me now walk you through what I did.

***Note: the following steps assume the knowledge of R/Rstudio, RMarkdown & knitr***

-   The first thing you will want to do is take a piece of paper & think about/visualize what you want your website to look like. For me, it was really important that I think about my home page, the images, the different tabs on top & the text.

-   Once I thought of the above, I then created a new repository on GitHub or you could fork this one and simply modify/make changes in the contents of different pages prior to publishing (which I will come to later/[you can visit this link](https://rstudio.github.io/distill/publish_website.html#github-pages)).

-   Let's assume you created your own repository on GitHub. You will now - using version control - add a new project using RStudio. That will essentially open up a folder with a README.md, .Rproj, LICENSE & a .gitignore file.

-   Install the R package `distill` & run the `create_website()` function. This will ask you for a new directory name & the title of your website and it will result in three main files: about.Rmd, index.Rmd & \_site.yml

-   *Extra step here due to the way I initiated this: the above function creates a new directory within my existing GitHub repository. I ended up moving those files to the main/root directory where my README.md file is housed.*

-    At this point, I would encourage familiarizing yourself briefly with YAML - which is basically a language written for configuration files. The best way to think about this language is key:value pairs & that YAML works a bit like a map. Note, YAML is picky about indentations. For more details, I would suggest visiting some of these links:  
[What is YAML?](https://www.redhat.com/en/topics/automation/what-is-yaml)\
[An introduction to the R package - ymlthis](https://ymlthis.r-lib.org/articles/introduction-to-ymlthis.html)\
[YAML options for bookdown](https://bookdown.org/yihui/bookdown/yaml-options.html)\
[Crash Course in RMarkdown by Zachary Smith](https://zsmith27.github.io/rmarkdown_crash-course/lesson-4-yaml-headers.html)

Before we move further, it is important to understand a little bit about key .Rmd files & associated folders.

#### \_site.yml

This .yaml/.yml file essentially governs a few key aspects of your website/webpage. These include the contents of your header/navigation bar (including the text, number of tabs, whether you want this to be present across all webpages & theme).

#### index.Rmd

Think of this .Rmd file as your home page. What would you like visitors to see when they first open your personal website? At this point, I sketched out a rough outline on a piece of paper & started coding in RMarkdown, once I had an idea of what I wanted my homepage to look like.

Now that you have an idea of what your homepage should look like, start creating other .Rmd files that represent your different tabs of your website & fill them up accordingly.  

#### \_footer.html

While the contents of the header/navigation bar can be set within the \_site.yml file, we need to create a separate .html file to add content for the footer.

#### \_.nojekyll

At this stage, before you move on to populating your webpages, you should create a file named .nojekyll in your repository (this is required to disable some processing of HTML files that GitHub does by default). You can do this with the following code: `file.create (".nojekyll")`.

#### images folder

At this stage, you can create a folder where images for the different pages of your website can be stored. I created an empty folder titled `figs` at this point.

#### theme.css

A key feature of your website is not only content, but structuring how this content will appear. This can include fonts, font sizes, colors etc. Now create a default theme file, which we will modify in a bit, using the function `create_theme(name = "theme")`.

### Adding content  

-   Let's start populating content for your website now! while populating content, I found a few resources online that helped me add content seamlessly. Here's a link to a [knitr reference card](https://cran.r-project.org/web/packages/knitr/vignettes/knitr-refcard.pdf) that was super useful for me.   

-   Let's assume that you have now added content and you want to see what that looks like online. To do this, we must carry out two key steps - render the pages (so that .Rmd files are converted to .html) and deploy/publish them.  

### Rendering, deployment and publishing webpages  

-   Before we render & deploy our website online, we need to first rename the `_site` folder to `docs` - the reason we do this is because `docs` is usually the default location/folder that git searches for .html files. Ensure that your .yaml output parameter in your `_site.yml` file is also changed to `docs`.

-   To render the pages, we simply type in our console `rmarkdown::render_site()`. This function will render all the .Rmd files in this project/repository. If you wish to render an article at a time, which is suggested to prevent other pages from breaking/erroneous deployment, you could run `render_site("index.Rmd")` for example.  

-   Coming to deployment/publishing you website, there are a couple of ways in which you could do this. I am using Git Pages to deploy the same. To learn more about publishing your website, please [visit this link](https://rstudio.github.io/distill/publish_website.html#github-pages).  

-   To ensure your webpages are deployed from the right location, go to your github repository-\>Settings-\>Pages and choose the branch from your site will be deployed. Here, you will choose `main` --\> `docs`.

-   Push the commits/changes online to GitHub, since the .html files have been rendered and vola, you will now see your website deployed at the `github.io` link!  

-   If you have a custom domain, do type in the name of your custom domain in the tab in Settings-\>Pages in your github repository. Many users purchase a domain and transfer their git pages to that domain. Personally, I bought a GoDaddy domain service and hosted it from Git Pages, by following instructions provided [here](https://carlosroso.com/gh-pages-with-godaddy-domain/).   

-   If you are looking for a free resources, I recommend the use of an `rbind/io` subdomain, thanks to the `rbind` community, which offers a free subdomain to R users. Please see this [link for more instructions](https://support.rbind.io/about/). Essentially, you need to raise an issue on their git repository requesting an `rbind.io` subdomain. For example, the request I made is [here](https://github.com/rbind/support/issues/950). I essentially wanted a website that has my full name, followed by the `rbind.io` subdomain.        
### What about blog posts??  

-  Now, how do we include a `blog` page in your website. One of the cool things about using `distill` is that by simply using a function called `create_post`, we can essentially add blog posts. What this function does is create a directory called `_posts`, where each of your blog posts are included. These posts can be then be linked to any .Rmd file that are part of your main tabs (whether it's your blogpage or Research page or People page etc.). I find it useful because I can keep certain pages as overview pages and let the viewer/visitor explore in detail if they wish to. For example, I basically made my Research page an overview page and added blog posts for each of my research themes.   

-  There are two things to remember here: what the `create_post` does is make a new .Rmd file within the `posts` folder, which can be edited to ensure that the output is a `distill_article`. The second thing to keep in mind is that you need to link this post to your main blogpage or whatever other page you want to link it to. To do this, we need to add a YAML option called `listing: posts` in the YAML headers for your blogpage/other page you want to link to. Such a header links all posts to the corresponding page you want it to (Note: you can choose specific posts to be linked, if you don't want all posts).  

-  the `preview` YAML header in your .Rmd file associated with the blog post can be used to essentially create a tiny thumbnail for your listings page. This thumbnail can be seen side-by-side to the overview of your blogpost. However, please note that you need to copy/add the figures that you want as a preview in the`_posts/` folder where the blogpost is located (since it is rendered from there).    

Congratulations! If you made it this far, you have probably created a fancy looking webpage :)

