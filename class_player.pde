
float p_vel = 0.4;
float p_turn = 0.08;
float p_friction = 0.95;

class Player extends IGameObject{
    AMain lgun, rgun;
    ArrayList<AAugment> laugs, raugs;
    AAmmo lammo, rammo;
    float[] p;

    Player(PVector tpos) {
        pos = new PVector();
        pos.set(tpos);
        last = new PVector();
        last.set(tpos);

        size = 12;
        team = 1;

        p = new float[8];
        p[0] = scale*16;
        p[1] = scale*8;
        p[2] = scale*-8;
        p[3] = scale*-16;
        p[4] = scale*-6;
        p[6] = scale*6;
        
        lgun = new EmptyGun(this);
        laugs = new ArrayList();
        lammo = new StandardAmmo();

        rgun = new MachineGun(this);
        raugs = new ArrayList();
        rammo = new StandardAmmo();

        world.addObject(this);
    }

    void tick() {
        if(leftkey){
            dir += p_turn;
        }
        if(rightkey){
            dir -= p_turn;
        }
        if(upkey){
            last.add(-sin(dir)*p_vel, -cos(dir)*p_vel, 0);
        }
        if(zkey){
            lgun.fire(laugs, lammo, new PVector(cos(dir)*p[4]+sin(dir)*p[1], -sin(dir)*p[4]+cos(dir)*p[1], -0.2));
            rgun.fire(raugs, rammo, new PVector(cos(dir)*p[6]+sin(dir)*p[1], -sin(dir)*p[6]+cos(dir)*p[1], 0.2));
        }
        lgun.tick();
        rgun.tick();

        this.move(p_friction);


    }

    void render() {
        pushMatrix();
        translate(int(pos.x), int(pos.y));
        rotate(-dir);
        
        pushMatrix();
        translate(p[4], 0);
        rotate(0.2);
        lgun.render();
        popMatrix();

        pushMatrix();
        translate(p[6], 0);
        rotate(-0.2);
        scale(-1, 1);
        rgun.render();
        popMatrix();

        fill(0);
        beginShape();
            vertex(0, p[0]);
            vertex(p[1], p[3]);
            vertex(p[2], p[3]);

        endShape();

        popMatrix();

    }
};



