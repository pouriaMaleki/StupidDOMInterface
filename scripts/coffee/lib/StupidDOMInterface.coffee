module.exports = class StupidDOMInterface

	constructor: (@el, init) ->

		@_s = new Float32Array 25

		@initialize init

	initialize: (init) ->

		# initialize opacity
		@_s[6] = 1

		# initialize transform values
		@_s[19] = 1
		@_s[20] = 1
		@_s[21] = 1
		@_s[24] = 1000000

		return if init is undefined or init is null

		if init.width isnt undefined

			@_s[0] = init.width

		if init.height isnt undefined

			@_s[1] = init.height

		if init.top isnt undefined

			@_s[2] = init.top

		if init.left isnt undefined

			@_s[3] = init.left

		if init.bottom isnt undefined

			@_s[4] = init.bottom

		if init.right isnt undefined

			@_s[5] = init.right

		if init.opacity isnt undefined

			@_s[6] = init.opacity

		if init.TextShadowH isnt undefined

			@_s[7] = init.TextShadowH

		if init.TextShadowV isnt undefined

			@_s[8] = init.TextShadowV

		if init.TextShadowBlur isnt undefined

			@_s[9] = init.TextShadowBlur

		if init.TextShadowColorRed isnt undefined

			@_s[10] = init.TextShadowColorRed

		if init.TextShadowColorGreen isnt undefined

			@_s[11] = init.TextShadowColorGreen

		if init.TextShadowColorBlue isnt undefined

			@_s[12] = init.TextShadowColorBlue

		if init.rotateX isnt undefined

			@_s[13] = init.rotateX

		if init.rotateY isnt undefined

			@_s[14] = init.rotateY

		if init.rotateZ isnt undefined

			@_s[15] = init.rotateZ

		if init.translateX isnt undefined

			@_s[16] = init.translateX

		if init.translateY isnt undefined

			@_s[17] = init.translateY

		if init.translateZ isnt undefined

			@_s[18] = init.translateZ

		if init.scaleX isnt undefined

			@_s[19] = init.scaleX

		if init.scaleY isnt undefined

			@_s[20] = init.scaleY

		if init.scaleZ isnt undefined

			@_s[21] = init.scaleZ

		if init.skewX isnt undefined

			@_s[22] = init.skewX

		if init.skewY isnt undefined

			@_s[23] = init.skewY

		if init.perspective isnt undefined

			@_s[24] = init.perspective

	setSimple: (title, value, param) ->

		if param isnt null

			value = value + param

		@el.style[title] = value

	setTextShadow: ->

		@el.style.textShadow = (@_s[7] + 'px') + ' ' + (@_s[8] + 'px') + ' ' + (@_s[9] + 'px') + ' ' + ('rgb(' + @_s[10] + ',' + @_s[11] + ',' + @_s[12] + ')')

	setTransform: ->

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


		@el.style.webkitTransform = transformString

		# TODO ms and moz


	#
	#	Size
	#

	getWidth: ->

		@_s[0]

	setWidth: (width) ->

		@setSimple 'width', width, 'px'

		@_s[0] = width

	getHeight: ->

		@_s[1]

	setHeight: (height) ->

		@setSimple 'height', height, 'px'

		@_s[1] = height

	#
	#	Pos
	#

	getTop: ->

		@_s[2]

	setTop: (top) ->

		@setSimple 'top', top, 'px'

		@_s[2] = top

	getLeft: ->

		@_s[3]

	setLeft: (left) ->

		@setSimple 'left', left, 'px'

		@_s[3] = left

	getBottom: ->

		@_s[4]

	setBottom: (bottom) ->

		@setSimple 'bottom', bottom, 'px'

		@_s[4] = bottom

	getRight: ->

		@_s[5]

	setRight: (right) ->

		@setSimple 'right', right, 'px'

		@_s[5] = right

	#
	#	Opacity
	#

	getOpacity: ->

		@_s[6]

	setOpacity: (opacity) ->

		@setSimple 'opacity', opacity, null

		@_s[6] = opacity

	#
	#	Text Shadow
	#

	getTextShadowH: ->

		@_s[7]

	setTextShadowH: (h) ->

		@_s[7] = h

		do @setTextShadow

	getTextShadowV: ->

		@_s[8]

	setTextShadowV: (v) ->

		@_s[8] = v

		do @setTextShadow

	getTextShadowBlur: ->

		@_s[9]

	setTextShadowBlur: (blur) ->

		@_s[9] = blur

		do @setTextShadow

	getTextShadowColor: ->

		[@_s[10], @_s[11], @_s[12]]

	setTextShadowColor: (colorRed, colorGreen, colorBlue) ->

		@_s[10] = colorRed
		@_s[11] = colorGreen
		@_s[12] = colorBlue

		do @setTextShadow

	#
	#	Transforms
	#
	#	Rotate
	#

	getRotateX: ->

		@_s[13]

	setRotateX: (rotateX) ->

		@_s[13] = rotateX

		do @setTransform

	getRotateY: ->

		@_s[14]

	setRotateY: (rotateY) ->

		@_s[14] = rotateY

		do @setTransform

	getRotateZ: ->

		@_s[15]

	setRotateZ: (rotateZ) ->

		@_s[15] = rotateZ

		do @setTransform

	#
	#	Translate
	#

	getTranslateX: ->

		@_s[16]

	setTranslateX: (translateX) ->

		@_s[16] = translateX

		do @setTransform

	getTranslateY: ->

		@_s[17]

	setTranslateY: (translateY) ->

		@_s[17] = translateY

		do @setTransform

	getTranslateZ: ->

		@_s[18]

	setTranslateZ: (translateZ) ->

		@_s[18] = translateZ

		do @setTransform

	#
	#	Scale
	#

	getScaleX: ->

		@_s[19]

	setScaleX: (scaleX) ->

		@_s[19] = scaleX

		do @setTransform

	getScaleY: ->

		@_s[20]

	setScaleY: (scaleY) ->

		@_s[20] = scaleY

		do @setTransform

	getScaleZ: ->

		@_s[21]

	setScaleZ: (scaleZ) ->

		@_s[21] = scaleZ

		do @setTransform

	#
	#	Skew
	#

	getSkewX: ->

		@_s[22]

	setSkewX: (skewX) ->

		@_s[22] = skewX

		do @setTransform

	getSkewY: ->

		@_s[23]

	setSkewY: (skewY) ->

		@_s[23] = skewY

		do @setTransform

	#
	#	perspective
	#

	getPerspective: ->

		@_s[24]

	setPerspective: (perspective) ->

		@_s[24] = perspective

		do @setTransform

