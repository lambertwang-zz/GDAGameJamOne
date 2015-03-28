
abstract class AAugment extends GunComponentType{
    AAugment(){}
    void modify(AMain gun, PVector offset, AAmmo ammo){}
    void active(AMain gun, PVector offset, AAmmo ammo){}
}

class Triple extends AAugment{
    Triple(){
        name = "A Projectile Tripler";
    }
    void modify(AMain gun, PVector offset, AAmmo ammo){
        gun.firerate *= 1.2;
    }
    void active(AMain gun, PVector offset, AAmmo ammo){
        PVector loffset = new PVector();
        PVector roffset = new PVector();
        loffset.set(offset);
        roffset.set(offset);
        loffset.z += -.3;
        roffset.z += .3;
        ammo.make(gun.owner, loffset, gun.damage, gun.velocity, gun.col);
        ammo.make(gun.owner, roffset, gun.damage, gun.velocity, gun.col);

    }
};
