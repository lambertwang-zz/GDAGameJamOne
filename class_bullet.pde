abstract class Bullet extends IGameObject{
    int lifespan;
    int damage;

    Bullet(){}  
}

class Standard extends Bullet{
    Standard(PVector tpos, IGameObject owner, int tdam, float tvel){
        PVector temp = new PVector();
        temp.add(tpos);
        temp.add(owner.pos);
        pos = new PVector();
        pos.set(temp);
        last = new PVector();
        last.set(temp);
        dir = owner.dir+tpos.z;
        last.add(-sin(dir)*tvel, -cos(dir)*tvel, 0);

        size = 4;
        team = owner.team;

        damage = tdam;
        lifespan = 80;

        world.addObject(this);
    }  

    void tick(){
        if(lifespan == 0){
            world.removeObject(this);
        }
        move(1);
        lifespan--;
    }

    void render(){
        pushMatrix();
        translate(pos.x, pos.y);
        rotate(-dir);
        stroke(255, 255, 0);
        strokeWeight(2);
        line(0, -4, 0, 4);
        noStroke();
        popMatrix();
    }
};

