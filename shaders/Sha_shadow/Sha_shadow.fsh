varying float tdis; //top distance
varying float ldis; //light distance

void main(){
	float str = (1. - abs(tdis-0.5)*2./ldis)*5.; //soft shadow strength
    gl_FragColor = vec4(1.); //draws an invisible shadow that can block the light when Z-buffer is on
    //gl_FragColor = vec4(0.); //draws an invisible shadow that can block the light when Z-buffer is on
}