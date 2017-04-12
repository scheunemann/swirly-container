/*

    Some text for later

*/
// paramters
length = 40;
height = 100;

rc = 15;

scale = 1.5;
twists      =150;
wall        = 1;
$fn = 100;

module round_square(l, r){
        minkowski()
        {
            circle(r);
            
            //resize square so the quadratic hull remains the same
            square(l- 2*r, center = true);
        }
}

module make_box(){
    
    linear_extrude(height = height, twist = twists, slices = 60, scale = scale) { 
        difference() {
        
        round_square(length, rc);
        
         offset(r = -wall)
            round_square(length, rc);
        
    }
    }
    
}
   
make_box();