int grid_factor = 13;
int width_height = grid_factor*(25);
int no_of_sprites = 1000;
color bg_color = color(random(0,100));

void setup() {
  size(196, 196);
  //size(width_height, width_height);

  surface.setVisible(false);


  
    
  for(int n = 1; n <= no_of_sprites;n++) {
    background(bg_color);
    makeSprite();
    String filename = String.format("sprite-#%d",n);
    save(String.format("%d by %d\\%s.jpg",grid_factor,grid_factor,filename));
  }
  
  

  println(String.format("Generated %d %d by %d sprites", no_of_sprites, grid_factor,grid_factor ));
  exit();
}
