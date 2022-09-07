library(ggplot2) 
library(terra)
library(rgdal) #don't need I think?
library(rayshader)
#library(magick)
#library(rgl)
#library(viridis)

#set the working directory that contains the files
setwd("/Users/Anthony/OneDrive - UW/University of Washington/Data and Modeling/")
#setwd("/Users/ajs0428/OneDrive - UW/University of Washington/Data and Modeling/") #Windows

#I have my digital elevation model of hogsback here as output.tif in a 
    #subfolder called Hogsback within another folder called Side
hogs <- rast("Side/Hogsback/output.tif")
plot(hogs) #plotting for fun

# This part is tricky because the rayshader package doesn't like NA values
#   So the DEM or thing you model must take up the entire area without NAs 
hogs_mat <- raster_to_matrix(hogs) # convert to matrix

# This is taken from the rayshader website and I would need to go back to know each thing
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

# Once it loads use this to take a picture 
render_snapshot()