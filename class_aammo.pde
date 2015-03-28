
abstract class AAmmo extends GunComponentType{
    AAmmo(){}

    void make(IGameObject owner, PVector offset, int tdam, float tvel, color tcol){}
}

class StandardAmmo extends AAmmo{
    StandardAmmo(){
        name = "Standard Ammo";
    }

    void make(IGameObject owner, PVector offset, int tdam, float tvel, color tcol){
        new Standard(offset, owner, tdam, tvel, tcol);
    }

};


class AccelAmmo extends AAmmo{
    AccelAmmo(){
        name = "Accelerating Ammo";
    }

    void make(IGameObject owner, PVector offset, int tdam, float tvel, color tcol){
        new Accel(offset, owner, tdam, tvel, tcol);
    }

};

