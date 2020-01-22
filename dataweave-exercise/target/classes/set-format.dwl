%dw 1.0
%output application/json
%function formatting(input)

input match {
	:object -> input mapObject {
		($$): setFormat ($) 
	}, 
	:array -> true, 
	default -> false 
}

%function setFormat(input)
input match {
	:string ->  trim ( input ) ++ "." , 
	:number -> ((floor ( input )) as :string {format: "#.00"}) as :number,
	:date -> input , 
	default -> null
}
---
{
	formatting: formatting
	
}