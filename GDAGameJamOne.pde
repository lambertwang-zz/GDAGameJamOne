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


void setup(){
    size(1280, 720);
    noStroke();
    smooth();
    rectMode(CORNERS);

    frameRate(60);

    textFont(loadFont("Fixed_12.vlw"));


    world = new World();

    mercury = new Player(new PVector(width/2, height/2));

    new GTriple(new PVector(800, 300));
    new GTriple(new PVector(800, 400));

    new GStandardAmmo(new PVector(800, 500));
    new GAccelAmmo(new PVector(800, 600));

    new GMachineGun(new PVector(400, 300));
    new GRailGun(new PVector(400, 400));
    new GMachineGun(new PVector(400, 500));
    new GRailGun(new PVector(400, 600));
}

void draw(){
    world.draw();
    fill(0);
    text("Dir: "+mercury.dir, 100, 100);
    text("FPS: "+frameRate, 100, 140);

    stroke(0);
    strokeWeight(1);
    line(width/2, 0, width/2, height);
        line(0, height/2, width, height/2);
    noStroke();


}








