#include-once

Func Integral($fnFunction, $vStart = 0, $vEnd = 1, $fDelta = 0.001, $aAdditionalParams = 0, $iMode = $M_INTEGRATE_TRAPEZOID)
	If IsFunc($fnFunction) Then $fnFunction = FuncName($fnFunction)

	Local $sum = 0
	Local $a, $b
	Local $i, $h
	Local $n = ($vEnd-$vStart)/$fDelta

	Switch $iMode
		Case $M_INTEGRATE_TRAPEZOID
			$a = Call($fnFunction, $vStart)

			For $i = ($vStart + $fDelta) To $vEnd Step $fDelta
				$b = __IntegralCall($fnFunction, $i, $aAdditionalParams)
				$sum += 0.5 * ($a+$b) * $fDelta

				$a = $b
			Next
		Case $M_INTEGRATE_SIMPSON
			$h = ($vEnd-$vStart)/(2*$n)
			$sum += __IntegralCall($fnFunction, $vStart, $aAdditionalParams)

			For $i = 1 To (2*$n-1) Step +2
				$sum += 4*__IntegralCall($fnFunction, $vStart+$i*$h, $aAdditionalParams)
			Next

			For $i = 2 To (2*$n-2) Step +2
				$sum += 2*__IntegralCall($fnFunction, $vStart+$i*$h, $aAdditionalParams)
			Next

			$sum += __IntegralCall($fnFunction, $vEnd, $aAdditionalParams)

			$sum *= $h/3
	EndSwitch

	Return $sum
EndFunc

Func __IntegralCall($fnFunction, $fX, $aAdditionalParams = 0)
	If IsArray($aAdditionalParams) Then
		Return Call($fnFunction, $fX, $aAdditionalParams)
	Else
		Return Call($fnFunction, $fX)
	EndIf
EndFunc