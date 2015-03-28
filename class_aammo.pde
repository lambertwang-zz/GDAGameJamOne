
abstract class AAmmo extends GunComponentType{
    AAmmo(){}

    void make(IGameObject owner, PVector offset, int tdam, float tvel){}
}

class StandardAmmo extends AAmmo{
    StandardAmmo(){
        name = "Standard Ammo";
    }

    void make(IGameObject owner, PVector offset, int tdam, float tvel){
        new Standard(offset, owner, tdam, tvel);
    }

};
