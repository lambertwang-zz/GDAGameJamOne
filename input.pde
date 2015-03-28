boolean upkey = false, downkey = false, leftkey = false, rightkey = false;
boolean zkey = false;


void keyPressed(){
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

        }
        if(world.pending.size() != 0){
            GunComponentType temp = world.pending.get(0);
            if(key == 'v' || key == 'V')
                world.pending.remove(0);
            else if(key == 'b' || key == 'B'){
                world.pending.remove(0);
                world.pending.add(temp);
            }
            else if(key == 'c' || key == 'C'){
                if(temp instanceof AMain){
                    mercury.lgun = (AMain)temp;
                }
                if(temp instanceof AAugment)
                    if(!mercury.laugs.contains(temp))
                        mercury.laugs.add((AAugment)temp);
                if(temp instanceof AAmmo)
                    mercury.lammo = (AAmmo)temp;
                world.pending.remove(0);
            }
            else if(key == 'x' || key == 'X'){
                if(temp instanceof AMain){
                    mercury.rgun = (AMain)temp;
                }
                if(temp instanceof AAugment)
                    if(!mercury.raugs.contains(temp))
                        mercury.raugs.add((AAugment)temp);
                if(temp instanceof AAmmo)
                    mercury.rammo = (AAmmo)temp;
                world.pending.remove(0);
            }
        }
    }


}

void keyReleased(){
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
        }
    }


}

