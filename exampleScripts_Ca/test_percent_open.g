

str channame = "NaDiba"
float Xgate = {getfield {channame} X}
float Ygate = {getfield {channame} Y}

float Xpower = {getfield {channame} Xpower}
float Ypower = {getfield {channame} Ypower}

float fractionopen = {pow {Xgate} {Xpower}} * {pow {Ygate} {Ypower}}



float Gk = {getfield {channame} Gk}
float Gbar = {getfield {channame} Gbar}
float fractionopen2 = {Gk} / {Gbar}



echo fraction open = {fractionopen}
echo fraction open 2 = {fractionopen2}


