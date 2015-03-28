abstract class GunComponentType{
    GunComponentType(){
        
    }

    void render(){


    }

    void tick(){

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

    void render() {

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

