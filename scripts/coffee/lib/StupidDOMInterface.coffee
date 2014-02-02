getCSSProp = do ->

	p = null

	el = document.createElement 'div'

	(possibleProps) ->

		for prop in possibleProps

			return prop if el.style[prop] isnt undefined

		false

cssPropertySetter = (prop) ->

	actualProp = getCSSProp getPossiblePropsFor prop

	return (->) unless actualProp

	(el, v) -> el.style[actualProp] = v

getPossiblePropsFor = (prop) ->

	[
		'webkit' + prop[0].toUpperCase() + prop.substr(1, prop.length),

		'moz' + prop[0].toUpperCase() + prop.substr(1, prop.length),

		prop
	]

module.exports = css =

	setTransform: cssPropertySetter 'transform'

	setTransformStyle: cssPropertySetter 'transformStyle'

	setTransformOrigin: cssPropertySetter 'transformOrigin'

	setCssFilter: cssPropertySetter 'filter'

	setTransitionDuration: cssPropertySetter 'transitionDuration'

	setTransitionTimingFunction: cssPropertySetter 'transitionTimingFunction'

	# Turns numbers to css rgb representation
	rgb: (r, g, b) ->

		'rgb(' + r + ', ' + g + ', ' + b + ')'


module.exports = class StupidDOMInterface

	constructor: (@el, init) ->

		@_s = new Float32Array 25

		@_initialize init

	_initialize: (init) ->

		# initialize opacity
		@_s[6] = 1

		# initialize transform values
		@_s[19] = 1
		@_s[20] = 1
		@_s[21] = 1
		@_s[24] = 1000000

		return if init is undefined or init is null

		@setComplex(init)

	setComplex: (complex) ->

		if complex.width isnt undefined

			@setWidth complex.width

		if complex.height isnt undefined

			@setHeight complex.height

		if complex.top isnt undefined

			@setTop complex.top

		if complex.left isnt undefined

			@setLeft complex.left

		if complex.bottom isnt undefined

			@setBottom complex.bottom

		if complex.right isnt undefined

			@setRight complex.right

		if complex.opacity isnt undefined

			@setOpacity complex.opacity

		if complex.textShadowH isnt undefined

			@setTextShadowH complex.textShadowH

		if complex.textShadowV isnt undefined

			@setTextShadowV complex.textShadowV

		if complex.textShadowBlur isnt undefined

			@setTextShadowBlur complex.textShadowBlur

		if complex.textShadowColor isnt undefined

			if complex.textShadowColor.red   is undefined then complex.textShadowColor.red   = @_s[10]
			if complex.textShadowColor.green is undefined then complex.textShadowColor.green = @_s[11]
			if complex.textShadowColor.blue  is undefined then complex.textShadowColor.blue  = @_s[12]

			@setTextShadowColor complex.textShadowColor.red, complex.textShadowColor.green, complex.textShadowColor.blue

		if complex.rotateX isnt undefined

			@setRotateX complex.rotateX

		if complex.rotateY isnt undefined

			@setRotateY complex.rotateY

		if complex.rotateZ isnt undefined

			@setRotateZ complex.rotateZ

		if complex.translateX isnt undefined

			@setTranslateX complex.translateX

		if complex.translateY isnt undefined

			@setTranslateY complex.translateY

		if complex.translateZ isnt undefined

			@setTranslateZ complex.translateZ

		if complex.scaleX isnt undefined

			@setScaleX complex.scaleX

		if complex.scaleY isnt undefined

			@setScaleY complex.scaleY

		if complex.scaleZ isnt undefined

			@setScaleZ complex.scaleZ

		if complex.skewX isnt undefined

			@setSkewX complex.skewX

		if complex.skewY isnt undefined

			@setSkewY complex.skewY

		if complex.perspective isnt undefined

			@setPerspective complex.perspective

		return @

	_setSimple: (title, value, param) ->

		if param isnt null

			value = value + param

		@el.style[title] = value

	_setTextShadow: ->

		@el.style.textShadow = (@_s[7] + 'px') + ' ' + (@_s[8] + 'px') + ' ' + (@_s[9] + 'px') + ' ' + ('rgb(' + @_s[10] + ',' + @_s[11] + ',' + @_s[12] + ')')

	_setTransform: ->

		transformString = ''

		if @_s[13] isnt 0

			transformString = ' rotateX(' + @_s[13] + 'deg) ' + transformString

		if @_s[14] isnt 0

			transformString = ' rotateY(' + @_s[14] + 'deg) ' + transformString

		if @_s[15] isnt 0

			transformString = ' rotateZ(' + @_s[15] + 'deg) ' + transformString

		if @_s[16] isnt 0

			transformString = ' translateX(' + @_s[16] + 'px) ' + transformString

		if @_s[17] isnt 0

			transformString = ' translateY(' + @_s[17] + 'px) ' + transformString

		if @_s[18] isnt 0

			transformString = ' translateZ(' + @_s[18] + 'px) ' + transformString

		if @_s[19] isnt 1

			transformString = ' scaleX(' + @_s[19] + ') ' + transformString

		if @_s[20] isnt 1

			transformString = ' scaleY(' + @_s[20] + ') ' + transformString

		if @_s[21] isnt 1

			transformString = ' scaleZ(' + @_s[21] + ') ' + transformString

		if @_s[22] isnt 0

			transformString = ' skewX(' + @_s[22] + 'deg) ' + transformString

		if @_s[23] isnt 0

			transformString = ' skewY(' + @_s[23] + 'deg) ' + transformString

		if @_s[24] < 1000000

			transformString = ' perspective(' + @_s[24] + ') ' + transformString


		@css.setTransform @el, transformString

	#
	#	Size
	#

	getWidth: ->

		@_s[0]

	setWidth: (width) ->

		@_setSimple 'width', width, 'px'

		@_s[0] = width

		return @

	getHeight: ->

		@_s[1]

	setHeight: (height) ->

		@_setSimple 'height', height, 'px'

		@_s[1] = height

		return @

	#
	#	Pos
	#

	getTop: ->

		@_s[2]

	setTop: (top) ->

		@_setSimple 'top', top, 'px'

		@_s[2] = top

		return @

	getLeft: ->

		@_s[3]

	setLeft: (left) ->

		@_setSimple 'left', left, 'px'

		@_s[3] = left

		return @

	getBottom: ->

		@_s[4]

	setBottom: (bottom) ->

		@_setSimple 'bottom', bottom, 'px'

		@_s[4] = bottom

		return @

	getRight: ->

		@_s[5]

	setRight: (right) ->

		@_setSimple 'right', right, 'px'

		@_s[5] = right

		return @

	#
	#	Opacity
	#

	getOpacity: ->

		@_s[6]

	setOpacity: (opacity) ->

		@_setSimple 'opacity', opacity, null

		@_s[6] = opacity

		return @

	#
	#	Text Shadow
	#

	getTextShadowH: ->

		@_s[7]

	setTextShadowH: (h) ->

		@_s[7] = h

		do @_setTextShadow

		return @

	getTextShadowV: ->

		@_s[8]

	setTextShadowV: (v) ->

		@_s[8] = v

		do @_setTextShadow

		return @

	getTextShadowBlur: ->

		@_s[9]

	setTextShadowBlur: (blur) ->

		@_s[9] = blur

		do @_setTextShadow

		return @

	getTextShadowColor: ->

		[@_s[10], @_s[11], @_s[12]]

	setTextShadowColor: (colorRed, colorGreen, colorBlue) ->

		@_s[10] = colorRed
		@_s[11] = colorGreen
		@_s[12] = colorBlue

		do @_setTextShadow

		return @

	#
	#	Transforms
	#
	#	Rotate
	#

	getRotateX: ->

		@_s[13]

	setRotateX: (rotateX) ->

		@_s[13] = rotateX

		do @_setTransform

		return @

	getRotateY: ->

		@_s[14]

	setRotateY: (rotateY) ->

		@_s[14] = rotateY

		do @_setTransform

		return @

	getRotateZ: ->

		@_s[15]

	setRotateZ: (rotateZ) ->

		@_s[15] = rotateZ

		do @_setTransform

		return @

	#
	#	Translate
	#

	getTranslateX: ->

		@_s[16]

	setTranslateX: (translateX) ->

		@_s[16] = translateX

		do @_setTransform

		return @

	getTranslateY: ->

		@_s[17]

	setTranslateY: (translateY) ->

		@_s[17] = translateY

		do @_setTransform

		return @

	getTranslateZ: ->

		@_s[18]

	setTranslateZ: (translateZ) ->

		@_s[18] = translateZ

		do @_setTransform

		return @

	#
	#	Scale
	#

	getScaleX: ->

		@_s[19]

	setScaleX: (scaleX) ->

		@_s[19] = scaleX

		do @_setTransform

		return @

	getScaleY: ->

		@_s[20]

	setScaleY: (scaleY) ->

		@_s[20] = scaleY

		do @_setTransform

		return @

	getScaleZ: ->

		@_s[21]

	setScaleZ: (scaleZ) ->

		@_s[21] = scaleZ

		do @_setTransform

		return @

	#
	#	Skew
	#

	getSkewX: ->

		@_s[22]

	setSkewX: (skewX) ->

		@_s[22] = skewX

		do @_setTransform

		return @

	getSkewY: ->

		@_s[23]

	setSkewY: (skewY) ->

		@_s[23] = skewY

		do @_setTransform

		return @

	#
	#	perspective
	#

	getPerspective: ->

		@_s[24]

	setPerspective: (perspective) ->

		@_s[24] = perspective

		do @_setTransform

		return @

