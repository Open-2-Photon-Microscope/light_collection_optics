// modular magnetic filter / lens holders

use <fillets_and_rounds.scad>

module magnets(w=3.25,h=2,r=15){
    $fn=30;
    for(x=[-1:2:1]){
        for(y=[-1:2:1]){
            translate([x*r,y*r])cylinder(d=w,h=h);
        }}
}//magnets


//magnets();

module spacer(x,y,z,d=25.4,mag_h=2.05,lip=0.4,grub=3.3,grub_h=0){
    $fn=60;
    difference(){
        add_rounds(axis="z",R=5,fn=20)translate([0,0,z/2])cube([x,y,z],center=true);
        translate([0,0,-0.05])magnets(h=mag_h);
        translate([0,0,z-mag_h+0.05])magnets(h=mag_h);
        translate([0,0,lip])cylinder(d=d,h=z);
        translate([0,0,-0.05])cylinder(d=d-lip,h=z);
        if(grub!=0){
        translate([0,0,grub/2+lip+grub_h])rotate([90,0,0])cylinder(d=grub,h=y,$fn=6);}
    }//end difference
}//spacer

spacer(40,40,10);