
class World{
    ArrayList<IGameObject> actors;
    
    ArrayList<IGameObject> toAdd;
    ArrayList<IGameObject> toRemove;
    
    ArrayList<GunComponentType> pending;

    World(){
        actors = new ArrayList();

        toAdd = new ArrayList();
        toRemove = new ArrayList();

        pending = new ArrayList();
    }


    void draw(){
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
        
        for(IGameObject a: actors)
            for(IGameObject b: actors)
                if(a.size+b.size >= dist(a, b))
                    a.collide(b);

        if(pending.size() != 0){
            fill(0);
            String temp = "You've Picked Up "+pending.get(0).name;
            text(temp, width/2-4.5*temp.length(), height*2/3);

            temp = "Press X To Attach To Left";
            text(temp, width/2-4.5*temp.length(), height*2/3+16);
            temp = "Press C To Attach To Right";
            text(temp, width/2-4.5*temp.length(), height*2/3+32);
            temp = "Press V To Discard";
            text(temp, width/2-4.5*temp.length(), height*2/3+48);
            

        }
    }

    void addObject(IGameObject o){
        toAdd.add(o);
    }

    void removeObject(IGameObject o){
        toRemove.add(o);
    }
    void pickup(GunComponentType g){
        boolean added = false;
        if(g instanceof AMain){
            if(mercury.lgun instanceof EmptyGun){
                mercury.lgun = (AMain) g;
                mercury.laugs.clear();
                mercury.lammo = new StandardAmmo();
                added = true;
            } else if(mercury.rgun instanceof EmptyGun){
                mercury.rgun = (AMain) g;
                mercury.raugs.clear();
                mercury.rammo = new StandardAmmo();
                added = true;
            } 
        } else if(g instanceof AAugment){
            if(mercury.lgun instanceof EmptyGun){
                if(!mercury.raugs.contains(g)){
                    mercury.raugs.add((AAugment) g);
                } added = true;
            } else if(mercury.rgun instanceof EmptyGun){
                if(!mercury.laugs.contains(g)){
                    mercury.laugs.add((AAugment) g);
                } added = true;
            } else if(mercury.laugs.contains(g)){
                if(!mercury.raugs.contains(g)){
                    mercury.raugs.add((AAugment) g);
                } added = true;
            } else if(mercury.raugs.contains(g)){
                mercury.laugs.add((AAugment) g);
                added = true;
            }
        }

        if(!added){
            pending.add(g);
        }
    }

};

float dist(IGameObject a, IGameObject b){
    return sqrt(sq(a.pos.x-b.pos.x)+sq(a.pos.y-b.pos.y));
}
