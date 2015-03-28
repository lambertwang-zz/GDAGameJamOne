abstract class Bullet extends IGameObject{
    color col;
    int lifespan;
    int damage;

    Bullet(){}  
}

class Standard extends Bullet{
    Standard(PVector tpos, IGameObject owner, int tdam, float tvel, color tcol){
        PVector temp = new PVector();
        temp.add(tpos);
        temp.add(owner.pos);
        pos = new PVector();
        pos.set(temp);
        last = new PVector();
        last.set(temp);
        dir = owner.dir+tpos.z;
        last.add(-sin(dir)*tvel, -cos(dir)*tvel, 0);

        size = tvel/2;
        team = owner.team;

        col = tcol;
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
        stroke(col);
        strokeWeight(size/2);
        line(0, -size, 0, size);
        noStroke();
        popMatrix();
    }
};

class Accel extends Bullet{
    Accel(PVector tpos, IGameObject owner, int tdam, float tvel, color tcol){
        tvel *= .2;
        PVector temp = new PVector();
        temp.add(tpos);
        temp.add(owner.pos);
        pos = new PVector();
        pos.set(temp);
        last = new PVector();
        last.set(temp);
        dir = owner.dir+tpos.z;
        last.add(-sin(dir)*tvel, -cos(dir)*tvel, 0);

        size = tvel;
        team = owner.team;

        col = tcol;
        damage = int(tdam*0.4);
        lifespan = 60;

        world.addObject(this);
    }  

    void tick(){
        if(lifespan == 0){
            world.removeObject(this);
        }
        if(lifespan > 50){
            size *= 1.1;
        }
        if(lifespan == 40 || lifespan == 20){
            damage *= 2;
        }
        move(1.05);
        lifespan--;
    }

    void render(){
        pushMatrix();
        translate(pos.x, pos.y);
        rotate(-dir);
        stroke(col);
        strokeWeight(size/2);
        line(0, -size, 0, size);
        noStroke();
        popMatrix();
    }
};

