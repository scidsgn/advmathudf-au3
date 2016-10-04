#include-once

Func Integral($fnFunction, $vStart = 0, $vEnd = 1, $fDelta = 0.001, $aAdditionalParams = 0)
	If IsFunc($fnFunction) Then $fnFunction = FuncName($fnFunction)

	Local $sum = 0
	Local $a, $b
	Local $i

	$a = Call($fnFunction, $vStart)

	For $i = ($vStart + $fDelta) To $vEnd Step $fDelta
		If IsArray($aAdditionalParams) Then
			$b  = Call($fnFunction, $i, $aAdditionalParams)
		Else
			$b  = Call($fnFunction, $i)
		EndIf
		$sum += 0.5 * ($a+$b) * $fDelta

		$a = $b
	Next

	Return $sum
EndFunc
