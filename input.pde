boolean upkey = false, downkey = false, leftkey = false, rightkey = false;
boolean zkey = false;
boolean xkey = false;


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
            case 'x':
            xkey = true;
            break;
            case 'X':
            xkey = true;
            break;
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
            case 'x':
            xkey = false;
            break;
            case 'X':
            xkey = false;
            break;
        }
    }


}

