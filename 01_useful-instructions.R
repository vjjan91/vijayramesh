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
