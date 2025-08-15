params ["_unit"];

private _rankHierarchy = ["PRIVATE", "CORPORAL", "SERGEANT", "LIEUTENANT", "CAPTAIN", "MAJOR", "COLONEL"];
private _rank = rank _unit;

_rankHierarchy find _rank