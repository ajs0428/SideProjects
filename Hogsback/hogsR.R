library(ggplot2)
library(terra)
library(rgdal)
library(rayshader)
#library(magick)
#library(rgl)
#library(viridis)

setwd("/Users/Anthony/OneDrive - UW/University of Washington/Data and Modeling/")
#setwd("/Users/ajs0428/OneDrive - UW/University of Washington/Data and Modeling/") #Windows

hogs <- rast("Side/Hogsback/output.tif")
plot(hogs)
hogs_mat <- raster_to_matrix(hogs)

hogs_mat %>%
    sphere_shade(texture = 'bw', colorintensity = 3) %>%
    add_shadow(ray_shade(hogs_mat, zscale = 5), 0.5) %>%
    add_shadow(ambient_shade(hogs_mat), 0) %>%
    plot_3d(hogs_mat, zscale = 0.75, fov = 0, theta = 135, zoom = 0.75, phi = 45, windowsize = c(1000, 800))
    #add_water(detect_water(elmat), color = "desert") %>%
    # add_shadow(ray_shade(carbon_mat, zscale = 3), 0.5) %>%
    #add_shadow(ambient_shade(elmat), 0) %>%
    #plot_3d(hogs_mat, zscale = 50) #%>%
#add_shadow(ray_shade(carbon_mat, zscale = 3), 0.5) %>%
#add_shadow(ambient_shade(carbon_mat), 0) %>%

render_snapshot()