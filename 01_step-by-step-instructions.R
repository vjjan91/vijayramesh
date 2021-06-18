# Script to build website

# Note: I am following instructions written in this wonderful blog post by Alison Hill

library(blogdown)
new_site(theme = "wowchemy/starter-academic")

# Importantly, when you come back to your project, note that you can
# use blogdown::serve_site() or the “Serve Site” addin to preview it locally.

blogdown::new_post(title = "Hi Hugo", 
                   ext = '.Rmarkdown', 
                   subdir = "post")

blogdown::config_Rprofile()

file.edit(".gitignore")

blogdown::check_gitignore()

blogdown::check_content()

# Other issues encountered:
# https://community.rstudio.com/t/blogdown-unable-to-stage-and-commit/6621/4
# To commit all staged commits: git add -A

library(rstudioapi) # to easily navigate to files
rstudioapi::navigateToFile("config.yaml", line = 3)

# if exists, opens; if not, creates new
blogdown::config_netlify()
# check the file
blogdown::check_netlify()

# check hugo
blogdown::check_hugo()

# start customizing the website
rstudioapi::navigateToFile("config/_default/params.toml")
rstudioapi::navigateToFile("content/authors/admin/_index.md")
