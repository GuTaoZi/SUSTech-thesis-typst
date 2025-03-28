#import "font.typ" : *

#let heading-size = (FSIZE.三号,FSIZE.四号,FSIZE.小四)

#let sustech-undergraduate-heading-numbering = (
	(..nums) => (
		if nums.pos().map(str).len()==1 {
			nums.pos().map(str).at(0) + "."
		}
		else {
			nums.pos().map(str).join(".")
		}
	)
)

