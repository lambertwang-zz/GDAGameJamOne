abstract class GunComponent extends IGameObject{
    GunComponentType pickup;

    GunComponent(){}

    void tick(){
        dir += 0.02;
        dir %= 2*PI;
    }
}

class GMachineGun extends GunComponent{
    GMachineGun(PVector tpos){
        pos = tpos;
        world.addObject(this);
        size = 12;
        pickup = new MachineGun(mercury);
    }
    

    void render(){
        pushMatrix();
        translate(pos.x, pos.y);
        rotate(-dir);        
        fill(128, 128, 0);
        ellipse(0, 0, 24, 24);
        pickup.render();
        popMatrix();
    }

    void collide(IGameObject o){
        if(o instanceof Player){
            world.removeObject(this);
            world.pickup(pickup);
        fill(0, 128, 128);
        ellipse(0, 0, 24, 24);
        }
    }
};

class GRailGun extends GunComponent{
    GRailGun(PVector tpos){
        pos = tpos;
        world.addObject(this);
        size = 12;
        pickup = new RailGun(mercury);
    }
    

    void render(){
        pushMatrix();
        translate(pos.x, pos.y);
        rotate(-dir);
        fill(128, 128, 0);
        ellipse(0, 0, 24, 24);
        pickup.render();
        popMatrix();
    }

    void collide(IGameObject o){
        if(o instanceof Player){
            world.removeObject(this);
            world.pickup(pickup);
        }
    }
};

class GTriple extends GunComponent{
    GTriple(PVector tpos){
        pos = tpos;
        world.addObject(this);
        size = 12;
    }

    void render(){
        pushMatrix();
        translate(pos.x, pos.y);
        rotate(-dir);
        fill(128, 0, 128);
        ellipse(0, 0, 24, 24);
        fill(255, 192, 255);
        rect(-8, -1, 8, 1);
        rect(-8, -5, 8, -3);
        rect(-8,  3, 8, 5);
        popMatrix();
    }

    void collide(IGameObject o){
        if(o instanceof Player){
            world.removeObject(this);
            world.pickup(new Triple());
        }
    }
};

class GStandardAmmo extends GunComponent{
    GStandardAmmo(PVector tpos){
        pos = tpos;
        world.addObject(this);
        size = 12;
    }

    void render(){
        pushMatrix();
        translate(pos.x, pos.y);
        rotate(-dir);
        fill(0, 128, 128);
        ellipse(0, 0, 24, 24);
        fill(255, 255, 0);
        rect(-8, 3, 8, -3);
        fill(32);
        rect(-8, 4, 4, -4);
        popMatrix();
    }

    void collide(IGameObject o){
        if(o instanceof Player){
            world.removeObject(this);
            world.pickup(new StandardAmmo());
        }
    }
};


class GAccelAmmo extends GunComponent{
    GAccelAmmo(PVector tpos){
        pos = tpos;
        world.addObject(this);
        size = 12;
    }

    void render(){
        pushMatrix();
        translate(pos.x, pos.y);
        rotate(-dir);
        fill(0, 128, 128);
        ellipse(0, 0, 24, 24);
        fill(0, 255, 0);
        rect(-8, 2, 8, -2);
        fill(32);
        rect(-8, 4, -1, -4);
        rect(-8, 3, 4, -3);
        popMatrix();
    }

    void collide(IGameObject o){
        if(o instanceof Player){
            world.removeObject(this);
            world.pickup(new AccelAmmo());
        }
    }
};



