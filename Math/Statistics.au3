#include-once

Func Variance($aData)
	Local $c = 0, $n = UBound($aData)
	Local $m = ArithmeticMean($aData)

	For $i = 0 To ($n-1)
		$c += ($aData[$i]-$m)^2
	Next

	Return $c/$n
EndFunc

Func StandardDeviation($aData)
	Return Sqrt(Variance($aData))
EndFunc

Func NormalDistributonPDF($x, $m, $s)
	Return (1/($s*Sqrt(2*$Pi)))*Exp((-($x-$m)^2)/(2*$s^2))
EndFunc