#include-once

Func BesselJ0($x)
	Return BesselJn($x, 0)
EndFunc

Func BesselJ1($x)
	Return BesselJn($x, 1)
EndFunc

Func BesselJn($x, $n)
	Local $aParams = [Int($n), $x]
	Local $intValue = Integral(_BesselJnIntegral, 0, $Pi, 0.001, $aParams)

	Return (1/$Pi)*$intValue
EndFunc

Func _BesselJnIntegral($t, $aParams)
	Local $n = $aParams[0]
	Local $x = $aParams[1]

	Return Cos($n*$t - $x * Sin($t))
EndFunc