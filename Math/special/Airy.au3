#include-once

Func AiryAi($x)
	Return Sin((2/3)*$x^(3/2)+$Pi/4)/(Sqrt($Pi)*$x^(1/4))
EndFunc

Func AiryBi($x)
	Return Cos((2/3)*$x^(3/2)+$Pi/4)/(Sqrt($Pi)*$x^(1/4))
EndFunc