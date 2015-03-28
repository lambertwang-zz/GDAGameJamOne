
class World{
    ArrayList<IGameObject> actors;
    
    ArrayList<IGameObject> toAdd;
    ArrayList<IGameObject> toRemove;
    
    World(){
        actors = new ArrayList();

        toAdd = new ArrayList();
        toRemove = new ArrayList();
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
        


    }

    void addObject(IGameObject o){
        toAdd.add(o);
    }


};


