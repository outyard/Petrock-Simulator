var _str = "YOU WIN!!";
var _score = 0;

_str += "\nStyle points: " + string(other.style) + "  (" + string(other.style*100) + ")";
_score += other.style*100;

var _diff = 250 * other.hp / 5;
_str += "\nHp Left: " + string(other.hp) + "/5  (" + string(_diff) + ")";
_score += _diff;


_diff = other.kills * 100;
_str += "\nPapers beaten: " + string(other.kills) + "  (" + string(_diff) + ")";
_score += _diff;

_diff = min(500, 5000 / (other.framesInGame / 60));
_str += "\nSeconds played: " + string(other.framesInGame/60) + "  (" + string(_diff) + ")";
_score += _diff;


_str += "\n\nFinal score: " + string(_score) + "!";

show_message(_str);
game_restart();