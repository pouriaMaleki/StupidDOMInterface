module.exports = class StupidDOMInterface

	constructor: (@el) ->

		@_s = new Float32Array 25

		# initialize transform values
		@_s[19] = 1
		@_s[20] = 1
		@_s[21] = 1
		@_s[24] = 1000000

	setSimple: (title, value, param) ->

		if param isnt null

			value = value + param

		@el.style[title] = value

	setTextShadow: ->

		@el.style.textShadow = (@_s[7] + 'px') + ' ' + (@_s[8] + 'px') + ' ' + (@_s[9] + 'px') + ' ' + ('rgb(' + @_s[10] + ',' + @_s[11] + ',' + @_s[12] + ')')

	setTransform: ->

		# TODO ms and moz

		@el.style.webkitTransform = ' rotateX(' + @_s[13] + 'deg) rotateY(' + @_s[14] + 'deg) rotateZ(' + @_s[15] + 'deg)' + ' translate3d(' + @_s[16] + 'px,' + @_s[17] + 'px,' + @_s[18] + 'px)' + ' scale3d(' + @_s[19] + ',' + @_s[20] + ',' + @_s[21] + ')' + ' skew(' + @_s[22] + 'deg,' + @_s[23] + 'deg)' + ' perspective(' + @_s[24] + ')'


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

