### from https://www.pipinghotdata.com/posts/2020-09-22-exporting-editable-ggplot-graphics-to-powerpoint-with-officer-and-purrr/

### ggplot to pptx
library(tidyverse)
library(officer)
library(rvg)

# function to export plot to pptx
ggplot_to_pptx <- function(plot, path, left = 0.5, top = 1, width = 9, height = 4.95){
  
  # create dml
  create_dml <- function(plot){
    rvg::dml(ggobj = plot)
  }
  plot_dml <- create_dml(plot)
  
  # if file does not yet exist, create new pptx
  if (!file.exists(path)) {
    out <- officer::read_pptx()
  }
  # if file exist, append slides to exisiting file
  else {
    out <- officer::read_pptx(path)
  }
  
  out %>% 
    officer::add_slide() %>% 
    officer::ph_with(plot_dml, location = officer::ph_location(
      width = width, height = height, left = left, top = top)) %>% 
    base::print(target = path)
}

### you need to input the name of the plot and the path where you want to save.
### example: ggplot_to_pptx(myplot, path = "~/Desktop/myplot.pptx")
