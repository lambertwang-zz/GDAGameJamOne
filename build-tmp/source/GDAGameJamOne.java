import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class GDAGameJamOne extends PApplet {

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
final float friction = 0.96f;


public void setup(){
    size(1280, 720);
    noStroke();
    smooth();

    frameRate(60);


    world = new World();

    mercury = new Player(new PVector(width/2, height/2));
}

public void draw(){
    world.draw();

    text("Dir: "+mercury.dir, 200, 200);
    text("FPS: "+frameRate, 200, 240);

}









abstract class IGameObject{

    PVector pos, last;
    float dir = 0;

    


    public void tick(){}
    public void render(){}

    public void move(){

        PVector temp = new PVector(pos.x-last.x, pos.y-last.y);

        dir %= 2*PI;
        
        temp.mult(friction);
        last.set(pos);
        pos.add(temp);

        temp = new PVector(pos.x-last.x, pos.y-last.y);
        if(pos.x < 0){
            pos.x = 0;
            last.x = temp.x;
        } else if(pos.x > width) {
            pos.x = width;
            last.x = width+temp.x;
        }

        if(pos.y < 0){
            pos.y = 0;
            last.y = temp.y;
        } else if(pos.y > height){
            pos.y = height;
            last.y = height+temp.y;
        }

    }
}

class GunComponent extends IGameObject{
    GunComponent(){
        


    }

    public void render(){


    }

    public void tick(){

    }

}

abstract class GunComponentType{
    GunComponentType(){
        
    }

    public void render(){


    }

    public void tick(){

    }

}

abstract class AMain extends GunComponentType{
    AMain(){

    }
}

class EmptyGun extends AMain{
    EmptyGun(){}
};

class MachineGun extends AMain{
    MachineGun(){

    }

    public void render() {

        fill(32);
        beginShape();
            vertex(0, -3);
            vertex(0, 8);
            vertex(-8, 8);
            vertex(-8, -3);
        endShape();

        fill(0, 96, 0);
        beginShape();
            vertex(4, 6);
            vertex(4, -8);
            vertex(-4, -8);
            vertex(-4, 6);
        endShape();

        fill(64);
        beginShape();
            vertex(2, 6);
            vertex(2, 24);
            vertex(-2, 24);
            vertex(-2, 6);
        endShape();
    }
};

abstract class AAugment extends GunComponentType{
    AAugment(){

    }

}

abstract class ARail extends GunComponentType{
    ARail(){


    }

}

abstract class AAmmo extends GunComponentType{
    AAmmo(){


    }
}


float p_vel = 0.4f;
float p_turn = 0.08f;

class Player extends IGameObject{
    AMain p_lgun, p_rgun;

    float[] p;

    Player(PVector tpos) {
        pos = new PVector();
        pos.set(tpos);
        last = new PVector();
        last.set(tpos);

        p = new float[4];
        p[0] = scale*16;
        p[1] = scale*8;
        p[2] = scale*-8;
        p[3] = scale*-16;
        
        p_lgun = new EmptyGun();
        p_rgun = new MachineGun();
        world.addObject(this);
    }

    public void tick() {
        if(leftkey){
            dir += p_turn;
        }
        if(rightkey){
            dir -= p_turn;
        }
        if(upkey){
            last.add(-sin(dir)*p_vel, -cos(dir)*p_vel, 0);
        }

        this.move();


    }

    public void render() {
        pushMatrix();
        translate(PApplet.parseInt(pos.x), PApplet.parseInt(pos.y));
        rotate(-dir);

        translate(-6, 0);
        p_lgun.render();
        translate(12, 0);
        p_rgun.render();
        translate(-6, 0);

        fill(0);
        beginShape();
            vertex(0, p[0]);
            vertex(p[1], p[3]);
            vertex(p[2], p[3]);

        endShape();

        popMatrix();

    }






};




class World{
    ArrayList<IGameObject> actors;
    
    ArrayList<IGameObject> toAdd;
    ArrayList<IGameObject> toRemove;
    
    World(){
        actors = new ArrayList();

        toAdd = new ArrayList();
        toRemove = new ArrayList();
    }


    public void draw(){
        background(160);
        for(IGameObject o: toAdd){
            actors.add(o);
        }
        toAdd.clear();
        for(IGameObject o: toRemove){
            actors.remove(o);
        }
        toRemove.clear();

        for(IGameObject o: actors)
            o.tick();
        for(IGameObject o: actors)
            o.render();
        


    }

    public void addObject(IGameObject o){
        toAdd.add(o);
    }


};


boolean upkey = false, downkey = false, leftkey = false, rightkey = false;
boolean zkey = false;
boolean xkey = false;


public void keyPressed(){
    if(key == CODED){
        switch(keyCode){
            case UP:
            upkey = true;
            break;
            case DOWN:
            downkey = true;
            break;
            case LEFT:
            leftkey = true;
            break;
            case RIGHT:
            rightkey = true;
            break;
        }
    } else {
        switch(key) {
            case 'z':
            zkey = true;
            break;
            case 'Z':
            zkey = true;
            break;
            case 'x':
            xkey = true;
            break;
            case 'X':
            xkey = true;
            break;
        }
    }


}

public void keyReleased(){
    if(key == CODED){
        switch(keyCode){
            case UP:
            upkey = false;
            break;
            case DOWN:
            downkey = false;
            break;
            case LEFT:
            leftkey = false;
            break;
            case RIGHT:
            rightkey = false;
            break;
        }
    } else {
        switch(key) {
            case 'z':
            zkey = false;
            break;
            case 'Z':
            zkey = false;
            break;
            case 'x':
            xkey = false;
            break;
            case 'X':
            xkey = false;
            break;
        }
    }


}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "GDAGameJamOne" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
