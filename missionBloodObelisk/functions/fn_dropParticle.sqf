params ["_obelisk"];


private _bloodParticles = "#particlesource" createvehiclelocal [0, 0, 0];
_bloodParticles setPosASL (getPosASL _obelisk);
_bloodParticles setParticleParams [["fxp_adat\universal\bleed_1.p3d",1,0,1,0],"","Billboard",1,6,[0,0,0],[0,0,6],1,40,1,0.15,[1],[[0.11467,0,0,0.131976],[0.8,0.6,0.16,0]],[-2],0.2,0.2,"","","",0,false,0.01,[[10000,6000,1600,0.5]],[0,1,0]];
_bloodParticles setParticleRandom [2,[0.3,0.3,0.1],[1,1,3],0,0.5,[0.304667,0.0393065,0.0335375,1],0,0,360,0.3];
_bloodParticles setDropInterval 0.005;
[{
    params ["_bloodParticles"];
    deleteVehicle _bloodParticles;
},_bloodParticles, 0.3] call cba_fnc_waitAndExecute;