/* 
 * GDAGamejamOne
 * Lambert Wang
 * I have no idea what I'm doing
 * 
 * I literally have no idea what I'm doing here.
 * 
 * Everyone else is using gamemaker and unity and stuff
 * I'm just sitting here with Processing and sublime (and vim)
 * 
 * Gun Physics
 * Crafting
 * 
 */

World world;

Player mercury;

final float scale = 1;
final float friction = 0.96;


void setup(){
    size(1280, 720);
    noStroke();
    smooth();

    frameRate(60);


    world = new World();

    mercury = new Player(new PVector(width/2, height/2));
}

void draw(){
    world.draw();

    text("Dir: "+mercury.dir, 200, 200);
    text("FPS: "+frameRate, 200, 240);

}








