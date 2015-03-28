
float p_vel = 0.4;
float p_turn = 0.08;

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

        this.move();


    }

    void render() {
        pushMatrix();
        translate(int(pos.x), int(pos.y));
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



