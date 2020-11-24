library(ggplot2)
library(png)
library(grid)
library(hexSticker)

## lighter bg, small sticker name
col_text <- "#22313f" # Ebony Clay
col_text <- "#2c3e50" # Madison
col_bg <- "#19b5fe" # Deep Sky Blue
col_bg <- "#6bb9f0" # Malibu
img <- readPNG("./drawings/BiocChallenges-drawing.png")
img <- rasterGrob(img, width = 1, x = 0.5, y = 0.5,
                  interpolate = TRUE)
gg <- ggplot() +
    annotation_custom(img) +
    theme_void()
stckr <- sticker(gg,
                 package = NA,
                 p_size = 7.3,
                 s_x = 1,
                 s_y = 0.82,
                 s_width = 1.73,
                 s_height = 1.73,
                 h_fill = col_bg,
                 h_color = col_text,
                 p_family = "Aller_Lt",
                 spotlight = FALSE,
                 l_x = 1.025, p_color = col_bg,
                 url = NA,
                 u_color = col_bg
                 )
stckr <- stckr +
    geom_url(url = "BiocChallenges", x = 0.95, y = 1.88,
             family = "Aller", size = 3.5, color = col_text, angle = 330) +
    geom_url(url = "www.bioconductor.org", size = 1.8, color = col_text,
             x = 0.27, y = 0.5, angle = 330)
save_sticker("BiocChallenges.png", stckr, dpi = 300)
